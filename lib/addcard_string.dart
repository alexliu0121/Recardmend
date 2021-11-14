import 'package:flutter/material.dart';
import 'package:flutter_app/home_widget.dart';
import 'RoundCheckBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'picbutton.dart';

var itemValue;
var itemValue_card;
List<String> card_details = [];

class AddCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddCard_less();
  }
}

class AddCard_less extends State<AddCard> {
  List<String> options = <String>['One', 'Two', 'Free', 'Four'];
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue.shade900,
          title: Text("Select card"),
        ),
        backgroundColor: Colors.lightBlue.shade900,
        body: SingleChildScrollView(
            child:
                // Image(
                //   image: AssetImage('assets/選擇卡片底圖2.png'),
                //   height: 600,
                //   width: 600,
                // ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.shade900,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 30.0),
                            // alignment: Alignment.center,

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DropdownButton<String>(
                                  value: dropdownValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  style: const TextStyle(color: Colors.blue),
                                  selectedItemBuilder: (BuildContext context) {
                                    return options.map((String value) {
                                      return Text(
                                        dropdownValue,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      );
                                    }).toList();
                                  },
                                  items: options.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                )
                              ],
                            )
                            // Image(
                            //   image: AssetImage('assets/選擇卡片底圖2.png'),
                            //   height: 600,
                            //   width: 600,
                            // )
                            ,
                            margin: EdgeInsets.only(
                                left: 50, top: 50, right: 50, bottom: 0),
                            constraints: BoxConstraints(
                              maxWidth: 700,
                              maxHeight: 600,
                              minWidth: 500,
                              minHeight: 50,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade600,
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                        ]))));
  }
}
