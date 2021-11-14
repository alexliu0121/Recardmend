import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
import 'login.dart';
import 'picbutton.dart';
import 'message.dart';
import 'calender.dart';
import 'map.dart';

class seven_discount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return discount();
  }
}

class discount extends State<seven_discount> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    CalenderPage(),
    MapPage(),
    LoginPage(),
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
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/seven.png'),
                      width: 100,
                      height: 100,
                    )
                  ],
                ),
                margin:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                constraints: BoxConstraints(
                  maxWidth: 500,
                  maxHeight: 135,
                  minWidth: 500,
                  minHeight: 50,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                // alignment: Alignment.center,

                child: Column(
                  children: [
                    Text('活動一:防疫新生活\n',
                        style: TextStyle(fontSize: 25, color: Colors.green)),
                    Text(
                        ' 6/16~6/20活動期間內，於7-ELEVEN實體門市刷卡購買指定商品，單筆滿NT150(含)以上，立享30點OPEN POINT(=30元)。',
                        style: TextStyle(fontSize: 20))
                  ],
                ),
                margin:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                constraints: BoxConstraints(
                  maxWidth: 500,
                  maxHeight: 250,
                  minWidth: 500,
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

                child: Column(children: [
                  Text('活動二:ｉ刷金融卡新戶活動\n',
                      style: TextStyle(fontSize: 25, color: Colors.green)),
                  Text(
                      'ｉ刷金融卡、ｉ刷悠遊Debit卡新戶核卡後30天內一般消費不限金額任刷3筆，送7-ELEVEN現金抵用券NT100。\n*符合資格者將以簡訊通知兌換\n',
                      style: TextStyle(fontSize: 20)),
                  Text('兌換方式：',
                      style: TextStyle(fontSize: 25, color: Colors.green)),
                  Text(
                      '需持ｉ刷金融卡至全台7-ELEVEN ibon列印兌換券，步驟如下：\n1.好康/紅利\n2.銀行/國泰世華\n3.依指示輸入身分證字號、卡號後8碼、背面末3碼\n4.ｉ刷金融卡新戶活動',
                      style: TextStyle(fontSize: 20))
                ]),
                margin:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                constraints: BoxConstraints(
                  maxWidth: 500,
                  maxHeight: 500,
                  minWidth: 500,
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
