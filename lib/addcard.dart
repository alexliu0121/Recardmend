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
  List<DropdownMenuItem> getItems() {
    List<DropdownMenuItem> items = [
      DropdownMenuItem(
        value: "中國信託",
        child:
            Text("中國信託", style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
      DropdownMenuItem(
        value: "國泰世華",
        child:
            Text("國泰世華", style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
      DropdownMenuItem(
        value: "玉山銀行",
        child:
            Text("玉山銀行", style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    ];
    // for (int i = 0; i < 10; i++) {
    //   items.add(DropdownMenuItem(
    //     value: "${i}",
    //     child: Text("item ${i}"),
    //   ));
    // }
    return items;
  }

  List<DropdownMenuItem> getItems_card() {
    List<DropdownMenuItem> items_sample = [
      DropdownMenuItem(
        value: "請先選擇銀行",
        child:
            Text("請先選擇銀行", style: TextStyle(fontSize: 20, color: Colors.white)),
      )
    ];
    List<DropdownMenuItem> items_ctbc = [
      DropdownMenuItem(
        value: "中國信託卡1",
        child:
            Text("中國信託卡1", style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
      DropdownMenuItem(
        value: "中國信託卡2",
        child:
            Text("中國信託卡2", style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
      DropdownMenuItem(
        value: "中國信託卡3",
        child:
            Text("中國信託卡3", style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    ];
    List<DropdownMenuItem> items_cathay = [
      DropdownMenuItem(
        value: "國泰世華卡1",
        child:
            Text("國泰世華卡1", style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
      DropdownMenuItem(
        value: "國泰世華卡2",
        child:
            Text("國泰世華卡2", style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
      DropdownMenuItem(
        value: "國泰世華卡3",
        child:
            Text("國泰世華卡3", style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    ];
    List<DropdownMenuItem> items_esun = [
      DropdownMenuItem(
        value: "玉山銀行卡1",
        child:
            Text("玉山銀行卡1", style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
      DropdownMenuItem(
        value: "玉山銀行卡2",
        child:
            Text("玉山銀行卡2", style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
      DropdownMenuItem(
        value: "玉山銀行卡3",
        child:
            Text("玉山銀行卡3", style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    ];
    if (itemValue == "中國信託") {
      return items_ctbc;
    } else if (itemValue == "國泰世華") {
      return items_cathay;
    } else if (itemValue == "玉山銀行") {
      return items_esun;
    } else {
      return items_sample;
    }
  }

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
                                Text("選擇銀行:",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white)),
                                DropdownButton(
                                  hint: Text(
                                      "請選擇銀行                              ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                  items: getItems(),
                                  value: itemValue,
                                  elevation: 1,
                                  icon: Transform.rotate(
                                    angle: 135 * math.pi / 90,
                                    child: Icon(Icons.arrow_back_ios_rounded,
                                        size: 20, color: Colors.white),
                                  ),
                                  onChanged: (dynamic T1) {
                                    //下拉菜单item点击之后的回调
                                    setState(() {
                                      itemValue = T1;
                                    });
                                  },
                                  dropdownColor: Colors.grey,
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text("選擇信用卡:",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white)),
                                DropdownButton(
                                  hint: Text("請選擇信用卡                          ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                  items: getItems_card(),
                                  value: itemValue_card,
                                  elevation: 1,
                                  icon: Transform.rotate(
                                    angle: 135 * math.pi / 90,
                                    child: Icon(Icons.arrow_back_ios_rounded,
                                        size: 20, color: Colors.white),
                                  ),
                                  onChanged: (dynamic T2) {
                                    //下拉菜单item点击之后的回调
                                    setState(() {
                                      itemValue_card = T2;
                                      card_details.add(itemValue);
                                      card_details.add(itemValue_card);
                                    });
                                  },
                                  dropdownColor: Colors.grey,
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Image(
                                  image: AssetImage(
                                    'assets/card1.png',
                                  ),
                                  width: 450,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    picbutton(
                                        iconSting: 'assets/取消BT.png',
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        height: 120.0,
                                        width: 120.0),
                                    picbutton(
                                        iconSting: 'assets/新增BT.png',
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(card_details);
                                        },
                                        height: 120.0,
                                        width: 120.0),
                                  ],
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
