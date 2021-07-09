import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Widget? _child;
  final void Function()? _function;
  final ButtonStyle _style = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(26))),
      primary: Colors.white);

  RoundedButton({@required void Function()? onPressed, Widget? child})
      : this._child = child,
        this._function = onPressed;

  Widget build(BuildContext context) {
    return ElevatedButton(
      child: this._child,
      onPressed: this._function,
      style: this._style,
    );
  }
}
