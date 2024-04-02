import 'package:flutter/material.dart';
import 'package:goldcity/util/constant/general_enum.dart';

import 'package:goldcity/util/enum/input_type.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';

class ErrorableRoundedTextField extends StatefulWidget {
  final String initValue;
  final String hintText;
  final int? maxLength;
  final InputType inputType;

  final Function(String) newText;
  const ErrorableRoundedTextField({
    super.key,
    this.initValue = "",
    this.hintText = "",
    this.inputType = InputType.TEXT,
    this.maxLength,
    required this.newText,
  });

  @override
  State<ErrorableRoundedTextField> createState() =>
      _ErrorableRoundedTextFieldState();
}

class _ErrorableRoundedTextFieldState extends State<ErrorableRoundedTextField> {
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
        borderRadius: context.midRadius,
        color: context.toColor(APPLICATION_COLOR.CLOSE_BACKGROUND_COLOR),
      ),
      alignment: Alignment.centerLeft,
      height: context.largeHeight,
      child: Padding(
        padding: context.midSpacerOnlyHorizontal,
        child: textFieldWidget(context, widget.inputType),
      ),
    );
  }

  TextField textFieldWidget(BuildContext context, InputType inputType) {
    return TextField(
      controller: _controller,
      keyboardType: inputType.getInputType(),
      autocorrect: false,
      maxLength: widget.maxLength,
      cursorColor: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
      style: TextStyle(
        color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
      ),
      obscureText: inputType == InputType.PASSWORD,
      decoration: InputDecoration.collapsed(
        hintText: widget.hintText,
      ),
    );
  }
}
