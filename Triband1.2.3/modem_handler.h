/*
 * modem_handler.h
 *
 *  Created on: Dec 1, 2020
 *      Author: frogcell
 */

#ifndef TRIBAND1_2_3_MODEM_HANDLER_H_
#define TRIBAND1_2_3_MODEM_HANDLER_H_

#define INIT_MODE 0
#define NETWORK_MODE 1
#define DATA_MODE   2
enum at_parser_state {
    STATE_NONE,
    STATE_READLINE,
    STATE_DATAPROMPT,
    STATE_RAWDATA,
    STATE_HEXDATA,
};
enum eCommand_status{
    IN_RESET,
    RESET_HIGH1,
    RESET_LOW1,
    RESET_LOW2,
    QUERY_MODE,
    WAITING_FOR_RESPONSE,
    RESPONSE_TIMEOUT,
    RESPONSE_ARRIVED,
    TRANSMIT_COMMAND,
    RETRANSMIT
};
typedef struct _at_parser {

    void *priv;

  //  enum at_parser_state state;
  //  int expect_dataprompt;
    int data_left;
   // int nibble;
    int at_response_OK;
    char buf[2048];
    int buf_used;
    int buf_size;
    int buf_current;
}at_parser;

typedef struct _system_modem{
    char modem_mode; //0 init 1 command mode, 2 data node
    char modem_command_status;
    char tech_mode;
    //char modem_prev_command_status;
    int check_m_cntr;//millicounter
    int check_u_cntr; //micro counter
    char modem_resp;//1 OK, 3 Fail
    char retry_count;
    at_parser *parser;
    char **modem_cmds;
    char command_len;
    int present_command_issued;
    int prev_command_issued;
    int retry_cnt;
    unsigned long long mExpectedTime;
}system_modem;


void modem_uart_handler(void);
void parse_data_mode();
int send_data_to_nms(char *data,int len);
int initmodem(system_modem *mdm);
void modemLoop();
bool validateData(char *line,int len);

#endif /* TRIBAND1_2_3_MODEM_HANDLER_H_ */
