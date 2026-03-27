#include "keyboard.h"
#include "servo.h"
#include "uart.h"
#include "strings.h"
#include "decoder.h"
#include "watch.h"

extern struct Watch sWatch;
extern struct Token asTokens[];
extern unsigned char ucTokenNr;

int main() {

   char fSend_UnknownCommand = 0;
   char fSend_ID = 1;
   char fSend_OK = 1;

   Keyboard_Init();
   UART_Init();
   Servo_Init(10);
   Wath_Init();

   while (1) {

      switch (eKeyboard_Read()) {

         case BUTTON_1:
            Servo_Callib();
            break;

         case BUTTON_2:
            Servo_GoTo(12);
            break;

         case BUTTON_3:
            Servo_GoTo(24);
            break;

         case BUTTON_4:
            Servo_GoTo(36);
            break;

         default:
            break;
         }

      if (READY == eUART_Rx_GetStatus()) {
         char acRxString[RX_BUFFER_SIZE];
         UART_Rx_GetStringCopy(acRxString);
         DecodeMsg(acRxString);

         if ((ucTokenNr != 0) && (asTokens[0].eType == KEYWORD)) {
            switch (asTokens[0].uValue.eKeywordCode) {

               case ID:
                  Servo_Callib();
                  fSend_ID = 1;
                  break;

               case CALLIB:
                  Servo_Callib();
                  fSend_OK = 1;
                  break;

               case GOTO:
                  Servo_GoTo(asTokens[1].uValue.uiNumber);
                  fSend_OK = 1;
                  break;

               default:
                  fSend_UnknownCommand = 1;
                  break;
            }
         } else {
            fSend_UnknownCommand = 1;
         }
      }

      if (eUART_Tx_GetStatus() == FREE) {
         char cStringToSend[TX_BUFFER_SIZE];

         if (fSend_ID) {
            fSend_ID = 0;
            UART_Tx_SendString("servo\n");
         } else if (fSend_UnknownCommand) {
            fSend_UnknownCommand = 0;
            UART_Tx_SendString("unknowncommand\n");
         } else if (fSend_OK) {
            fSend_OK = 0;
            UART_Tx_SendString("ok\n");
         } else if (sWatch.fSecondsChanged) {
            sWatch.fSecondsChanged = 0;
            CopyString("sec ", cStringToSend);
            AppendUIntToString(sWatch.ucSeconds, cStringToSend);
            AppendString("\n", cStringToSend);
            UART_Tx_SendString(cStringToSend);
         } else if (sWatch.fMinutesChanged) {
            sWatch.fMinutesChanged = 0;
            CopyString("min ", cStringToSend);
            AppendUIntToString(sWatch.ucMinutes, cStringToSend);
            AppendString("\n", cStringToSend);
            UART_Tx_SendString(cStringToSend);
         }
      }
   }
}
