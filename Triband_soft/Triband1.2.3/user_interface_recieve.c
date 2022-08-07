/*
 * user_interface_recieve.c
 *
 *  Created on: Mar 13, 2019
 *      Author: FCS-RN5
 */
#include "user_interface_recieve.h"
#include "driverlib/sysctl.h"
#include "global.h"
#include "errors.h"
#include "systemFunctions.h"
#include "othInterfaceHandler.h"
char data_new[1800];
int32_t data_new_conter = 0;
extern repeater_board gTriband_board;
extern final_attn_band band_runtime_attn[4];
//extern struct ad9361_rf_phy  *ad9361_phy[8];
extern eLED_STATE gLed_State;
extern hump_data gHumpInfo_50t[MAX_TOTAL_HUMP_ON_FPGA];//max  humps for all bands
extern hump_data gHumpInfo_35t[MAX_TOTAL_HUMP_ON_FPGA];
/*
 * j : the value of counter from which the function will start countingfurther for parameter
 * a : the character to be searched within the string
 * *str: the real string that has to be parsed for fetching the data within
 *
 * returns pointer to the parsed data in *char format to the first location of it
 */
/*
char* call_parser(int j, char a, char *str)
{
	int counter = 0;
	while(!(str[j+1]>= 'a' && str[j+1]<= 'z'))
	{
		counter++;
		j++;
	}
	char * dest = malloc(counter);
	char * new = strchr(str, a);
	new++;
	strncpy(dest, new, counter);
	free(new);
	return &dest[0];
}
*/
void Send_data_to_usb(uint8_t *reply_data, int size_n)
{
	int loop =0 ;
	while(size_n >= 0)
	{
		SendCharUSB(&reply_data[loop*64]);
		size_n -=64;
		loop++;
		if(size_n <= 0)
			break;
	}
	free(reply_data);
}
/*
 * parameter_passed: the string that has been recieved from the GUI
 *the buffer is collected as the USB communicates in 64 bytes block so it is needed to put them in buffer
 *
 */
int giBuf_cnter=0;
char gcBuf_usb[384];//MAX_BUFFER_SIZE_OF_RECV_DATA
int giExpected_gui_datalen=0;
int giRecvd_gui_len=0;

void collect_data_in_buffer(char *ptrIndata){
    memset((char *)&gcBuf_usb[giBuf_cnter*64],'0',64);
    memcpy((char *)&gcBuf_usb[giBuf_cnter*64],ptrIndata,64);
    giBuf_cnter++;
    giRecvd_gui_len=giBuf_cnter*64;
    if(giBuf_cnter==1){
        sup_header *head=(sup_header *)gcBuf_usb;
        giExpected_gui_datalen=head->datalen;
        if(giExpected_gui_datalen > 384){
            giBuf_cnter=0;//not valid data
            giExpected_gui_datalen=0;
            giRecvd_gui_len=0;
        }
    }
    if(giRecvd_gui_len>=giExpected_gui_datalen){
        //last packet recved
        giBuf_cnter=0;
        giExpected_gui_datalen=0;
        giRecvd_gui_len=0;
        //raise the flag in main to process the data
        giflgDataRecved=1;
    }
    if(giRecvd_gui_len>=384){//all four packet recved
        giBuf_cnter=0;
        giExpected_gui_datalen=0;
        giRecvd_gui_len=0;
    }
}

/*
 * parameter_passed: the string that has been recieved from the GUI
 *
 * returns 0 if sucessfull
 * 				else error codes with negative sign
 */
extern int grecCount;
extern int gmaxC;

