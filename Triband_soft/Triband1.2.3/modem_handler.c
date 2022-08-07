/*
 * modem_handler.c
 *
 *  Created on: Dec 1, 2020
 *      Author: frogcell
 */
#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include "inc/hw_memmap.h"
#include "driverlib/sysctl.h"
#include "driverlib/gpio.h"
#include "inc/hw_gpio.h"
#include "driverlib/rom.h"
#include "driverlib/rom_map.h"
#include "driverlib/pin_map.h"
#include "driverlib/uart.h"

#include "modem_handler.h"
#include "definitions.h"
#include <string.h>
#include "global.h"
#include "systemFunctions.h"
#include "eepromHandler.h"

repeater_board gTriband_board;
system_modem *myLocalmodem;//volatile variable
at_parser parse;
int g_iModem_ready=0;
//char gcModemIntBuf[2048];
//char commadArrayTcp_2g[10][10]={"ATE0\r","ATE0\r"};
//char commadArrayTcp_3g[10][10]={"ATE0\r","ATE0\r"};
//char commadArraysms[10][10]={"ATE0\r","ATE0\r"};
//char response_OK[5]={'\r','\n','O','K',};

#define SIM800_AUTOBAUD_ATTEMPTS 5
#define SIM800_WAITACK_TIMEOUT   40
#define SIM800_FTP_TIMEOUT       60
#define SET_TIMEOUT              60
#define NTP_BUF_SIZE             4
#define AT_COMMAND_LENGTH 80
#define _AT_RESPONSE_TYPE_MASK 0xff
extern hump_data gHumpInfo_50t[MAX_TOTAL_HUMP_ON_FPGA];//max  humps for all bands
extern hump_data gHumpInfo_35t[MAX_TOTAL_HUMP_ON_FPGA];

enum sim800_socket_status {
    SIM800_SOCKET_STATUS_ERROR = -1,
    SIM800_SOCKET_STATUS_UNKNOWN = 0,
    SIM800_SOCKET_STATUS_CONNECTED = 1,
};

#define SIM800_NSOCKETS                 6
#define SIM800_CONNECT_TIMEOUT          20
#define SIM800_CIPCFG_RETRIES           10

const unsigned char  AT_CGMM[]= {"AT+CGMM\r\n"};
static const char *const final_ok_responses[] = {
    "OK",
    NULL
};
static char * data_mode_error[] = {
    "RESET",
    "RING",
    "TCP CLOS",
    "CLOSED",
    "CONNECT FAIL",
    NULL
};
static char * final_responses_error[] = {
    "ERROR",
    "NO CARRIER",
    "+CME ERROR:",
    "+CMS ERROR:",
    "CONNECT FAIL",
    NULL
};

