# Suzuno32RV_various_asm_programs

Suzuno32RVをアセンブリ言語で動かしてみました。WSL2のUbuntuの環境で生成しました。



書き込みはWCHISPStudioでやりました。
- RISC-V MCUsをクリックしてタブを開く
- BOOT0スイッチを押しながらType-CコネクタとPC間をUSB接続ケーブルで接続する
- Chip Optionに認識結果が出る(Chip Series=CH32V20x, Chip Model=CH32V203C8T6, Dnld Port= USB,Dev List=何かが表示される)
- Object File1に生成したhexファイルを読み込ませる
- Downloadボタンをクリックする

ファイル構成

<pre>
\\wsl.localhost\Ubuntu\home\UserName/
  ├ program/
  │  ├ hello.asm 
  │　└ main.sh
  └ riscv-gnu-toolchain
</pre>
