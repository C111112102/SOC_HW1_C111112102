# 系統晶片設計實習(SOC)作業一   C111112102 電子三甲 李步剛

## 作業主題 : EGO-XZ7多模式LED動畫顯示系統
## 功能介紹
本系統使用 EGO-XZ7（Zynq-7000）開發板 搭配 AXI GPIO，實作一個具有互動式控制功能的 LED 動畫顯示裝置。主要功能如下

### LED 動畫效果：
利用雙向跑馬燈效果，從左右兩側向中間聚合，並再從中間向外擴散。
動畫會在中間匯合處反轉方向，形成連續、對稱的視覺效果。

### 多組按鈕控制功能：
快速模式（BTN2）
按下時動畫加快，提供更流暢的燈光效果。

慢速模式（BTN3）
按下時動畫變慢，方便觀察每一步的變化。

單邊顯示模式
BTN1：僅顯示右側 LED 動畫（左側關閉）
BTN4：僅顯示左側 LED 動畫（右側關閉）

#### 按鈕位置：
![IMG_1793](https://github.com/user-attachments/assets/fdeaa802-a111-4467-9945-d5e94ffa74e4)

### 預設模式：
未按任何按鈕時，系統以中等速度顯示對稱動畫效果。

## 硬體
開發板： EGO-XZ7（Zynq-7000 SoC，型號：XC7Z020CLG484-1）
處理器： ARM Cortex-A9

## 軟體
Xilinx Vivado 2018：用於硬體設計與綜合。
Xilinx SDK：用於開發軟體並控制 PS。

## Block Design
![螢幕擷取畫面 2025-04-15 015145](https://github.com/user-attachments/assets/43f11925-d596-450a-b5f4-6761b64da03b)

## 實作示範影片
https://github.com/user-attachments/assets/58d20088-b7c5-4e95-a544-1f9001d7ad20

