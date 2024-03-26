import 'package:flutter/material.dart';

import 'package:goldcity/util/enum/input_type.dart';
import 'package:goldcity/util/extension/design_extension.dart';

class RoundedTextField extends StatefulWidget {
  final String initValue;
  final String hintText;
  final int? maxLength;

  final Function(String) newText;
  const RoundedTextField({
    super.key,
    this.initValue = "",
    this.hintText = "",
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
        borderRadius: context.largeRadius,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
      width: context.sWidth,
      height: context.largeHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: textFieldWidget(context, InputType.TEXT),
      ),
    );
  }

  TextField textFieldWidget(BuildContext context, InputType inputType) {
    return TextField(
      controller: _controller,
      keyboardType: getInputType(inputType),
      autocorrect: false,
      maxLength: widget.maxLength,
      obscureText: inputType == InputType.PASSWORD,
      decoration: InputDecoration.collapsed(
        hintText: widget.hintText,
      ),
    );
  }

  TextInputType getInputType(InputType inputType) {
    return switch (inputType) {
      InputType.MAIL => TextInputType.emailAddress,
      InputType.TEXT => TextInputType.text,
      InputType.PHONE => TextInputType.phone,
      InputType.PASSWORD => TextInputType.visiblePassword,
      InputType.VISIBLE_PASSWORD => TextInputType.visiblePassword,
      InputType.NUMBER => TextInputType.number,
    };
  }
}
