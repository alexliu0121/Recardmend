import 'package:flutter/material.dart';

class picbutton extends StatelessWidget {
  const picbutton({
    Key? key,
    this.iconSting,
    this.onPressed,
    this.width,
    this.height,
    this.padding,
  }) : super(key: key);

  final iconSting; //图片的地址
  final onPressed; //执行的方法
  final width; //宽
  final height; //高
  final padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(iconSting),
            // fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
