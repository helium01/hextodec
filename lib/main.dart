import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ExpandableListViewExample(),
    );
  }
}

// Modifikasi kelas Item untuk menambahkan boolean 'isExpanded'
class Item {
  String title;
  String description;
  bool isExpanded;

  Item({
    required this.title,
    required this.description,
    this.isExpanded = false,
  });
}

class ExpandableListViewExample extends StatefulWidget {
  @override
  _ExpandableListViewExampleState createState() =>
      _ExpandableListViewExampleState();
}

class _ExpandableListViewExampleState extends State<ExpandableListViewExample> {
  final List<Item> _items = List.generate(
    10,
    (index) => Item(
      title: 'Item ${index + 1}',
      description:
          'Deskripsi item nomor ${index + 1}. Klik untuk melihat lebih banyak.',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expandable ListView Example"),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(item.title),
                  onTap: () {
                    setState(() {
                      item.isExpanded = !item.isExpanded;
                    });
                  },
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  padding: EdgeInsets.all(10),
                  height: item.isExpanded ? 60 : 0,
                  child: Text(
                    item.description,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
