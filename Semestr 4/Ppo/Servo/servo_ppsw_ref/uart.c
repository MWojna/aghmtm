#include <LPC210X.H>
#include "strings.h"
#include "uart.h"

// *********** RECEIVER ************

struct RxBuffer {
   char cData[RX_BUFFER_SIZE];
   enum eRxStatus eStatus;
   unsigned char ucCharCtr;
}
sRxBuffer;

void UART_Rx_GetStringCopy(char * cString) {

   CopyString(sRxBuffer.cData, cString);
   sRxBuffer.eStatus = EMPTY;
}

enum eRxStatus eUART_Rx_GetStatus(void) {
   return sRxBuffer.eStatus;
}

void PutCharToRxBuffer(char cChar) {

   if (sRxBuffer.ucCharCtr == RX_BUFFER_SIZE) {
      sRxBuffer.eStatus = OVERFLOW;
   } else if (TERMINATOR == cChar) {
      sRxBuffer.cData[sRxBuffer.ucCharCtr] = NULL;
      sRxBuffer.eStatus = READY;
      sRxBuffer.ucCharCtr = 0;
   } else {
      sRxBuffer.cData[sRxBuffer.ucCharCtr] = cChar;
      sRxBuffer.ucCharCtr++;
   }
}

/*********** TRANSMITER *************/

struct TxBuffer {
   char cData[TX_BUFFER_SIZE];
   unsigned char ucCharCtr;
   enum eTxStatus eStatus;
   unsigned char fLastChar;
}
sTxBuffer;

char GetCharFromTxBuffer(void) {

   if (sTxBuffer.fLastChar == 1) {
      sTxBuffer.eStatus = FREE;
      return NULL;
   } else if (sTxBuffer.cData[sTxBuffer.ucCharCtr] == NULL) {
      sTxBuffer.fLastChar = 1;
      return TERMINATOR;
   } else {
      char cCharacter = sTxBuffer.cData[sTxBuffer.ucCharCtr];
      sTxBuffer.ucCharCtr++;
      return cCharacter;
   };
}

void UART_Tx_SendString(char * cString) {

   CopyString(cString, sTxBuffer.cData);
   sTxBuffer.ucCharCtr = 0;
   sTxBuffer.fLastChar = 0;
   sTxBuffer.eStatus = BUSY;
   U0THR = GetCharFromTxBuffer();
}

enum eTxStatus eUART_Tx_GetStatus(void) {
   return sTxBuffer.eStatus;
}

//*********** INTERRUPTS **********

// UxIER Interrupt Enable Register
#define RX_DATA_AVALIABLE_INTERRUPT_ENABLE 0x00000001
#define THRE_INTERRUPT_ENABLE 0x00000002

// UxIIR Pending Interrupt Identification Register
#define INTERRUPT_PENDING_IDETIFICATION_BITFIELD 0x0000000F
#define THRE_INTERRUPT_PENDING 0x00000002
#define RX_DATA_AVALIABLE_INTERRUPT_PENDING 0x00000004

#define VIC_UART0_CHANNEL_NR 6
#define IRQ_SLOT_ENABLE 0x00000020

__irq void InterruptServiceRoutine(void) {

   unsigned int uiCopyOfU0IIR = U0IIR; // odczyt U0IIR powoduje jego kasowanie wiec lepiej pracowac na kopii

   if ((uiCopyOfU0IIR & INTERRUPT_PENDING_IDETIFICATION_BITFIELD) == RX_DATA_AVALIABLE_INTERRUPT_PENDING) // odebrano znak
   {
      PutCharToRxBuffer(U0RBR);
   }
   if ((uiCopyOfU0IIR & INTERRUPT_PENDING_IDETIFICATION_BITFIELD) == THRE_INTERRUPT_PENDING) // wyslano znak - nadajnik pusty 
   {
      char cChar = GetCharFromTxBuffer();
      if (NULL != cChar) {
         U0THR = cChar;
      }
   }

   VICVectAddr = 0; // Acknowledge Interrupt
}

//*********** INITIALIZATION  **********

// U0LCR Line Control Register
#define DIVISOR_LATCH_ACCES_BIT 0x00000080
#define UART_WORD_LENGTH 3

void UART_Init(void) {

   // UART
   PINSEL0 = PINSEL0 | 0x55; // ustawic piny uar0 odbiornik nadajnik
   U0LCR |= UART_WORD_LENGTH | DIVISOR_LATCH_ACCES_BIT; // dlugosc slowa, DLAB = 1
   U0DLL = ((15000000) / 16) / BOUD_RATE; // predkosc transmisji
   U0LCR &= (~DIVISOR_LATCH_ACCES_BIT); // DLAB = 0
   U0IER |= RX_DATA_AVALIABLE_INTERRUPT_ENABLE | THRE_INTERRUPT_ENABLE; // ??? co tu robinmy

   // INT
   VICVectAddr2 = (unsigned long) InterruptServiceRoutine; // set interrupt service routine address
   VICVectCntl2 = IRQ_SLOT_ENABLE | VIC_UART0_CHANNEL_NR; // use it for UART 0 Interrupt
   VICIntEnable |= (0x1 << VIC_UART0_CHANNEL_NR); // Enable UART 0 Interrupt Channel
}
