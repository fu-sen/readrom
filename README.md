## シャープ ポケットコンピュータ PC-E200・G シリーズ用 ROM イメージ読み込みツール

PC-E200 や PC-G850 シリーズなどの機種では\
copyram などのツールが提供されていましたが、RAM 32K の機種に限られ、\
RAM 8KB の機種では動作しませんでした。\
そこで、RAM 8KB の機種向けのツールと、イメージを結合するツールを作成しました。\
エミュレータ g800 では 32KB 動作するので、\
実機で実行できなかった大容量のプログラムが動作可能になります。

PC-G シリーズで RAM 8KB の機種は次のとおりです。

- PC-G801
- PC-G802
- PC-G803
- PC-G820

シリアル転送ツールが必要です。\
またここでは Windows を使用する前提で説明していますが、\
他の OS でも仕組みがわかれば可能でしょう。

## 使い方

**TEXT - S(Sio) - F(Format)** の設定をパソコンと合わせて下さい。

- badu rate   (通信速度)       = 4800
- data bit    (データ長)       = 8
- stop bit    (セトップビット) = 1
- parity      (パリティ)       = none (なし)
  end of line (改行コード)    = CR LF
  end of file (EOF コード)    = 1A
  line number (行番号)        = yes

BASIC の RUN MODE より **MON** を入力し、機械語モニタを起動します。\
PC-G820 では **CALL #5,&HC000** として起動できます。

**USER1200** で領域を確保します。\
（エラーになる場合は BASIC プログラム等を保存した上でリセットして下さい）\
**R** でシリアル転送を用いて readg801.ihx をポケコンに転送します。\
**G100** でプログラムを実行します。\
A= と表示されるので **0** と入力、\
HL= と表示されるので **C000** と入力します。\
プログラムが終了したら、**W200,11FF** と入力し、パソコンへ転送し、\
この ROM イメージを rom00-c000.ihx で保存します。\
同様に A=0 HL=D000、A=0 HL=E000、A=0 HL=F000 を行い、\
rom00-d000.ihx、rom00-e000.ihx、rom00-f000.ihx と保存します。\
更に A=1 以降も行っていきます。\
PC-G801 では A=3 までです。機種によって異なります。\
生成したファイルを開き、rom00-c000.txt と同じ内容になっているか、\
同じ文字鉄が続いている場合は、その前までが有効で、\
ファイルを破棄して構いません。

**W0,3F** と入力し、このファイルは base.txt で保存します。

ここまでで、ポケコン→パソコンでの作業は完了です。

次に https://github.com/gicking/hexfile_merger/releases から\
hexfile_merger_windows_x86.exe をダウンロードし、\
ROM イメージと同じ場所に置きます。\
また romfile.bat も同じ場所に置きます。

A=0～3 であれば romfile.bat を実行するだけです。（PC-G801）\
もし、A-4 以降も生成した場合は romfile.bat を開き、\
次の記載を存在する数分増やして ●●→04 にし、romfile.bat を実行します。\
（もし、この作業を行った場合は対応した .bat ファイルを増やしますので、\
　教えていただけると幸いです）

```
hexfile_merger_windows_x86 -import rom●●-c000.ihx -move 0x200 0x11ff 0x4000  -import rom●●-d000.ihx -move 0x200 0x11ff 0x5000  -import rom●●-e000.ihx -move 0x200 0x11ff 0x6000  -import rom●●-f000.ihx -move 0x200 0x11ff 0x7000 -move 0x4000 0x7fff 0x0000 -export rom●●.ihx
ren rom●●.ihx rom●●.txt
```

これで ROM イメージの生成ができました。g800config で設定し、\
g800 を起動して、正常に動作する事を確認してみて下さい。

## おまけ

他機種のツールも含めています。

- reade200.ihx ... PC-E200, PC-E220, PC^-G805, PC-G811, PC-G812, PC-G813, PC-G815 and PC-G830
- readg850.ihx ... PC-G850, PC-G850S, PC-G850V and PC-G850VS

copyrom との違いはプログラム 100 番地からにしている点です。

**MON** \
**USER5000** \
**G100** \
**W1000,4FFF** \
A=0,1,2,3,... (機種によって異なります。9 の次は A、F の次は 10 と続きます）

rom00.txt、rom01.txt、rom02.txt、rom03.txt、... と保存します。\
（rom09.txt、rom0a.txt、...rom0f.txt、rom10.txt、……）

**W0,3F** は base.txt で保存します。
