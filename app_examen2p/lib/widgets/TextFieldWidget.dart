import 'package:app_examen2p/utils/Global.dart';
import 'package:flutter/material.dart';


class TextFieldWidget extends StatelessWidget {
  
  final String? hintText;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final Color? color;
  final bool? isfilled;
  final bool? isVisible;
  final TextEditingController? controller;
  final bool? isMyControllerActivate;

  const TextFieldWidget({
    Key? key,
    this.hintText,
    this.onChanged,
    this.onTap,
    this.isVisible = true,
    this.color =  Colors.white,
    this.isfilled = true,
    this.controller,
    this.isMyControllerActivate = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSizeTextField = 15;

    return TextFormField(
      textInputAction: TextInputAction.done,
      controller: isMyControllerActivate == false ? null : controller,
      obscureText: !isVisible!,
      onChanged: onChanged,
      onTap: onTap,
      cursorColor: color,
      style: TextStyle(
        color: color,
        fontSize: fontSizeTextField
      ),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: color),
        focusColor: color,
        filled: isfilled,
        fillColor: Global.colorBlancoTransparente,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: Global.colorBlancoTransparente)),
        focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: Global.colorBlancoTransparente)),
        labelText: hintText,
      ),
    );
  }
}