int parse_string()
 {


   // struct ad9361_rf_phy *mphy;
    char send_buff[1024];
	//memcpy(&head, &parameter_passed[0], sizeof(sup_header));
	//memcpy(&hd, &parameter_passed[sizeof(sup_header)], sizeof(header));
	//,struct ad9361_rf_phy *phy, eCOMMANDS cmd
    sup_header *head=(sup_header *)gcBuf_usb;
    header *hd=(header *)(gcBuf_usb+sizeof(sup_header));
	int cmd=head->COMMANDS;
	int bandnum=hd->band_num;
	int hump_num=hd->hump_no;
	memset(send_buff,0,sizeof(send_buff));
	memcpy(send_buff,&gcBuf_usb[0],sizeof(sup_header));
	switch (cmd) {
	case GET_SYSTEM_DETAIL:{
	   char OutData[200];
	   int len=200;
	    system_details sys_det;
	    get_system_info(&sys_det);
	    if(convertToString(MESG_CATEGORY_SYS_CONFIG_DATA,(void *)&sys_det,sys_det.part_number,OutData,&len)==0){
            memcpy((char *)&send_buff[sizeof(sup_header)],(char *)OutData,len);
            usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header));
	    }
	}
		break;

	case SET_SYSTEM_DETAIL:{
	    system_details sd;
	    int retval=0;
	       char OutData[200];
	       int len=200;

	    if((retval=stringToStruct(MESG_CATEGORY_SYS_CONFIG_DATA, &gcBuf_usb[sizeof(sup_header)],&sd))!=-1){
	        set_system_info(&sd);
	    if(convertToString(MESG_CATEGORY_SYS_CONFIG_DATA,(void *)&sd,sd.part_number,OutData,&len)==0){
	            memcpy((char *)&send_buff[sizeof(sup_header)],(char *)OutData,len);
	            usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header));
	        }
	    if(retval==1){
	        //restart system
	    }
	    }
		//free(parameter_passed);
		break;
	}
	case get_band_calib_data:{
        char OutData[200];
        int len=200;

	    if((bandnum>0)&&(bandnum<5)){
	           read_all_data();
	            band_data *repeater_band=&gTriband_board.repeater_band[bandnum-1];

	      //  int adnum=bandnum*2; //for ad selection on uplink 0,2,4,6 number ad for uplink
	      //  mphy=ad9361_phy[adnum];//write UL DL Logic
	     //   system_calibration_uplink(&gTriband_board.repeater_band[bandnum-1].calib_data_ar_ul, &gTriband_board.repeater_band[0],  mphy);
	        //int16_t *calibdata=  &gTriband_board.repeater_band[bandnum-1].calib_data_ar_ul[0];
	        if(convertToString(MESG_CATEGORY_CALIB_DATA,(void *)repeater_band,gTriband_board.sys_detail.part_number,OutData,&len)==0){
	            memcpy((char *)&send_buff[sizeof(sup_header)],(char *)hd,sizeof(header));
	            memcpy((char *)&send_buff[sizeof(sup_header)+sizeof(header)],(char *)OutData,len);
	            usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));

	        }
	    }

		//free(parameter_passed);
	}
		break;
    case set_band_calib_data:{
        char OutData[200];
         int len=200;
         band_data bd;
        if((bandnum>0)&&(bandnum<5)){
            bandnum=bandnum;

         }
        else
            return -1;
        band_data *repeater_band=&gTriband_board.repeater_band[bandnum-1];
        memcpy((char *)&bd,(char *)repeater_band,sizeof(band_data));
        if(stringToStruct(MESG_CATEGORY_CALIB_DATA, &gcBuf_usb[sizeof(sup_header)+sizeof(header)],&bd)==0){
             if(set_calib_info(bandnum,(band_data *)&bd)==-1){
                 memcpy((char *)&send_buff[sizeof(sup_header)],(char *)hd,sizeof(header));
                 memcpy((char *)&send_buff[sizeof(sup_header)+sizeof(header)],(char *)"ERROR",5);
                 usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));
                 return 0;
             }
            // if(mphy!=NULL)
             //    applying_data_board(&band_runtime_attn[bandnum], &gTriband_board.repeater_band[bandnum],  bandnum);
             if(convertToString(MESG_CATEGORY_CALIB_DATA,(void *)repeater_band,gTriband_board.sys_detail.part_number,OutData,&len)==0){
                 memcpy((char *)&send_buff[sizeof(sup_header)],(char *)hd,sizeof(header));
                  memcpy((char *)&send_buff[sizeof(sup_header)+sizeof(header)],(char *)OutData,len);
                  usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));
             }

        }//

       // free(parameter_passed);
    }
        break;

	case START_CALIBRATION_UL:{
        char OutData[200];
         int len=200;
	    if((bandnum>0)&&(bandnum<5)){
	        bandnum=bandnum;

	     }
	    else
	        return -1;
	    if((bandnum>-1)&&(bandnum<4)){
	           // system_calibration_downlink(&gTriband_board.repeater_band[bandnum],  bandnum);
	            band_data *repeater_band=&gTriband_board.repeater_band[bandnum-1];
	            //repeater_band->calibstateUl=1;
	          /*   if(set_calib_info(bandnum,repeater_band)==-1){
	                 memcpy((char *)&send_buff[sizeof(sup_header)],(char *)hd,sizeof(header));
	                 memcpy((char *)&send_buff[sizeof(sup_header)+sizeof(header)],(char *)"ERROR",5);
	                 usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));
	                 repeater_band->calibstateUl=0;
	                 return 0;
	             }*/
	            // grecCount=0;
	            // gmaxC=repeater_band->calib_max_uplink;

                memcpy((char *)&send_buff[sizeof(sup_header)],(char *)hd,sizeof(header));
                memcpy((char *)&send_buff[sizeof(sup_header)+sizeof(header)],(char *)OutData,len);
                usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));

	    }
		//free(parameter_passed);
	}
		break;
	case START_CALIBRATION_DL:{
        char OutData[200];
         int len=200;
        if((bandnum>0)&&(bandnum<5)){
            bandnum=bandnum;

         }
        else
            return -1;
        if((bandnum>-1)&&(bandnum<4)){
            //system_calibration_downlink(&gTriband_board.repeater_band[bandnum],  bandnum);
            // system_calibration_downlink(&gTriband_board.repeater_band[bandnum],  bandnum);
             band_data *repeater_band=&gTriband_board.repeater_band[bandnum-1];
             //if(repeater_band->calibstate==1)
            // repeater_band->calibstateDl=1;
            /* if(set_calib_info(bandnum,repeater_band)==-1){
                  memcpy((char *)&send_buff[sizeof(sup_header)],(char *)hd,sizeof(header));
                  memcpy((char *)&send_buff[sizeof(sup_header)+sizeof(header)],(char *)"ERROR",5);
                  usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));
                  repeater_band->calibstateDl=0;
                  return 0;
              }
              */
            // grecCount=0;
             //gmaxC=repeater_band->calib_max_downlink;

             memcpy((char *)&send_buff[sizeof(sup_header)],(char *)hd,sizeof(header));
             memcpy((char *)&send_buff[sizeof(sup_header)+sizeof(header)],(char *)OutData,len);
             usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));

        }
	    break;
	}
	case get_band_detail:{
	       char OutData[200];
	       int len=200;
	       // system_details sys_det;
	       if((bandnum>0)&&(bandnum<5)){
	           bandnum=bandnum;

	       }
	       else
	           return -1;
	       read_all_data();
	        band_data *repeater_band=&gTriband_board.repeater_band[bandnum-1];
	        repeater_band->bandType=bandnum;
	        if(convertToString(MESG_CATEGORY_BAND_DATA,(void *)repeater_band,gTriband_board.sys_detail.part_number,OutData,&len)==0){

                memcpy((char *)&send_buff[sizeof(sup_header)],(char *)hd,sizeof(header));
	            memcpy((char *)&send_buff[sizeof(sup_header)+sizeof(header)],(char *)OutData,len);
	            usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));
	        }
     		//free(parameter_passed);
	}
		break;

	case set_band_detail:{
	    int retval=0;
	    int max_hump=0;
        char OutData[200];
        int len=200;

	    band_data bd;
        int adnum=0;
        if((bandnum<1)&&(bandnum>4))
            return -1;
        if(bandnum==1)
            max_hump=gTriband_board.sys_detail.max_hump_1;
        else if(bandnum==2)
            max_hump=gTriband_board.sys_detail.max_hump_2;
        else if(bandnum==3)
            max_hump=gTriband_board.sys_detail.max_hump_3;
        else if(bandnum==4)
            max_hump=gTriband_board.sys_detail.max_hump_4;


       // DECODE_AD_NUMBER(bandnum,1,adnum);
      //  mphy=ad9361_phy[adnum];//write UL DL Logic
        band_data *repeater_band=&gTriband_board.repeater_band[bandnum-1];
        memcpy((char *)&bd,(char *)repeater_band,sizeof(band_data));

        if((retval=stringToStruct(MESG_CATEGORY_BAND_DATA, &gcBuf_usb[sizeof(sup_header)+sizeof(header)],&bd))!=-1){
            repeater_band->bandType=bandnum;
            repeater_band->bandnum=bandnum;
            if(bd.total_hump>max_hump){
                bd.total_hump=max_hump;
            }
             if(set_band_info(bandnum,(band_data *)&bd)==-1){
                 memcpy((char *)&send_buff[sizeof(sup_header)],(char *)hd,sizeof(header));
                 memcpy((char *)&send_buff[sizeof(sup_header)+sizeof(header)],(char *)"ERROR",5);
                 usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));
                 return 0;
             }
            // if(mphy!=NULL)
             //    applying_data_board(&band_runtime_attn[bandnum], &gTriband_board.repeater_band[bandnum],  bandnum);
             if(convertToString(MESG_CATEGORY_BAND_DATA,(void *)repeater_band,gTriband_board.sys_detail.part_number,OutData,&len)==0){
                 memcpy((char *)&send_buff[sizeof(sup_header)],(char *)hd,sizeof(header));
                  memcpy((char *)&send_buff[sizeof(sup_header)+sizeof(header)],(char *)OutData,len);
                  usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));
             }
             if(retval==1){
                 //restart system
             }

        }//
		//free(parameter_passed);
		break;
	    }
	case get_band_hump_detail:{
        char OutData[200];
        int len=200;
        int i=0;
        hump_data *humpdata=NULL;
        // system_details sys_det;
        read_all_data();
        if((bandnum>0)&&(bandnum<5)){
            if((hump_num>0)&&(hump_num<17))
                get_hump_info(bandnum,hump_num,&humpdata);
         }
        if(humpdata==NULL)
            return -1;
      //  hump_num=hump_num-1;
      //  bandnum=bandnum-1;
        if(convertToString(MESG_CATEGORY_HUMP_DATA,(void *)humpdata,gTriband_board.sys_detail.part_number,OutData,&len)==0){
             memcpy((char *)&send_buff[sizeof(sup_header)],(char *)hd,sizeof(header));
             memcpy((uint8_t *)&send_buff[sizeof(sup_header)+sizeof(header)],(char *)OutData,len);
             usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));
         }
	   // memcpy((char *)send_buff,(char *)&gcBuf_usb[0],sizeof(sup_header)+sizeof(header));
       // memcpy((char *)&send_buff[sizeof(sup_header)+sizeof(header)],(char *)&gTriband_board.repeater_band[bandnum].repHump[hump_num],sizeof(hump_data));
	//	SendCharUSB((char *)send_buff);
	}
		//free(parameter_passed);
		break;

	case set_band_hump_detail:{
	    int retval=0;
	        hump_data *humpd=NULL;
	        char OutData[200];
	        int len=200;
	        int i=0;
	        if((bandnum<0)||(bandnum>4)){
	             return -1;
	        }
	         if((hump_num<1)||(hump_num>17)){
	             return -1;
	         }
	         if((bandnum==1)||(bandnum==2)){
                 for(i=0;i<MAX_TOTAL_HUMP_ON_FPGA;i++)//max 16 humps for all bands
                 {
                     if((gHumpInfo_50t[i].band_id==bandnum)&&(gHumpInfo_50t[i].hump_id==hump_num)){
                         humpd=&gHumpInfo_50t[i];
                         break;
                     }
                 }
	         }
	         else{
                 for(i=0;i<MAX_TOTAL_HUMP_ON_FPGA;i++)//max 16 humps for all bands
                 {
                     if((gHumpInfo_35t[i].band_id==bandnum)&&(gHumpInfo_35t[i].hump_id==hump_num)){
                         humpd=&gHumpInfo_35t[i];
                         break;
                     }
                 }

	         }
	         if(humpd==NULL)
	             return -1;

	        // memcpy((char *)&humpd,(char *)&gTriband_board.repeater_band[bandnum-1].repHump[hump_num-1],sizeof(hump_data));
            if((retval=stringToStruct(MESG_CATEGORY_HUMP_DATA,(char *) &gcBuf_usb[sizeof(sup_header)+sizeof(header)],(void *)humpd))!=-1){
                humpd->hump_present=1;
                 humpd->hump_id=hump_num;
                set_hump_info(bandnum);

                sendToFpga(&gTriband_board.repeater_band[bandnum-1], bandnum, hump_num);
                if(convertToString(MESG_CATEGORY_HUMP_DATA,(void *)humpd,gTriband_board.sys_detail.part_number,OutData,&len)==0){
                    memcpy((char *)&send_buff[sizeof(sup_header)],(char *)hd,sizeof(header));

                memcpy((char *)&send_buff[sizeof(sup_header)+sizeof(header)],(char *)OutData,len);
                usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));
                }
                if(retval==1){
                    //restart system
                    bReset_board();

                }
            }
        }
		//free(parameter_passed);
		break;
	case GET_TOTAL_HUMP:
	{
        hump_data *humpd=NULL;
        char OutData[2048];
        int len=200;
        int i=0;

        if((bandnum<1)||(bandnum>4)){
             return -1;
        }
        band_data *repeater_band=&gTriband_board.repeater_band[bandnum-1];
        if(convertToString(MESG_TOTAL_HUMP_DATA,(void *)repeater_band,gTriband_board.sys_detail.part_number,OutData,&len)==0){
                            memcpy((char *)&send_buff[sizeof(sup_header)],(char *)hd,sizeof(header));
                            memcpy((char *)&send_buff[sizeof(sup_header)+sizeof(header)],(char *)OutData,len);
                            usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));
        }


         if(repeater_band==NULL)
             return -1;

	    break;
	}
	case GET_MODEM_DETAIL:{
	       char OutData[200];
	        int len=200;
	        // system_details sys_det;
	        read_all_data();
	         modem *md=&gTriband_board.modem_detail;

	        if( convertToString(MESG_CATEGORY_MODEM_DATA,(void *)md,&gTriband_board.sys_detail.part_number[0],&OutData[0],&len)==0){
	         memcpy((char *)&send_buff[sizeof(sup_header)],(char *)OutData,len);
	         usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header));
	        }
	         break;
	 }
	case SET_MODEM_DETAIL:{
        modem md;
        if(stringToStruct(MESG_CATEGORY_MODEM_DATA, &gcBuf_usb[sizeof(sup_header)],&md)==0){
            set_modem_info(&md);
        }
        break;

	}
	case GET_PROTOCOL_VERSION:{
	    char OutData[50];
	    int len=0;
	    memset(OutData,0,sizeof(OutData));
	    strcpy(OutData,",Version 1.2.3\r");
	    len=strlen(OutData);
        memcpy((char *)&send_buff[sizeof(sup_header)],(char *)OutData,len);
        usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header));

	}
	break;
	case CLEAR_HUMP_DATA:{
        char OutData[50];
        int len=0;

	    memset((char *)&gHumpInfo_50t[0],0, sizeof(gHumpInfo_50t));
	    memset((char *)&gHumpInfo_35t[0],0, sizeof(gHumpInfo_35t));
	    program_eeprom((uint32_t *)&gHumpInfo_50t[0],EEPROM_HUMP_FPGA1_ADDRESS, sizeof(gHumpInfo_50t));
        program_eeprom((uint32_t *)&gHumpInfo_35t[0],EEPROM_HUMP_FPGA2_ADDRESS, sizeof(gHumpInfo_35t));

        memset(OutData,0,sizeof(OutData));
        strcpy(OutData,",OK\r");
        len=strlen(OutData);
        memcpy((char *)&send_buff[sizeof(sup_header)],(char *)OutData,len);
        usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header));

	}
	break;
	case board_RESET:{
	    bReset_board();
	}break;
