import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? title;
  final String? image;
  final double? height;
  final bool? withIcon;
  final double? textSize;
  final TextAlign? textAlign;
  final void Function()? onPressed;
  final Color? color;

  const ButtonWidget(
      {Key? key,
      this.title,
      this.image,
      this.height,
      this.withIcon,
      this.textSize,
      this.textAlign,
      this.onPressed,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                height: height!,
                alignment: Alignment.center,
                color: color,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: ListTile(
                    onTap: onPressed,
                    title: Text(
                      title!,
                      textAlign: textAlign,
                      textScaleFactor: textSize,
                      style: const TextStyle(color: Colors.white, fontFamily: 'RaleWay'),
                    )),
                ),
            ),
            )
          );
  }
}

