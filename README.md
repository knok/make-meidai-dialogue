<!-- -*- coding: utf-8 -*- -->
# make-meidai-dialogue

このツールは、[日本語自然会話書き起こしコーパス（旧名大会話コーパス）](https://nknet.ninjal.ac.jp/nuc/templates/nuc.html)を取得して、seq2seqで利用できるデータに整形するものです。

## 必要なもの

* python(2/3)
* unzip
* wget

## 使い方

make allを実行するとコーパスをダウンロードし、展開して生成スクリプトが動きます。
最終出力はsequence.txtというファイルになります。

## 生成ファイルの内容

```
input: (入力文)
output: (出力文)
:
```

先頭にinput/output:が付与され、それ以降がテキストになっています。

## 注意点

* inputは一意となっている(重複しているものは排除)
* 正規化なし(英数字等は全角)
* 人名部分は未処理(F/M000といった形式のまま)
* 同一人物の連続した発話は除外

## ライセンス

The MIT License (MIT)
Copyright (c) 2016 NOKUBI Takatsugu <knok at daionet.gr.jp>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

コーパス自体のライセンスはオリジナルに従います。このツールによって出力されたデータもオリジナルの名大会話コーパスのライセンスに準ずる点に留意してください。

[名大会話コーパス利用上の注意 ver. 2 (08-06-30)](http://telldev.cla.purdue.edu/chakoshi/meidai-chuui.html)より引用:
```
名大会話コーパスを、教育目的・研究目的の利用に限るという条件で公開しますので、ご活用ください。研究論文等にお使いになる場合は、「名大会話コーパス」を使った旨、明記してください。
　名大会話コーパスは、科学研究費基盤研究（Ｂ）（２）「日本語学習辞書編纂に向けた電子化コーパス利用によるコロケーション研究」（平成13年度～15年度、研究代表者：大曾美惠子）の一環として作成されたもので、２名から４名の話者による約100時間の雑談を収録、文字化したデータです。
　会話は大半が親しいもの同士の雑談です。会話参加者は女性161名、男性37名で、年齢、出身地は様々です。複数の会話に参加している参加者もいます。年齢層、出身地については、下記の参加者情報をご参照ください。女性にはFで始まるコードナンバーが、男性にはMで始まるコードナンバーが付いています。（なおF012は存在しないことにご注意願います。）
　長母音、感動詞の表記など、統一されていない部分があることも念頭に置いてご利用ください。
```