static char * sim800_urc_responses[] = {
    "RDY",              /* Assorted crap on newer firmware releases. */
    "AT",
    "+CPIN: READY",
    "SHUT OK",
    "+CREG",
    "+IPA",
    "+CSQ",
    "+NET",
    "CONN",
    "Call Ready",
    "SMS Ready",
    "NORMAL POWER DOWN",
    "UNDER-VOLTAGE POWER DOWN",
    "UNDER-VOLTAGE WARNNING",
    "OVER-VOLTAGE POWER DOWN",
    "OVER-VOLTAGE WARNNING",
    "ALREADY CONNECT",
    NULL
};
static char * sim7600_urc_responses[] = {
    "RDY",              /* Assorted crap on newer firmware releases. */
    "AT",
    "+CPIN: READY",
    "+IPA",
    "+CSQ",
    "+CREG",
    "+NET",
    "CONN",
    "+CIPEVENT",
    "Call Ready",
    "SMS Ready",
    "NORMAL POWER DOWN",
    "UNDER-VOLTAGE POWER DOWN",
    "UNDER-VOLTAGE WARNNING",
    "OVER-VOLTAGE POWER DOWN",
    "OVER-VOLTAGE WARNNING",
    NULL
};
//do not change the position of command array it will effect accumulate and validate data and init
static char * modem7600_urc_command_seq_gprs[] = {
    "ATE0\r\n",
    "AT+CPIN?\r\n",     /* check sim status */
    "AT+CGSN\r\n",      /* get IMEAI number */
    "AT+CNMP=02\r\n",  /* Tech selection */
    "AT+CSQ\r\n",        /* signal strength */
    "AT+CREG?\r\n",        /*  network resistration */
    "AT+CGDCONT=1,\"IP\",\"WWW\"\r\n",          /* APN setting */
    "AT+NETCLOSE\r",            /*Net Close */
    "AT+CSOCKSETPN=1\r\n",              /*set pin. */
    "AT+CIPMODE=1\r\n",          /* data tx mode */
    "AT+NETOPEN\r\n",
    "AT+IPADDR\r\n",
    "AT+CIPOPEN=0,\"TCP\",\"203.122.042.058\",1001\r\n",//set server ip and port
     NULL
};
//do not change the position of command array it will effect accumulate and validate data and init
static char *modem800_urc_command_seq_gprs[] = {
  "ATE0\r\n",
    "AT+CPIN?\r\n",      /* check sim status */
    "AT+GSN\r\n",      /* get IMEAI number */
    "AT+CSQ\r\n",        /* signal strength */
    "AT+CREG?\r",        /*  network resistration */
   // "AT+CGDCONT=1,\"IP\",\"WWW\"\r\n",          /* APN setting */
    "AT+CIPSHUT\r\n",
    "AT+CENG=1\r\n",
    "AT+CIPMODE=1\r\n",
    "AT+CSTT=\"airtelgprs.com\"\r\n",/* APN setting */


//    "AT+CPAS\r",            /*Net Close */
//    "AT+COPS?\r\n",          /* data tx mode */
//   "AT+CENG?\r",              /*set pin. */
//    "AT+CSTT=\"www\"\r\n",//APN set

    "AT+CIPSHUT\r\n",
    "AT+SAPBR=3,1,\"CONTYPE\",\"GPRS\"\r\n",//set server ip and port
    "AT+CIPMUX=0\r\n",
   // "AT+CIFSR\r\n",
    "AT+CIPSTART=\"TCP\",\"203.122.042.058\",\"1001\"\r\n",
    NULL
};
//do not change the position of command array it will effect accumulate and validate data and init
static char *modem800_urc_command_seq_sms[] = {
    "ATE0\r\n",
    "AT+CPIN=?",      /* check PIN status */
    "AT+CGSN",      /* get IMEAI number */
    "AT+CENG=1\r",  /* switch on engineering mode */
    "AT+CREG?\r",        /*  network resistration */
    "AT+CMGF=1\r",        /* signal strength */
     NULL
};
//do not change the position of command array it will effect accumulate and validate data and init
static char *modem7600_urc_command_seq_sms[] = {
    "ATE0\r\n",
    "AT+CPIN=?",      /* check PIN status */
    "AT+CGSN",      /* get IMEAI number */
    "AT+CPSI?\r",  /* URFCN LAC CELL ETC */
    "AT+CMGF=1\r",        /* signal strength */
     NULL
};

enum at_response_type {
    AT_RESPONSE_UNEXPECTED = -1,    /**< Unexpected line; usually an unhandled URC. */
    AT_RESPONSE_UNKNOWN = 0,        /**< Pass the response to next parser in chain. */
    AT_RESPONSE_INTERMEDIATE,       /**< Intermediate response. Stored. */
    AT_RESPONSE_FINAL_OK,           /**< Final response. NOT stored. */
    AT_RESPONSE_ERROR,              /**< Final response. Stored. */
    AT_RESPONSE_URC,                /**< Unsolicited Result Code. Passed to URC handler. */
 };
static enum at_response_type scanner_ok(const char *line);
void responseImmediate(){
    myLocalmodem->parser->at_response_OK=1;
    myLocalmodem->mExpectedTime=gL_currentTime+1;
}
void parser_include_line(at_parser *parser)
{
    /* Append a newline. */
    parser_append(parser, '\n');

    /* Advance the current command pointer to the new position. */
    parser->buf_current = parser->buf_used;
}
bool at_prefix_in_table(const char *line, const char *const table[])
{
    int i=0;
    for ( i=0; table[i] != NULL; i++)
        if (!strncmp(line, table[i], strlen(table[i])))
            return true;

    return false;
}
static void parser_append(at_parser *parser, char ch)
{
    if(parser==0)
        return;
    if (parser->buf_used < parser->buf_size-1)
        parser->buf[parser->buf_used++] = ch;
}

