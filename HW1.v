`timescale 1ns / 1ps

module switch_led_enable(
    input  wire [1:0] i_sw,       // 2-bit Switch 輸入
    input  wire [7:0] i_led_in,   // 來自 PS (AXI GPIO) 的 LED 資料
    output wire [7:0] o_led_out   // 輸出到 LED
    );
    
   // Switch 控制 LED 顯示反向輸出    
    assign o_led_out = (i_sw[0] == 1'b1) ? ~i_led_in : i_led_in;

endmodule
