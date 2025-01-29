import 'package:flutter/material.dart';

class CommonTextFormField extends StatelessWidget {
  final Color bgColor, borderColor;
  final String hintText;
  final Color hintTextColor;
  final Widget? prefixIcon;
  final Color color;
  final bool noBordr;
  final TextInputType keyboardType;
  // final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final int? maxLength;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final bool enabled;
  final bool readOnly;
  final double radius;
  final int? minLine;
  final int? maxLine;
  final FocusNode? focusNode;
  final bool isFromChat;
  final void Function(String)? onChanged;

  const CommonTextFormField({
    this.noBordr = false,
    this.borderColor = Colors.black12,
    super.key,
    required this.bgColor,
    required this.hintText,
    this.hintTextColor = Colors.grey,
    this.color = Colors.black,
    required this.keyboardType,
    // required this.textInputAction,
    this.validator,
    this.maxLength,
    required this.controller,
    this.contentPadding = const EdgeInsets.only(left: 10),
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.focusNode,
    this.enabled = true,
    this.readOnly = false,
    this.radius = 10,
    this.minLine,
    this.maxLine,
    this.isFromChat = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onTap: onTap,
      style: TextStyle(
        color: color,
        fontSize: 14,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      // textInputAction: textInputAction,
      enabled: enabled,
      focusNode: focusNode,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        counterText: '',
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: noBordr
              ? BorderSide.none
              : BorderSide(
                  color: borderColor,
                ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: noBordr
              ? BorderSide.none
              : BorderSide(
                  color: borderColor,
                ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: noBordr
              ? BorderSide.none
              : BorderSide(
                  color: borderColor,
                ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: noBordr
              ? BorderSide.none
              : BorderSide(
                  color: borderColor,
                ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: suffixIcon,
        fillColor: bgColor,
        filled: true,
        labelText: hintText,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
      validator: validator,
      maxLength: maxLength,
      controller: controller,
      readOnly: readOnly,
      minLines: minLine,
      maxLines: maxLine,
    );
  }
}

class CommonTextWidget extends StatelessWidget {
  final Color color;
  final String text;
  final double fontSize;
  final TextAlign align;
  final double letterSpacing;
  final FontWeight fontWeight;
  final int? maxLines;
  final double? height;
  final double? wordSpacing;
  final TextOverflow? overFlow;

  const CommonTextWidget({
    super.key,
    required this.color,
    required this.text,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 0.5,
    this.maxLines,
    this.align = TextAlign.center,
    this.overFlow,
    this.height,
    this.wordSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      text,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: '',
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        overflow: overFlow,
        wordSpacing: wordSpacing,
      ),
    );
  }
}
