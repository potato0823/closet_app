# closet_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


今のコードでFloatingActionButtonを押したらダイアログを表示するためにあなたがすべきことを箇条書きで説明します。

FloatingActionButtonでダイアログを出すためのあなたのタスク
現在のグローバル変数list = ListView()を削除または使わない形に変更する
　→ 状態を管理しないとダイアログで追加した内容が反映できないので、まずはStatefulWidgetに変更検討をおすすめします。

MaterialApp や Scaffold を含む構造を StatefulWidget の中に入れ直す
　→ そうすることでsetStateを使えるようになり、ダイアログでの入力反映や再描画ができる。

FloatingActionButtonのonPressedに関数を設定する
　- 例えば_showAddDialog()のような関数を作り、押されたら呼び出す。

_showAddDialog()関数を定義する
　- この中でshowDialogを使い、AlertDialogを表示する。

AlertDialogの中にTextFieldを置いて、ユーザーがテキストを入力できるようにする
　- TextEditingControllerを使ってテキストを管理する。

ダイアログ内に「キャンセル」と「追加」などのボタンを作る
　- 「キャンセル」はNavigator.pop(context)でダイアログを閉じる
　- 「追加」は入力があれば処理をしてから閉じる（最初は閉じるだけでもOK）

補足
今のコードは状態管理なしの静的な構造なので、ダイアログ表示はできますが、
　ダイアログから得たデータを画面に反映させるにはStatefulWidgetにする必要があります。

とりあえず「ダイアログを表示するだけ」ならonPressedにshowDialogの呼び出しを直接書くこともできますが、
　アプリ拡張を考えると最初からStatefulWidget化がオススメです。

もし、最小限でダイアログ表示だけやりたい簡単コードか、
状態管理も含めて拡張しやすいコードどちらが良いか教えてください。
それに合わせてサンプルコードも作れます。
