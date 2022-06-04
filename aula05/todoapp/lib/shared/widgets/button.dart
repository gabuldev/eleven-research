import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final Function() onPressed;
  final String title;
  final bool? active;
  const Button({
    Key? key,
    required this.onPressed,
    required this.title,
    this.active,
  }) : super(key: key);

  @override
  State<Button> createState() => ButtonState();
}

class ButtonState extends State<Button> {
  late bool _active = widget.active ?? false;

  void onChange(bool value) {
    _active = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  _active ? const Color(0xff38C24E) : Colors.grey)),
          onPressed: _active ? widget.onPressed : null,
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
    );
  }
}
