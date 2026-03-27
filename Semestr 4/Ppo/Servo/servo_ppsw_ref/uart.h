#define BOUD_RATE 9600
#define RX_BUFFER_SIZE 40
#define TX_BUFFER_SIZE 40
#define TERMINATOR  '\r'
#define NULL  0

void UART_Init(void);

enum eRxStatus {EMPTY, READY, OVERFLOW};
enum eRxStatus eUART_Rx_GetStatus(void);
void UART_Rx_GetStringCopy(char *);

enum eTxStatus {FREE, BUSY};
enum eTxStatus eUART_Tx_GetStatus(void);
void UART_Tx_SendString(char *);
