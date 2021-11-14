import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  State<StatefulWidget> createState() {
    return Message_page();
  }
}

class Message_page extends State<Message> {
  final mycontroller = TextEditingController();
  bool test = false;
  bool test1 = false;
  @override
  Widget build(BuildContext context) {
    // if (mycontroller.text != "") {
    //   test = true;
    // } else {
    //   test = false;
    // }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue.shade900,
          title: Text("Message"),
        ),
        backgroundColor: Colors.lightBlue.shade900,
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Card(
                color: Colors.amber.shade100,
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  title: TextField(
                    controller: mycontroller,
                    decoration: InputDecoration(
                      hintText: '請輸入...',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (text) {},
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.mic,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      if (mycontroller.text != "1/13") {
                        setState(() {
                          test1 = true;
                          test = true;
                        });
                      } else {
                        setState(() {
                          test = true;
                        });
                      }
                    },
                  ),
                ),
              ),
              Offstage(
                offstage: test1 ? true : false,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  // alignment: Alignment.center,

                  child: Row(
                    children: [
                      Expanded(
                          child: Text('1/13:有兩項購物行程!請多多留意!',
                              style: TextStyle(fontSize: 25)))
                    ],
                  ),
                  margin:
                      EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                  constraints: BoxConstraints(
                    maxWidth: 500,
                    maxHeight: 120,
                    minWidth: 200,
                    minHeight: 50,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.amber.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              Offstage(
                offstage: test ? true : false,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  // alignment: Alignment.center,

                  child: Row(children: [
                    Expanded(
                        child: Text('萊爾富最新的優惠來囉!刷國泰世華卡於萊爾富門市消費即...',
                            style: TextStyle(fontSize: 25)))
                  ]),
                  margin:
                      EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                  constraints: BoxConstraints(
                    maxWidth: 500,
                    maxHeight: 500,
                    minWidth: 100,
                    minHeight: 50,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.amber.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              Offstage(
                offstage: test ? true : false,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  // alignment: Alignment.center,

                  child: Row(children: [
                    Expanded(
                        child: Text('7-11最新的優惠來囉!刷玉山金融卡於7-11門市消費即...',
                            style: TextStyle(fontSize: 25)))
                  ]),
                  margin:
                      EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                  constraints: BoxConstraints(
                    maxWidth: 500,
                    maxHeight: 500,
                    minWidth: 100,
                    minHeight: 50,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.amber.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              Offstage(
                offstage: test ? true : false,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  // alignment: Alignment.center,

                  child: Row(children: [
                    Expanded(
                        child: Text('康是美最新的優惠來囉!刷兆豐VISA卡於康是美門市消費即...',
                            style: TextStyle(fontSize: 25)))
                  ]),
                  margin:
                      EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                  constraints: BoxConstraints(
                    maxWidth: 500,
                    maxHeight: 500,
                    minWidth: 100,
                    minHeight: 50,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.amber.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              Offstage(
                  offstage: test ? true : false,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                    // alignment: Alignment.center,

                    child: Row(children: [
                      Expanded(
                          child: Text('1/10:有一項購物行程!請多多留意!',
                              style: TextStyle(fontSize: 25)))
                    ]),
                    margin: EdgeInsets.only(
                        left: 20, top: 20, right: 20, bottom: 0),
                    constraints: BoxConstraints(
                      maxWidth: 500,
                      maxHeight: 500,
                      minWidth: 100,
                      minHeight: 50,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.amber.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  )),
              Offstage(
                offstage: test ? true : false,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  // alignment: Alignment.center,

                  child: Row(children: [
                    Expanded(
                        child: Text('屈臣氏最新的優惠來囉!刷國泰世華卡於屈臣氏門市消費即...',
                            style: TextStyle(fontSize: 25)))
                  ]),
                  margin:
                      EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                  constraints: BoxConstraints(
                    maxWidth: 500,
                    maxHeight: 500,
                    minWidth: 100,
                    minHeight: 50,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.amber.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              Offstage(
                offstage: test ? true : false,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  // alignment: Alignment.center,

                  child: Row(children: [
                    Expanded(
                        child: Text('全家最新的優惠來囉!刷中信Line Pay於全家門市消費即...',
                            style: TextStyle(fontSize: 25)))
                  ]),
                  margin:
                      EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                  constraints: BoxConstraints(
                    maxWidth: 500,
                    maxHeight: 500,
                    minWidth: 100,
                    minHeight: 50,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.amber.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ])));
  }
}
