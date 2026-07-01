import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/na-platform-info.service.dart';

class NaPlatformTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final bool obscureText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;

  const NaPlatformTextField({
    super.key,
    this.controller,
    this.placeholder,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (NaPlatformInfoService.isWindows) {
      return fluent.TextBox(controller: this.controller, placeholder: this.placeholder, obscureText: this.obscureText, keyboardType: this.keyboardType, onChanged: this.onChanged,);
    } else if (NaPlatformInfoService.isIOS) {
      return CupertinoTextField(
        controller: this.controller,
        placeholder: this.placeholder,
        obscureText: this.obscureText,
        keyboardType: this.keyboardType,
        onChanged: this.onChanged,
      );
    }else {
      return TextField(
        controller: this.controller,
        decoration: InputDecoration(
          hintText: this.placeholder,
        ),
        obscureText: this.obscureText,
        keyboardType: this.keyboardType,
        onChanged: this.onChanged,
      );
    }
  }
}