static enum at_response_type generic_line_scanner(const char *line, int len,  at_parser *parser)
{
    (void) len;
void *table;
    //if (parser->state == STATE_DATAPROMPT)
    //    if (len == 2 && !memcmp(line, "> ", 2))
    //        return AT_RESPONSE_FINAL_OK;
table=sim800_urc_responses;
if( myLocalmodem->tech_mode==M7600_GPRS)
    table=sim7600_urc_responses;
    if (at_prefix_in_table(line, table))
        return AT_RESPONSE_URC;
    else if (at_prefix_in_table(line, final_ok_responses))
        return AT_RESPONSE_FINAL_OK;
    else if (at_prefix_in_table(line, final_responses_error))
        return AT_RESPONSE_ERROR;
    else if(scanner_ok(line))
        return AT_RESPONSE_FINAL_OK;
    else
        return AT_RESPONSE_INTERMEDIATE;
}
void at_parser_reset( at_parser *parser)
{
    //parser->state = STATE_IDLE;
   // parser->expect_dataprompt = false;
    parser->buf_used = 0;
    parser->buf_current = 0;
    parser->data_left = 0;
    parser->buf_size = 2048;
  //  parser->at_response_type=AT_RESPONSE_INTERMEDIATE;
}
static void parser_finalize( at_parser *parser)
{
    /* Remove the last newline, if any. */
    if (parser->buf_used > 0)
        parser->buf_used--;

    /* NULL-terminate the response. */
    parser->buf[parser->buf_used] = '\0';
}
void accumelateData(char *buf,int len){
    int local_var=myLocalmodem->present_command_issued;
    if(myLocalmodem->tech_mode==M800_SMS){
          // if(mdm->present_command_issued==0)
       }
       else if(myLocalmodem->tech_mode==M7600_SMS){
           if(local_var==0){//Modem Not Started then ATE0 responnse is OK otherwise ATE0 then OK
               if(len>=2)
                   myLocalmodem->parser->at_response_OK=1;
           }
       }
       else if(myLocalmodem->tech_mode==M800_GPRS){
          if(local_var==2){//for reading IMEAI special case does not contain +CSQ like charecter
              if(len==13){//in response only giving number and OK
                  responseImmediate();
                  memcpy(gTriband_board.modem_detail.IMEI,buf,len);
              }
          }
          else if((local_var==6)||(local_var==7)||(local_var==8)||(local_var==11)||(local_var==10)){//set apn command, CIPMUX
              if (!strncmp(buf, "OK", 2))//if data is OK release this
                  responseImmediate();
          }
       }
       else if(myLocalmodem->tech_mode==M7600_GPRS){// local_var=10 for netopen
           if((local_var==0)||(local_var==3)||(local_var==4)||(local_var==5)||(local_var==6)||(local_var==8)||(local_var==9)){//Modem Not Started then ATE0 responnse is OK otherwise ATE0 then OK
               if (!strncmp(buf, "OK", 2))
                      myLocalmodem->parser->at_response_OK=1;
           }
           else if( local_var==2){//for reading IMEAI special case does not contain +CSQ like charecter
                 if(len>=16){ //in response only giving number and OK
                     memcpy(gTriband_board.modem_detail.IMEI,buf,len);
                    responseImmediate();
                 }
           }
           else if(local_var==7){//NETCLOSE RESPONSE
               if (!strncmp(buf, "ERROR", 5))
                   //sprintf("NET ALREADY CLOSED")
                     myLocalmodem->parser->at_response_OK=1;
               if (!strncmp(buf, "OK", 2))
                   myLocalmodem->parser->at_response_OK=1;
           }

       }
}
int parse_modem_receive_data(char *mdm_data)
 {


   // struct ad9361_rf_phy *mphy;
    char send_buff[255];
    //memcpy(&head, &parameter_passed[0], sizeof(sup_header));
    //memcpy(&hd, &parameter_passed[sizeof(sup_header)], sizeof(header));
    //,struct ad9361_rf_phy *phy, eCOMMANDS cmd
    sup_header *head=(sup_header *)mdm_data;
    header *hd=(header *)(mdm_data+sizeof(sup_header));
    int cmd=head->COMMANDS;
    int bandnum=hd->band_num;
    int hump_num=hd->hump_no;
    memset(send_buff,0,sizeof(send_buff));
    memcpy(send_buff,&mdm_data[0],sizeof(sup_header));
    switch (cmd) {
    case GET_SYSTEM_DETAIL:{
       char OutData[200];
       int len=200;
        system_details sys_det;
        get_system_info(&sys_det);
        if(convertToString(MESG_CATEGORY_SYS_CONFIG_DATA,(void *)&sys_det,sys_det.part_number,OutData,&len)==0){
            memcpy((char *)&send_buff[sizeof(sup_header)],(char *)OutData,len);
           // usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header));
        }
    }
        break;

    case SET_SYSTEM_DETAIL:{
        system_details sd;
        int retval=0;
           char OutData[200];
           int len=200;

        if((retval=stringToStruct(MESG_CATEGORY_SYS_CONFIG_DATA, &mdm_data[sizeof(sup_header)],&sd))!=-1){
            set_system_info(&sd);
        if(convertToString(MESG_CATEGORY_SYS_CONFIG_DATA,(void *)&sd,sd.part_number,OutData,&len)==0){
                memcpy((char *)&send_buff[sizeof(sup_header)],(char *)OutData,len);
               // usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header));
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
               // usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));

            }
        }

        //free(parameter_passed);
    }
        break;

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
              //  usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));
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

        if((retval=stringToStruct(MESG_CATEGORY_BAND_DATA, &mdm_data[sizeof(sup_header)+sizeof(header)],&bd))!=-1){
            repeater_band->bandType=bandnum;
            repeater_band->bandnum=bandnum;
            if(bd.total_hump>max_hump){
                bd.total_hump=max_hump;
            }
             if(set_band_info(bandnum,(band_data *)&bd)==-1){
                 memcpy((char *)&send_buff[sizeof(sup_header)],(char *)hd,sizeof(header));
                 memcpy((char *)&send_buff[sizeof(sup_header)+sizeof(header)],(char *)"ERROR",5);
              //   usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));
                 return 0;
             }
            // if(mphy!=NULL)
             //    applying_data_board(&band_runtime_attn[bandnum], &gTriband_board.repeater_band[bandnum],  bandnum);
             if(convertToString(MESG_CATEGORY_BAND_DATA,(void *)repeater_band,gTriband_board.sys_detail.part_number,OutData,&len)==0){
                 memcpy((char *)&send_buff[sizeof(sup_header)],(char *)hd,sizeof(header));
                  memcpy((char *)&send_buff[sizeof(sup_header)+sizeof(header)],(char *)OutData,len);
                  //usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));
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
             //usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));
         }
       // memcpy((char *)send_buff,(char *)&gcBuf_usb[0],sizeof(sup_header)+sizeof(header));
       // memcpy((char *)&send_buff[sizeof(sup_header)+sizeof(header)],(char *)&gTriband_board.repeater_band[bandnum].repHump[hump_num],sizeof(hump_data));
    //  SendCharUSB((char *)send_buff);
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
            if((retval=stringToStruct(MESG_CATEGORY_HUMP_DATA,(char *) &mdm_data[sizeof(sup_header)+sizeof(header)],(void *)humpd))!=0){
                humpd->hump_present=1;
                 humpd->hump_id=hump_num;
                set_hump_info(bandnum);

                sendToFpga(&gTriband_board.repeater_band[bandnum-1], bandnum, hump_num);
                if(convertToString(MESG_CATEGORY_HUMP_DATA,(void *)humpd,gTriband_board.sys_detail.part_number,OutData,&len)==0){
                    memcpy((char *)&send_buff[sizeof(sup_header)],(char *)hd,sizeof(header));

                memcpy((char *)&send_buff[sizeof(sup_header)+sizeof(header)],(char *)OutData,len);
               // usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));
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
                            //usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header)+sizeof(header));
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
            // usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header));
            }
             break;
     }
    case SET_MODEM_DETAIL:{
        modem md;
        if(stringToStruct(MESG_CATEGORY_MODEM_DATA, &mdm_data[sizeof(sup_header)],&md)==0){
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
       // usb_string_sender((uint8_t *)&send_buff,len+sizeof(sup_header));

    }
    break;



    }
    return 0;
}

static void parser_handle_data_mode(at_parser *parser){
    void *table;
    if (parser->buf_used == parser->buf_current)
            return;

        /* NULL-terminate the response .*/
        parser->buf[parser->buf_used] = '\0';

        /* Extract line address & length for later use. */
        const char *line = parser->buf + parser->buf_current;
        size_t len = parser->buf_used - parser->buf_current;


        //if (parser->state == STATE_DATAPROMPT)
        //    if (len == 2 && !memcmp(line, "> ", 2))
        //        return AT_RESPONSE_FINAL_OK;
    table=data_mode_error;
    if (at_prefix_in_table(line, table)){
        at_parser_reset(myLocalmodem->parser);
        myLocalmodem->parser->at_response_OK=0;
        myLocalmodem->modem_mode=NETWORK_MODE;
        myLocalmodem->modem_command_status=IN_RESET;
    }


}
static void parser_handle_line( at_parser *parser)
{
    /* Skip empty lines. */
    if (parser->buf_used == parser->buf_current)
        return;

    /* NULL-terminate the response .*/
    parser->buf[parser->buf_used] = '\0';

    /* Extract line address & length for later use. */
    const char *line = parser->buf + parser->buf_current;
    size_t len = parser->buf_used - parser->buf_current;

    /* Log the received line. */
  //  printf("< '%.*s'\n", (int) len, line);

    /* Determine response type. */
    enum at_response_type type = AT_RESPONSE_UNKNOWN;
 //   if (parser->cbs->scan_line)
 //       type = parser->cbs->scan_line(line, len, parser->priv);
    if (!type)
        type = generic_line_scanner(line, len, parser); //+CIPEVENT: NETWORK CLOSED UNEXPECTEDLY
    int valid=0;
    if (!strcmp(line, "PB DONE"))
        g_iModem_ready=1;
    if((myLocalmodem->tech_mode==M7600_GPRS)&&(myLocalmodem->present_command_issued==7)){//special case in ERRROR
        parser_finalize(myLocalmodem->parser);
        myLocalmodem->parser->at_response_OK=1;
        return;
    }
    /* Expected URCs and all unexpected lines are sent to URC handler. */
    if (type == AT_RESPONSE_URC)
    {
        /* Fire the callback on the URC line. */
      //  parser->cbs->handle_urc(parser->buf + parser->buf_current,
      //                          parser->buf_used - parser->buf_current,
       //                         parser->priv);

        /* Discard the URC line from the buffer. */
       // parser_discard_line(parser);
        if(validateData(parser->buf + parser->buf_current,parser->buf_used - parser->buf_current)==true)
            responseImmediate();

        myLocalmodem->parser->buf_used = myLocalmodem->parser->buf_current;
       // myLocalmodem->parser->at_response_OK=1;

    }
    else{
        /* Accumulate everything that's not a final OK. */
        if (myLocalmodem->parser->buf_used < myLocalmodem->parser->buf_size-1)
              myLocalmodem->parser->buf[parser->buf_used++] = '\n';
          accumelateData(parser->buf + parser->buf_current,parser->buf_used - parser->buf_current);

        if (type != AT_RESPONSE_FINAL_OK) {
            /* Include the line in the buffer. */
            //parser_include_line(parser);
              myLocalmodem->parser->buf_current = myLocalmodem->parser->buf_used;
        } else {
            /* Discard the line from the buffer. */
            //parser_discard_line(parser);
            myLocalmodem->parser->buf_used = myLocalmodem->parser->buf_current;
        }

        /* Act on the response type. */
        switch (type & _AT_RESPONSE_TYPE_MASK) {
            case AT_RESPONSE_FINAL_OK:
            case AT_RESPONSE_ERROR:
            {
                /* Fire the response callback. */
                parser_finalize(myLocalmodem->parser);
                if(type==AT_RESPONSE_ERROR)
                    myLocalmodem->parser->at_response_OK=0;

             //   parser->cbs->handle_response(parser->buf, parser->buf_used, parser->priv);

                /* Go back to idle state. */
                at_parser_reset(myLocalmodem->parser);

            }
            break;

            default:
            {
                /* Keep calm and carry on. */
            }
            break;
        }
    }


}

static enum at_response_type scanner_cipsend(const char *line)
{
    int connid, amount;
    char last;
    if (sscanf(line, "DATA ACCEPT:%d,%d", &connid, &amount) == 2)
        return AT_RESPONSE_FINAL_OK;
    if (sscanf(line, "%d, SEND O%c", &connid, &last) == 2 && last == 'K')
        return AT_RESPONSE_FINAL_OK;
    if (sscanf(line, "%d, SEND FAI%c", &connid, &last) == 2 && last == 'L')
        return AT_RESPONSE_ERROR;
    if (!strcmp(line, "SEND OK"))
        return AT_RESPONSE_FINAL_OK;
    if (!strcmp(line, "SEND FAIL"))
        return AT_RESPONSE_ERROR;
    return AT_RESPONSE_UNKNOWN;
}
static enum at_response_type scanner_ok(const char *line)
{
    if (!strcmp(line, "OK"))
        return AT_RESPONSE_FINAL_OK;
    return AT_RESPONSE_UNKNOWN;
}


static int at_command(char *data){

}
static int sim800_config(const char *option, const char *value, int attempts)
{
    //at_set_timeout(modem->at, 10);
    int i=0;
   char data[50];
    for ( i=0; i<attempts; i++) {
        /* Blindly try to set the configuration option. */
        sprintf(data, "AT+%s=%s",option, value);
        at_command(data);

        /* Query the setting status. */
        const char *response = sprintf(data, "AT+%s?",option);
        /* Bail out on timeouts. */
        if (response == NULL)
            return -1;

        /* Check if the setting has the correct value. */
        char expected[16];
        if (snprintf(expected, sizeof(expected), "+%s: %s", option, value) >= (int) sizeof(expected)) {
        //    errno = -1;
            return -1;
        }
        if (!strcmp(response, expected))
            return 0;


    }

  //  errno = -1;
    return -1;
}
void sendCommandToModem(char *data){
    //reset modem
    char *ptrTemp=data;
    while(ptrTemp){
        UARTCharPut(UART2_BASE, *ptrTemp);
        ptrTemp++;
    }
}
void sendDataToModem(char *data,int len){
    int i=0;
for(i=0;i<len;i++)
    UARTCharPut(UART2_BASE, data[i]);
}
int initmodem(system_modem *mdm){
    //reset modem
    int i = 0;
    myLocalmodem=mdm;
    mdm->parser=&parse;
    myLocalmodem->parser=&parse;
    mdm->check_m_cntr=0;
    mdm->check_u_cntr=0;
    mdm->modem_mode=NETWORK_MODE;
    mdm->modem_command_status=IN_RESET;
    mdm->prev_command_issued=myLocalmodem->present_command_issued=-1;
    at_parser_reset(mdm->parser);mdm->retry_cnt=0;
    mdm->mExpectedTime=gL_currentTime;
    gTriband_board.modem_detail.modem_tech=1;//hardcodede for test
    if (gTriband_board.modem_detail.modem_tech==0){//0 for 2g 800 modems 1 for 4G
        if(gTriband_board.modem_detail.modem_mode==0){// for gprs
            mdm->tech_mode=M800_GPRS;
        }
        else{//for sms
            mdm->tech_mode=M800_SMS;
        }
    }
    else{//for 4g
        if(gTriband_board.modem_detail.modem_mode==0){// for gprs
            mdm->tech_mode=M7600_GPRS;
        }
        else{//for sms
            mdm->tech_mode=M7600_SMS;
        }

    }
    if(mdm->tech_mode==M800_SMS){
        myLocalmodem->modem_cmds=modem800_urc_command_seq_sms;
        i=0;
        while (modem800_urc_command_seq_sms[i] != NULL) {
            i++;
        }
        myLocalmodem->command_len=i;
    }
    else if(mdm->tech_mode==M7600_SMS){
        myLocalmodem->modem_cmds=modem7600_urc_command_seq_sms;
        i=0;
        while (modem7600_urc_command_seq_sms[i] != NULL) {
            i++;
        }
        myLocalmodem->command_len=i;
    }
    else if(mdm->tech_mode==M800_GPRS){
        myLocalmodem->modem_cmds=&modem800_urc_command_seq_gprs[0];
        i=0;
        while (modem800_urc_command_seq_gprs[i] != NULL) {
            i++;
        }
        myLocalmodem->command_len=i;
    }
    else if(mdm->tech_mode==M7600_GPRS){
        myLocalmodem->modem_cmds=modem7600_urc_command_seq_gprs;
        i=0;
        while (modem7600_urc_command_seq_gprs[i] != NULL) {
            i++;
        }
        myLocalmodem->command_len=i;
        //change at command for APN and tcp
    }
   // if (sim800_config("CIPMUX", "1", SIM800_CIPCFG_RETRIES) != 0)
   //       return -1;
}
void modem_timer_hadler(){
    char **ptrTemp;
  //  mymodem.modem_cmds
    switch(myLocalmodem->modem_mode){
      case NETWORK_MODE:{
         if(myLocalmodem->modem_command_status!=myLocalmodem->prev_command_issued){
             //send new command to modem if modem_resp is OK
             if(myLocalmodem->modem_resp==1){

             }
         }
          break;
      }
      case DATA_MODE:
         // parse_data_mode(mdm);
          break;
      }
}
bool validateData(char *line,int len){
    if(myLocalmodem->tech_mode==M800_SMS){
       // if(mdm->present_command_issued==0)
    }
    else if(myLocalmodem->tech_mode==M7600_SMS){
    }
    else if(myLocalmodem->tech_mode==M800_GPRS){
        //if (at_prefix_in_table(line, sim800_urc_responses))
        //     return true;
        if(myLocalmodem->present_command_issued==3){//CSQ command
            //search :
        }
        if(myLocalmodem->present_command_issued==4){//CREG command
                    //search :
        }
        if(myLocalmodem->present_command_issued==12){
            if (!strncmp(line, "CONNECT", 7)){
                at_parser_reset(myLocalmodem->parser);
                myLocalmodem->modem_mode=DATA_MODE;
                return true;
            }
            else
                return false;
        }
        return true;
    }
    else if(myLocalmodem->tech_mode==M7600_GPRS){


       if(myLocalmodem->present_command_issued==1){//1 +CPIN: READY
           return true;
       }
       else if(myLocalmodem->present_command_issued==4){//CSQ command //search
           return true;
       }
       else if(myLocalmodem->present_command_issued==5){//5 response of creg +CREG 0,1
           return true;
       }
       else if(myLocalmodem->present_command_issued==10){//for +NETOPEN: 0 for success
           return true;
       }
       else if(myLocalmodem->present_command_issued==11){ //11 for +IPADDR: 192
          if(!strcmp(line,"NETWORK CLOSED"))
              return false;
          else
              return true;
       }
       else{
           return true;
       }
    }

    return true;
}
void modem_uart_handler(){
    uint32_t ui32Status;
       ui32Status = UARTIntStatus(UART2_BASE, true);
       UARTIntClear(UART2_BASE, ui32Status);

       at_parser *parser=myLocalmodem->parser;
       while (UARTCharsAvail(UART2_BASE)) {
           char ch = UARTCharGetNonBlocking(UART2_BASE);
           if ((ch != '\r') && (ch != '\n')) {
                parser_append(parser, ch);
           }
           if (ch == '\n'){
               if(myLocalmodem->modem_mode==DATA_MODE)
                   parser_handle_data_mode(parser);
               else
                   parser_handle_line(parser);
           }
       }
}
void modem_uart_handler1(){
    uint32_t ui32Status;
    ui32Status = UARTIntStatus(UART1_BASE, true);
    UARTIntClear(UART1_BASE, ui32Status);

    at_parser *parser=myLocalmodem->parser;
    while (UARTCharsAvail(UART1_BASE)) {
        char ch = UARTCharGetNonBlocking(UART1_BASE);

           // const char *buf = data;
           switch (myLocalmodem->modem_mode)
           {
               case STATE_NONE:
               case STATE_READLINE:
               /*case STATE_DATAPROMPT:*/
               {
                   if ((ch != '\r') && (ch != '\n')) {

                       parser_append(parser, ch);
                   }

                   /* Handle full lines. */
                   if ((ch == '\n') ||
                       (/*parser->state == STATE_DATAPROMPT &&*/
                        parser->buf_used == 2 &&
                        !memcmp(parser->buf, "> ", 2)))
                   {
                       parser_handle_line(parser);
                   }
               }
               break;

               case STATE_RAWDATA: {
                   if (parser->data_left > 0) {
                       parser_append(parser, ch);
                       parser->data_left--;
                   }

                   if (parser->data_left == 0) {
                       parser_include_line(parser);
                       //parser->state = STATE_READLINE;
                   }
               } break;
               case STATE_DATAPROMPT:{
                   if ((ch == '\n') ||
                       (/*parser->state == STATE_DATAPROMPT &&*/
                        parser->buf_used == 2 &&
                        !memcmp(parser->buf, "> ", 2)))
                   {
                       parse_data_mode(parser);
                   }

               }
               break;
           }
    }

}
void parse_network_mode(){
    at_parser *parser=myLocalmodem->parser;

    switch(myLocalmodem->modem_command_status){
    case IN_RESET:{//In Reset state
          //  if(gL_currentTime==gL_ExpectedTime){

        myLocalmodem->mExpectedTime=gL_currentTime+10;
        myLocalmodem->present_command_issued=myLocalmodem->prev_command_issued=-1;
        myLocalmodem->modem_command_status=RESET_HIGH1;
       // GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_4, GPIO_PIN_4);
       // GPIOPinWrite(GPIO_PORTP_BASE, GPIO_PIN_4, ~GPIO_PIN_4);
            //}


    }break;
    case RESET_HIGH1:{
        myLocalmodem->mExpectedTime=gL_currentTime+10;
        myLocalmodem->modem_command_status=RESET_LOW1;
       // GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_4, GPIO_PIN_4);
       // GPIOPinWrite(GPIO_PORTP_BASE, GPIO_PIN_4, GPIO_PIN_4);
    }
    break;
    case RESET_LOW1:{
        //    GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_4, GPIO_PIN_4);
       //     GPIOPinWrite(GPIO_PORTP_BASE, GPIO_PIN_4, ~GPIO_PIN_4);
        myLocalmodem->mExpectedTime=gL_currentTime+10;
        myLocalmodem->modem_command_status=RESET_LOW2;
        }
    break;
    case RESET_LOW2:{
        //    GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_4, ~GPIO_PIN_4);
       //     GPIOPinWrite(GPIO_PORTP_BASE, GPIO_PIN_4, ~GPIO_PIN_4);
        myLocalmodem->mExpectedTime=gL_currentTime+10;

        myLocalmodem->modem_command_status=TRANSMIT_COMMAND;
        }
    break;

    case QUERY_MODE:{
        if(strstr((char *)parser->buf,"76")){
            //if(gTriband_board.modem_detail.)
        }
    }
        break;
    case WAITING_FOR_RESPONSE:{
        myLocalmodem->mExpectedTime=gL_currentTime+5;
        if(myLocalmodem->parser->at_response_OK==0){
            myLocalmodem->modem_command_status=RESPONSE_TIMEOUT;
            myLocalmodem->mExpectedTime=gL_currentTime+2;
        }
        else{
            myLocalmodem->modem_command_status=TRANSMIT_COMMAND;
        }
    }break;
    case RESPONSE_TIMEOUT:{
        myLocalmodem->retry_cnt++;
        myLocalmodem->mExpectedTime=gL_currentTime+2;
        myLocalmodem->modem_command_status=RETRANSMIT;
        if(myLocalmodem->retry_cnt>2){
            myLocalmodem->modem_command_status=IN_RESET;
        }
    }break;
    case RESPONSE_ARRIVED:{
        myLocalmodem->modem_command_status=TRANSMIT_COMMAND;
        myLocalmodem->mExpectedTime=gL_currentTime+2;
        myLocalmodem->retry_cnt=0;
        break;
    }
    case RETRANSMIT:{
        char *mdata=myLocalmodem->modem_cmds[myLocalmodem->present_command_issued];
        myLocalmodem->parser->at_response_OK=0;
        sendDataToModem(mdata,strlen(mdata));
       // myLocalmodem->present_command_issued= myLocalmodem->prev_command_issued;
       // myLocalmodem->mExpectedTime=gL_currentTime+2;
       // myLocalmodem->modem_command_status=TRANSMIT_COMMAND;

    }
    break;
    case TRANSMIT_COMMAND:{
//        if(g_iModem_ready==0){
//            myLocalmodem->mExpectedTime=gL_currentTime+5;
//        }
 //       else{
            if(myLocalmodem->present_command_issued< myLocalmodem->command_len){
                myLocalmodem->retry_cnt=0;
                myLocalmodem->parser->at_response_OK=0;
                myLocalmodem->prev_command_issued= myLocalmodem->present_command_issued;
                myLocalmodem->present_command_issued++;
                char *mdata=myLocalmodem->modem_cmds[myLocalmodem->present_command_issued];
                sendDataToModem(mdata,strlen(mdata));
            }
            myLocalmodem->mExpectedTime=gL_currentTime+20;
            myLocalmodem->modem_command_status=WAITING_FOR_RESPONSE;
//        }

    }
    break;
    }

}
void parse_data_mode(){
//check for errors

}
void modemLoop(){

    switch(myLocalmodem->modem_mode){
    case INIT_MODE: //do nothing after initialization
        break;
    case NETWORK_MODE:
        if(gL_currentTime>=myLocalmodem->mExpectedTime)
            parse_network_mode();
        break;
    case DATA_MODE:
        parse_data_mode();
        break;
    }
}
int send_data_to_nms(char *data,int len){
    int i=0;
for(i=0;i<len;i++)
    UARTCharPut(UART2_BASE, data[i]);
}

/*
static int sim800_config(struct cellular *modem, const char *option, const char *value, int attempts)
{
    at_set_timeout(modem->at, 10);

    for (int i=0; i<attempts; i++) {
        // Blindly try to set the configuration option.
        at_command(modem->at, "AT+%s=%s", option, value);

        // Query the setting status.
        const char *response = at_command(modem->at, "AT+%s?", option);
        // Bail out on timeouts.
        if (response == NULL)
            return -1;

        // Check if the setting has the correct value.
        char expected[16];
        if (snprintf(expected, sizeof(expected), "+%s: %s", option, value) >= (int) sizeof(expected)) {
            errno = ENOBUFS;
            return -1;
        }
        if (!strcmp(response, expected))
            return 0;

        sleep(1);
    }

    errno = ETIMEDOUT;
    return -1;
}
*/
void init_modem_opr(){
 /*
        assert(at_open(at) == 0);

     printf("* getting network status\n");
     int creg, rssi;
     if ((creg = modem->ops->creg(modem)) != -1) {
         printf("registration status: %d\n", creg);
     } else {
         perror("creg");
     }

     if ((rssi = modem->ops->rssi(modem)) != -1) {
         printf("signal strength: %d\n", rssi);
     } else {
         perror("rssi");
     }

     printf("* getting modem time\n");
     struct timespec ts;
     if (modem->ops->clock_gettime(modem, &ts) == 0) {
         printf("gettime: %s", ctime(&ts.tv_sec));
     } else {
         perror("gettime");
     }

     printf("* setting modem time\n");
     if (modem->ops->clock_settime(modem, &ts) != 0) {
         perror("settime");
     }

     char imei[CELLULAR_IMEI_LENGTH+1];
     modem->ops->imei(modem, imei, sizeof(imei));
     printf("imei: %s\n", imei);


     int socket = 2;

     if (modem->ops->socket_connect(modem, socket, "google.com", 80) == 0) {
         printf("connect successful\n");
     } else {
         perror("connect");
     }

     const char *request = "GET / HTTP/1.0\r\n\r\n";
     if (modem->ops->socket_send(modem, socket, request, strlen(request), 0) == (int) strlen(request)) {
         printf("send successful\n");
     } else {
         perror("send");
     }

     int len;
     char buf[32];
     while ((len = modem->ops->socket_recv(modem, socket, buf, sizeof(buf), 0)) >= 0) {
         if (len > 0)
             printf("Received: >\x1b[0;1;33m%.*s\x1b[0m<\n", len, buf);
         else
             sleep(1);
     }

     if (modem->ops->socket_close(modem, socket) == 0) {
         printf("close successful\n");
     } else {
         perror("close");
     }

     assert(cellular_detach(modem) == 0);
     assert(at_close(at) == 0);

     cellular_sim800_free(modem);
     at_free(at);
     */
}
// Implementation of itoa()



