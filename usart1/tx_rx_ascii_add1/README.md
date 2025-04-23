シリアル通信でmopurun_elecを送信して、入力待ちになり、入力された１文字に1加算したASCII文字を送信するプログラムです。

TeraTermで動作確認しました。スピードは115200bpsです。

AE-TTL-232Rを接続しました。

SW設定は、SW2がOFF＝3.3Vです。

配線は以下の通りです。

<pre>
GND      →GND
TX PA9   →RXD
RX PA10  →TXD
  
</pre>
