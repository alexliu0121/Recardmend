import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
import 'login.dart';
import 'picbutton.dart';
import 'message.dart';
import 'calender.dart';
import 'map.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class carrefour_discount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return discount();
  }
}

class discount extends State<carrefour_discount> {
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
  Future getData_taishin() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn =
        await firestore.collection('台新銀行').where('店家', isEqualTo: '家樂福').get();
    // await firestore.collection('台新銀行').get();
    return qn;
  }

  Future getData_yushan() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn =
        await firestore.collection('玉山銀行').where('店家', isEqualTo: '家樂福').get();
    // await firestore.collection('玉山銀行').get();
    return qn;
  }

  var arraylist_promotions = <List>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue.shade900,
        body: FutureBuilder(
            future: getData_taishin(),
            builder: (_, snapshot_taishin) {
              if (!snapshot_taishin.hasData) {
                return Text('Loading data from 台新銀行 ...Please wait...');
              }
              if (snapshot_taishin.hasError) {
                return Text('Something went wrong');
              }
              if (snapshot_taishin.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              return FutureBuilder(
                  future: getData_yushan(),
                  builder: (_, snapshot_yushan) {
                    if (!snapshot_yushan.hasData ||
                        snapshot_yushan.hasError ||
                        snapshot_yushan.connectionState ==
                            ConnectionState.waiting) {
                      return Text('Loading data from 玉山銀行 ...Please wait...');
                    }
                    getExpenseItems(snapshot_yushan, snapshot_taishin);
                    return Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 16.0),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage('assets/家樂福.png'),
                                width: 100,
                                height: 100,
                              )
                            ],
                          ),
                          margin: EdgeInsets.only(
                              left: 20, top: 20, right: 20, bottom: 20),
                          constraints: BoxConstraints(
                            maxWidth: 500,
                            maxHeight: 135,
                            minWidth: 500,
                            minHeight: 50,
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        Expanded(
                            child: ListView.builder(
                                itemCount: arraylist_promotions.length,
                                itemBuilder: (context, index) {
                                  // return arraylist_promotions[index];
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.0, vertical: 16.0),
                                    // alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Text(
                                            arraylist_promotions[index][0] +
                                                '\n',
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.green)),
                                        Text(
                                            arraylist_promotions[index][1] +
                                                '\n',
                                            style: TextStyle(fontSize: 20))
                                      ],
                                    ),
                                    margin: EdgeInsets.only(
                                        left: 20,
                                        top: 20,
                                        right: 20,
                                        bottom: 0),
                                    constraints: BoxConstraints(
                                      maxWidth: 500,
                                      // maxHeight: 800,
                                      minWidth: 500,
                                      minHeight: 50,
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: Colors.amber.shade200,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  );
                                })),
                      ],
                    );
                  });
            }));
  }

  getExpenseItems(snapshot, snapshot2) async {
    arraylist_promotions.clear();
    // QuerySnapshot querySnapshot =
    //     await FirebaseFirestore.instance.collection("collection").get();
    for (int i = 0; i < snapshot.data!.docs.length; i++) {
      var a = snapshot.data!.docs[i];
      print(a.id);
      arraylist_promotions.add([a.id, a['內容'].join("")]);
    }

    for (int i = 0; i < snapshot2.data!.docs.length; i++) {
      var b = snapshot2.data!.docs[i];
      print(b.id);
      arraylist_promotions.add([b.id, b['內容'].join("")]);
    }
  }
}
