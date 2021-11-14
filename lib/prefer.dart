/// Flutter code sample for ReorderableListView
import 'picbutton.dart';
import 'map.dart';
import 'calender.dart';
import 'home_widget.dart';
import 'message.dart';
import 'prefer.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Prefer());

/// This is the main application widget.
class Prefer extends StatelessWidget {
  const Prefer({Key? key}) : super(key: key);

  // static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    List<Color> _data = [
      Colors.blue,
      Colors.pinkAccent,
      Colors.deepPurple,
      Colors.orangeAccent
    ];
    return Scaffold(
      body: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<int> _items = List<int>.generate(8, (int index) => index);
  final List<String> _items_name = [
    "全家",
    "7-11",
    "OK",
    "萊爾富",
    "屈臣氏",
    "康是美",
    "全聯",
    "家樂福"
  ];

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    // final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    // final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    final Color oddItemColor = Colors.amber.shade300;
    final Color evenItemColor = Colors.amber.shade100;

    return Scaffold(
      backgroundColor: Colors.lightBlue.shade900,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade900,
        title: Text("商家喜好"),
        actions: [
          picbutton(
              iconSting: 'assets/編輯icon.png',
              onPressed: () {
                Navigator.of(context).pop(_items_name);
              },
              height: 50.0,
              width: 50.0)
        ],
      ),
      body: ReorderableListView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        children: <Widget>[
          for (int index = 0; index < _items.length; index++)
            Container(
              margin: EdgeInsets.all(5.0),
              // padding: EdgeInsets.all(20.0),
              key: Key('$index'),
              width: 300,
              height: 50,
              decoration: new BoxDecoration(
                color: _items[index].isOdd ? oddItemColor : evenItemColor,
                //设置四周圆角 角度
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: ListTile(
                key: Key('$index'),
                // tileColor: _items[index].isOdd ? oddItemColor : evenItemColor,
                title: Center(child: Text('${_items_name[index]}')),
              ),
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
            final String name = _items_name.removeAt(oldIndex);
            _items_name.insert(newIndex, name);
          });
        },
      ),
    );
  }
}