/*	case get_band2_detail:
		response_repeter(&COMPLETE_DATA.REPETER_2);
		free(parameter_passed);
		break;

	case set_band2_detail:
		applying_data_board(&repeter2, &COMPLETE_DATA.REPETER_2,
				&parameter_passed[0], gsm_par_1, gsm_par_2);
		free(parameter_passed);
		break;

	case get_band3_detail:
		buffer = malloc(sizeof(HEAD) + sizeof(COMPLETE_DATA.REPETER_3));
		memcpy(&buffer[0], (uint8_t*) &HEAD, sizeof(HEAD));
		memcpy(&buffer[sizeof(HEAD)], (uint8_t*) &COMPLETE_DATA.REPETER_3,
				sizeof(COMPLETE_DATA.REPETER_3));
		free(parameter_passed);
		break;

	case set_band3_detail:
		memcpy(&COMPLETE_DATA.REPETER_3, &parameter_passed[sizeof(HEAD)],
				sizeof(COMPLETE_DATA.REPETER_3));
		free(parameter_passed);
		break;

	case get_band4_detail:
		buffer = malloc(sizeof(HEAD) + sizeof(COMPLETE_DATA.REPETER_4));
		memcpy(&buffer[0], (uint8_t*) &HEAD, sizeof(HEAD));
		memcpy(&buffer[sizeof(HEAD)], (uint8_t*) &COMPLETE_DATA.REPETER_4,
				sizeof(COMPLETE_DATA.REPETER_4));
		free(buffer);
		break;

	case set_band4_detail:
		memcpy(&COMPLETE_DATA.REPETER_4, &parameter_passed[sizeof(HEAD)],
				sizeof(COMPLETE_DATA.REPETER_4));
		free(parameter_passed);
		break;*/
	}
	return 0;
}



