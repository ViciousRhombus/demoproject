import 'package:demoproject/Constants/font_colors.dart';
import 'package:flutter/material.dart';

class DropDownField extends StatelessWidget {
  const DropDownField({
    super.key,
    this.value,
    this.onChanged,
    required this.items,
    required this.title,
  });

  final String? value;
  final Function(String?)? onChanged;
  final List<DropdownMenuItem<String>> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String?>(
          items: items,
          onChanged: onChanged,
          value: value,
          hint: Text(title,
              style: TextStyle(
                  fontSize: 15.5,
                  fontFamily: AppConst.openSans,
                  color: Colors.grey[700])),
          style: const TextStyle(
              fontFamily: AppConst.openSans, color: AppConst.blackColor),
          decoration: InputDecoration(
              fillColor: AppConst.whiteColor,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(20)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(20)))),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontFamily: AppConst.openSans,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color));
  }
}
