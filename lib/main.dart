import 'package:flutter/material.dart';

class closetHome extends StatefulWidget {
  const closetHome({super.key});
  @override
  State<closetHome> createState() => closetHomeState();
  // createState()でこのWidgetに対応する状態(State)オブジェクトを生成
  // 「_MyStatefulWidgetState」が状態管理の中身を担当
}

// 状態を管理するクラス。ウィジェットの見た目や動きをここで決める
class closetHomeState extends State<closetHome> {
  List<String> clothes = []; // 服の名前を保存するリスト
  void showAddDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('服を追加'),
          content: TextField(
            controller: controller, // コントローラをセット
            decoration: const InputDecoration(labelText: '服の名前を入力'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // ダイアログを閉じる
              },
              child: const Text('閉じる'),
            ),
            ElevatedButton(
              onPressed: () {
                final input = controller.text; // 入力文字を取得
                if (input.isNotEmpty) {
                  setState(() {
                    clothes.add(input); // リストに追加して画面更新
                  });
                  Navigator.of(context).pop(); // ダイアログを閉じる
                }
              },
              child: const Text('追加'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // build()は画面を描画するときに呼ばれるメソッド
    return Scaffold(
      appBar: AppBar(
        title: Text('ClosetApp'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 50),
        backgroundColor: (Colors.blueAccent),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: clothes.length,
        itemBuilder: (context, index) {
          return ListTile(
            trailing: IconButton(
              // trailingで右側にボタンを置く
              icon: Icon(Icons.delete_forever, color: Colors.blueAccent),
              onPressed: () {
                setState(() {
                  clothes.removeAt(index); // 指定した服を削除
                });
              },
            ),
            title: Text(clothes[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        shape: CircleBorder(), //ボタンを丸く
        onPressed: () {
          showAddDialog(context); // ここでcontextを渡して呼ぶ
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

void main() {
  final a = MaterialApp(home: closetHome());
  runApp(a);
}

// main()はアプリのエントリーポイント。ここからアプリが始まる