int usb_string_sender(uint8_t * sending_data,int len)
 {
	/*uint8_t *flowing_data_usb = malloc(64);
	memset(flowing_data_usb, '\0', 64);
	char * breaker;
	int frames = 0, rem = 0, total = 0, i_counter = 0, packet = 0;
	char adder[] = "\r";
	strcat((char*)sending_data, adder);
	total = strlen((char*)sending_data);
	frames = total / 64;
	rem = total % 64;
	if (rem != 0) {
		frames += 1;
	} else {

		for (i_counter = 0; i_counter < frames; i_counter++) {
			breaker = strstr((char*)sending_data, (char*)&sending_data[packet * 64]);
			memmove(flowing_data_usb, breaker, 64);
			SendCharUSB(flowing_data_usb);
			packet += 1;
			SysCtlDelay(200);
		}
		goto done_state;
	}


done_state :	free(breaker);
*/
    char framedata[65];
   int frames = len / 64;
   int rem = len % 64;
   int i_counter=0;
   memset((char *)framedata,0,sizeof(framedata));
   if(len<=64){
       memcpy((char *)framedata,(char *)sending_data,len);
       SendCharUSB((uint8_t*)framedata);
       return 0;
   }
   if (rem != 0) {//make the block of 64
           frames += 1;
   }
       for (i_counter = 0; i_counter < frames; i_counter++) {
           memset(framedata,0,64);
           if(i_counter==frames-1){//last packet
               if(rem !=0)
                   memcpy((char *)framedata,(char *)&sending_data[i_counter*64],rem);
               else
                   memcpy((char *)framedata,(char *)&sending_data[i_counter*64],64);
           }
           else{
               memcpy((char *)framedata,(char *)&sending_data[i_counter*64],64);
           }
               //breaker = strstr((char*)sending_data, (char*)&sending_data[packet * 64]);
               //memmove(flowing_data_usb, breaker, 64);
               SendCharUSB((uint8_t*)framedata);
              //packet += 1;
               SysCtlDelay(200);
       }

	return 0;
}
