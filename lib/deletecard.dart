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
enum SingingCharacter { lafayette, jefferson, koko_ryan, koko_peach }

class DeleteCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DeleteCard_less();
  }
}

class DeleteCard_less extends State<DeleteCard> {
  SingingCharacter? _character = SingingCharacter.koko_ryan;

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
                                ListTile(
                                  title: const Text('koko_ryan'),
                                  leading: Radio<SingingCharacter>(
                                    value: SingingCharacter.koko_ryan,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter? value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                                Image(
                                  image: AssetImage(
                                    'assets/card1.png',
                                  ),
                                  width: 450,
                                ),
                                ListTile(
                                  title: const Text('koko_peach'),
                                  leading: Radio<SingingCharacter>(
                                    value: SingingCharacter.koko_peach,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter? value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                                Image(
                                  image: AssetImage(
                                    'assets/card2.png',
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
                                        height: 100.0,
                                        width: 120.0),
                                    picbutton(
                                        iconSting: 'assets/新增BT.png',
                                        onPressed: () {
                                          Navigator.of(context).pop(_character);
                                        },
                                        height: 100.0,
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
                              maxHeight: 630,
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
