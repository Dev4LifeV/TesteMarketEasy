import 'package:flutter/material.dart';

class FormFieldStyle extends InputDecoration {
  final InputBorder _underlineBorder =
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.white));

  final TextStyle _textStyle = TextStyle(color: Colors.white);

  final String? _hintText;

  FormFieldStyle({@required String? hintText}) : this._hintText = hintText;

  @override
  InputBorder? get border => _underlineBorder;

  @override
  InputBorder? get focusedBorder => _underlineBorder;

  @override
  InputBorder? get enabledBorder => _underlineBorder;

  @override
  String? get hintText => this._hintText;

  @override
  TextStyle? get hintStyle => this._textStyle;
}
