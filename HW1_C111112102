#include <stdio.h>
#include "xparameters.h"
#include "xgpio.h"

#define DEFAULT_DELAY 300
#define FAST_DELAY 50
#define SLOW_DELAY 1000

void delay(int dly)
{
    int i, j;
    for (i = 0; i < dly; i++) {
        for (j = 0; j < 0xFFFF; j++) {
            ;
        }
    }
}

int main()
{
    XGpio LED_XGpio, BTN_XGpio;
    int delay_time = DEFAULT_DELAY;
    int btn_state = 0;
    int direction = 1;

    // LED 狀態，LED_num 控制左邊，LED_num1 控制右邊
    u8 LED_num = 0b10000000;
    u8 LED_num1 = 0b00000001;
    u8 LED_out;

    // 初始化 GPIO
    XGpio_Initialize(&LED_XGpio, XPAR_AXI_GPIO_0_DEVICE_ID);
    XGpio_Initialize(&BTN_XGpio, XPAR_AXI_GPIO_1_DEVICE_ID);
    XGpio_SetDataDirection(&LED_XGpio, 1, 0); // LED輸出
    XGpio_SetDataDirection(&BTN_XGpio, 1, 1); // 按鈕輸入

    printf("Start LED Effect...\n");

    while (1) {
        // 更新 LED 狀態（你的原邏輯）
        if (direction == 1) {
            LED_num >>= 1;
            LED_num1 <<= 1;

            if (LED_num == 0b00010000 || LED_num1 == 0b00001000) {
            	direction = -1;
            }
        } else {
            LED_num <<= 1;
            LED_num1 >>= 1;

            if (LED_num == 0b10000000 || LED_num1 == 0b00000001) {
            	direction = 1;
           }
        }

        // 讀取按鈕狀態（假設按鈕 0 = 快速、按鈕 1 = 慢速）
        btn_state = XGpio_DiscreteRead(&BTN_XGpio, 1);

        if (btn_state & 0x04) {
        	delay_time = FAST_DELAY; // 按鈕 0 被按
            LED_out = LED_num | LED_num1;
        }else if (btn_state & 0x08) {
            delay_time = SLOW_DELAY; // 按鈕 1 被按
            LED_out = LED_num | LED_num1;
        }else if (btn_state & 0x02) {
            LED_out = LED_num1;
        }else if (btn_state & 0x10) {
            LED_out = LED_num;
        }else {
            delay_time = DEFAULT_DELAY;
            LED_out = LED_num | LED_num1;
        }

        printf("btn_state = 0x%02X\n", btn_state);

        // 輸出 LED 狀態

        XGpio_DiscreteWrite(&LED_XGpio, 1, LED_out);

        printf("LED_out = 0x%02X, delay = %d\n", LED_out, delay_time);

        delay(delay_time);
    }

    return 0;
}
