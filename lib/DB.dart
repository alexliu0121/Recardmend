import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class TestDBPage extends StatefulWidget {
  @override
  TestDBPageState createState() => new TestDBPageState();
}

class TestDBPageState extends State<TestDBPage> {
  var arraylist_promotions = <ListTile>[];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('DB demo'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('台新銀行').snapshots(),
        builder: (BuildContext content,
            AsyncSnapshot<QuerySnapshot> snapshot_taishin) {
          if (!snapshot_taishin.hasData) {
            return Text('Loading data...Please wait...');
          }
          if (snapshot_taishin.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot_taishin.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return StreamBuilder(
              stream: FirebaseFirestore.instance.collection('玉山銀行').snapshots(),
              builder: (BuildContext content_yushan,
                  AsyncSnapshot<QuerySnapshot> snapshot_yushan) {
                if (!snapshot_yushan.hasData) {
                  return Text('Loading data...Please wait...');
                }
                if (snapshot_yushan.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot_yushan.connectionState ==
                    ConnectionState.waiting) {
                  return Text("Loading");
                }
                getExpenseItems(snapshot_yushan, snapshot_taishin);

                return ListView.builder(
                    itemCount: arraylist_promotions.length,
                    itemBuilder: (context, index) {
                      return arraylist_promotions[index];
                    });
              });
        },
      ),
    );
  }

  getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot,
      AsyncSnapshot<QuerySnapshot> snapshot2) async {
    arraylist_promotions.clear();
    // QuerySnapshot querySnapshot =
    //     await FirebaseFirestore.instance.collection("collection").get();
    for (int i = 0; i < snapshot.data!.docs.length; i++) {
      var a = snapshot.data!.docs[i];
      print(a.id);
      arraylist_promotions.add(new ListTile(
          title: new Text(a.id), subtitle: new Text(a['內容'].join(""))));
    }

    for (int i = 0; i < snapshot2.data!.docs.length; i++) {
      var b = snapshot2.data!.docs[i];
      print(b.id);
      arraylist_promotions.add(new ListTile(
          title: new Text(b.id), subtitle: new Text(b['內容'].join(""))));
    }
  }
}
