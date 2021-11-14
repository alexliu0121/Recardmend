import 'package:flutter/material.dart';

class RoundCheckBox extends StatefulWidget {
  var value = false;

  Function(bool) onChanged;

  RoundCheckBox({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  _RoundCheckBoxState createState() => _RoundCheckBoxState();
}

class _RoundCheckBoxState extends State<RoundCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: () {
            widget.value = !widget.value;
            widget.onChanged(widget.value);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: widget.value
                ? Icon(
                    Icons.check_circle,
                    size: 25.0,
                    color: Colors.lightBlue,
                  )
                : Icon(
                    Icons.panorama_fish_eye,
                    size: 25.0,
                    color: Colors.grey,
                  ),
          )),
    );
  }
}
