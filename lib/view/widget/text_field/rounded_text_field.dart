import 'package:flutter/material.dart';
import 'package:goldcity/util/constant/general_enum.dart';

import 'package:goldcity/util/enum/input_type.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';

class RoundedTextField extends StatefulWidget {
  final String initValue;
  final String hintText;
  final int? maxLength;
  final InputType inputType;

  final Function(String) newText;
  const RoundedTextField({
    super.key,
    this.initValue = "",
    this.hintText = "",
    this.inputType = InputType.TEXT,
    this.maxLength,
    required this.newText,
  });

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      widget.newText(_controller.text);
    });
    _controller.text = widget.initValue;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                width: 1,
                color: context.toColor(APPLICATION_COLOR.OPPOSITE_COLOR))),
        color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
      ),
      alignment: Alignment.centerLeft,
      height: context.largeHeight,
      child: textFieldWidget(context, widget.inputType),
    );
  }

  TextField textFieldWidget(BuildContext context, InputType inputType) {
    return TextField(
      controller: _controller,
      keyboardType: inputType.getInputType(),
      autocorrect: false,
      maxLength: widget.maxLength,
      cursorColor: context.toColor(APPLICATION_COLOR.OPPOSITE_COLOR),
      style: TextStyle(
        color: context.toColor(APPLICATION_COLOR.OPPOSITE_COLOR),
      ),
      obscureText: inputType == InputType.PASSWORD,
      decoration: InputDecoration.collapsed(
        hintText: widget.hintText,
      ),
    );
  }
}
