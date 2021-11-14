import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'picbutton.dart';
import 'map.dart';
import 'calender.dart';
import 'home_widget.dart';
import 'message.dart';
import 'prefer.dart';
import 'addcard.dart';
import 'deletecard.dart';
import 'seven_discount.dart';
import 'Question.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/sign_in.dart';
import 'login.dart';
import 'DB.dart';
import 'familymart_discount.dart';

class ProfilePage extends StatelessWidget {
  static TextEditingController _accountController = new TextEditingController();
  static TextEditingController _passwordController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    haha();

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Login"),
      // ),
      backgroundColor: Colors.lightBlue.shade900,
      body: SingleChildScrollView(
        child: Container(
            constraints: BoxConstraints.tightFor(width: 435.0, height: 600.0),
            margin: EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 0),
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade900,
              image: DecorationImage(
                image: AssetImage('assets/帳號底圖2.png'),
              ),
            ),
            child: Container(
              margin:
                  EdgeInsets.only(left: 60, top: 120, right: 60, bottom: 20),
              constraints: BoxConstraints(
                maxWidth: 300,
                maxHeight: 500,
                minWidth: 50,
                minHeight: 50,
              ),
              decoration: BoxDecoration(),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 32,
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(user.photoURL!),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Name: ' + user.displayName!,
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Email: ' + user.email!,
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                    label: Text('Logout'),
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.logout();
                    },
                  ),
                  Row(children: [
                    SizedBox(
                      height: 80.0,
                    ),
                    picbutton(
                        iconSting: 'assets/likebt.png',
                        onPressed: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Question(),
                                      maintainState: false))
                              .then((value) {
                            //進行收到回傳資料後的動作區域
                          });
                        },
                        height: 50.0,
                        width: 120.0),
                    picbutton(
                        iconSting: 'assets/shopbt.png',
                        onPressed: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Prefer(),
                                      maintainState: false))
                              .then((value) {
                            //進行收到回傳資料後的動作區域
                          });
                        },
                        height: 50.0,
                        width: 120.0),
                  ]),
                  picbutton(
                      iconSting: 'assets/likebt.png',
                      onPressed: () {
                        // final provider = Provider.of<GoogleSignInProvider>(
                        //     context,
                        //     listen: false);
                        // provider.logout();
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => familymart_discount(),
                                    maintainState: false))
                            .then((value) {
                          //進行收到回傳資料後的動作區域
                        });
                      },
                      height: 50.0,
                      width: 120.0),
                ],
              ),
            )),
      ),
    );
  }

  void haha() async {
    await FirebaseFirestore.instance.collection('user').doc('user1').get();
  }
}

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileHome();
  }
}

class ProfileHome extends State<Profile> {
  int _currentIndex = 3;
  final List<Widget> _children = [
    HomePage_ordered(),
    CalenderPage(),
    MapPage(),
    ProfilePage(),
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

class HomePage_ordered extends StatelessWidget {
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
                // alignment: Alignment.center,

                child: Column(children: [
                  Image(image: AssetImage('assets/搜尋框.png')),
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
                              onPressed: null,
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
                              onPressed: null,
                              height: 20.0,
                              width: 20.0),
                          picbutton(
                              iconSting: 'assets/萊爾富.png',
                              onPressed: null,
                              height: 20.0,
                              width: 20.0),
                          picbutton(
                              iconSting: 'assets/屈臣氏.png',
                              onPressed: null,
                              height: 20.0,
                              width: 20.0),
                          picbutton(
                              iconSting: 'assets/康是美.png',
                              onPressed: null,
                              height: 20.0,
                              width: 20.0),
                          picbutton(
                              iconSting: 'assets/全聯.png',
                              onPressed: null,
                              height: 20.0,
                              width: 20.0),
                          picbutton(
                              iconSting: 'assets/家樂福.png',
                              onPressed: null,
                              height: 20.0,
                              width: 20.0),
                        ]),
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
