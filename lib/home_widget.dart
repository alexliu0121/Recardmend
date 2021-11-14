import 'package:flutter/material.dart';
import 'package:flutter_app/calender.dart';
import 'package:flutter_app/map.dart';
import 'package:flutter_app/message.dart';
import 'carrefour_discount.dart';
import 'cosmed_discount.dart';
import 'familymart_discount.dart';
import 'hilife_discount.dart';
import 'ok_discount.dart';
import 'placeholder_widget.dart';
import 'login.dart';
import 'picbutton.dart';
import 'px_discount.dart';
import 'seven_discount.dart';
import 'message.dart';
import 'map.dart';
import 'calender.dart';
import 'addcard.dart';
import 'deletecard.dart';
import 'profile.dart';
import 'watsons_discount.dart';

const list = ["1", "2", "3", "4", "5"];
const colors = [
  Colors.blue,
  Colors.grey,
  Colors.red,
  Colors.cyan,
  Colors.amber
];

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    CalenderPage(),
    MapPage(),
    ProfilePage(),
    Message(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: Colors.lightBlue.shade900,
        title: Image(
          image: AssetImage('assets/logo.png'),
          width: 250,
        ),
        actions: [
          picbutton(
              iconSting: 'assets/5信箱icon.png',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Message(), maintainState: false));
              },
              height: 50.0,
              width: 50.0)
        ],

        // [Icon(Icons.mail, size: 50)],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue.shade800,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped, // new
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: new Text('Home', style: TextStyle(color: Colors.white)),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(
              Icons.calendar_today,
              color: Colors.white,
            ),
            title: new Text('Schedule', style: TextStyle(color: Colors.white)),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.pin_drop, color: Colors.white),
            title: new Text('Location', style: TextStyle(color: Colors.white)),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.person, color: Colors.white),
            title: new Text('Profile', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class HomePage extends StatelessWidget {
  @override
  var stack = new Stack(
    alignment: const FractionalOffset(0.5, 0.7),
    children: <Widget>[
      new CircleAvatar(
        backgroundImage: new NetworkImage(
            "https://avatars2.githubusercontent.com/u/41252899?s=460&v=4"),
        radius: 100.0,
      ),
      new Positioned(
        top: 10.0,
        left: 10.0,
        child: Image(
          image: AssetImage('assets/card1.png'),
        ),
      ),
      new Positioned(
        bottom: 10.0,
        right: 10.0,
        child: Image(
          image: AssetImage('assets/card2.png'),
        ),
      ),
      new Positioned(
        bottom: 10.0,
        right: 10.0,
        child: Image(
          image: AssetImage('assets/card3.png'),
        ),
      )
    ],
  );

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue.shade900,
        // appBar: AppBar(
        //     backgroundColor: Colors.lightBlue.shade900,
        //     // title: Image(image: AssetImage('assets/logo.png')),
        //     // actions: [Icon(Icons.mail)],
        //     flexibleSpace: Image(image: AssetImage('assets/選擇日期.png'))),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                // alignment: Alignment.center,

                child: Column(children: [
                  // Image(image: AssetImage('assets/搜尋框.png')),
                  Flexible(
                    child: GridView(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, //横轴三个子widget
                            childAspectRatio: 1.0 //宽高比为1时，子widget
                            ),
                        children: <Widget>[
                          picbutton(
                              iconSting: 'assets/全家.png',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            familymart_discount(),
                                        maintainState: false));
                              },
                              height: 20.0,
                              width: 20.0),
                          picbutton(
                              iconSting: 'assets/seven.png',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => seven_discount(),
                                        maintainState: false));
                              },
                              height: 20.0,
                              width: 20.0),
                          picbutton(
                              iconSting: 'assets/ok.png',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ok_discount(),
                                        maintainState: false));
                              },
                              height: 20.0,
                              width: 20.0),
                          picbutton(
                              iconSting: 'assets/萊爾富.png',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => hilife_discount(),
                                        maintainState: false));
                              },
                              height: 20.0,
                              width: 20.0),
                          picbutton(
                              iconSting: 'assets/屈臣氏.png',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            watsons_discount(),
                                        maintainState: false));
                              },
                              height: 20.0,
                              width: 20.0),
                          picbutton(
                              iconSting: 'assets/康是美.png',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => cosmed_discount(),
                                        maintainState: false));
                              },
                              height: 20.0,
                              width: 20.0),
                          picbutton(
                              iconSting: 'assets/全聯.png',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => px_discount(),
                                        maintainState: false));
                              },
                              height: 20.0,
                              width: 20.0),
                          picbutton(
                              iconSting: 'assets/家樂福.png',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            carrefour_discount(),
                                        maintainState: false));
                              },
                              height: 20.0,
                              width: 20.0),
                        ]),
                  ),
                ]),
                margin:
                    EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 20),
                constraints: BoxConstraints(
                  maxWidth: 500,
                  maxHeight: 230,
                  minWidth: 50,
                  minHeight: 50,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.amber.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                // alignment: Alignment.center,

                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: GridView(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 8, //横轴三个子widget
                                    childAspectRatio: 1.0 //宽高比为1时，子widget
                                    ),
                            children: <Widget>[
                              picbutton(
                                  iconSting: 'assets/加入卡片BT.png',
                                  onPressed: () {
                                    Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => AddCard(),
                                                maintainState: false))
                                        .then((value) {
                                      //進行收到回傳資料後的動作區域
                                    });
                                  },
                                  height: 50.0,
                                  width: 50.0),
                              picbutton(
                                  iconSting: 'assets/刪除卡片BT.png',
                                  onPressed: () {
                                    Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DeleteCard(),
                                                maintainState: false))
                                        .then((value) {
                                      //進行收到回傳資料後的動作區域
                                    });
                                  },
                                  height: 50.0,
                                  width: 50.0),
                            ]),
                      ),
                      Image(
                        image: AssetImage('assets/cards.png'),
                        width: 350,
                        height: 200,
                      ),
                    ]),
                margin:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
                constraints: BoxConstraints(
                  maxWidth: 500,
                  maxHeight: 260,
                  minWidth: 50,
                  minHeight: 50,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.amber.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ])));
  }
}
