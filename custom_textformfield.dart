import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sy_order/core/utils/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final IconButton? suffixIcon;
  final Icon? suffix;
  final Icon? prefix;
  final bool? obscure;
  final FormFieldValidator? validator;
  final double heightPadding;
  final double widthPadding;
  final FocusNode? focusNode;
  final ValueChanged? onSubmitted;
  final int? minLine;
  final int? maxLine;
  final ValueChanged? onChanged;
  final Color? color;
  final double? borderRadius;
  final Color? focusBorderColor;
  final int? fixedDigit;
  final Color? enableBorderColor;
  final TextAlign? textAlign;
  final bool? readOnly;
  final TextStyle? textStyle;

  const CustomTextFormField(
      {super.key,
      this.label, this.hintText,
      required this.controller,
      this.keyboardType,
      this.suffixIcon,
      this.suffix,
      this.obscure = false,
      this.validator,
      this.heightPadding = 10,
      this.widthPadding = 10,
      this.focusNode,
      this.onSubmitted,
      this.minLine,
      this.maxLine = 1,
      this.onChanged,
      this.color,
      this.borderRadius,
      this.prefix,
      this.focusBorderColor,
      this.fixedDigit,
      this.enableBorderColor,
      this.textAlign,
      this.readOnly,
        this.textStyle
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        readOnly: readOnly ?? false,
        keyboardType: keyboardType,
        textAlign: textAlign ?? TextAlign.left,
        cursorColor: AppColors.primaryColor1,
        obscureText: obscure!,
        validator: validator,
        focusNode: focusNode,
        onFieldSubmitted: onSubmitted,
        onChanged: onChanged,
        minLines: minLine,
        maxLines: maxLine,
        inputFormatters: [
          LengthLimitingTextInputFormatter(fixedDigit),
        ],
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade600),
            labelText: label,
            labelStyle: const TextStyle(color: Colors.black54),
            suffixIcon: suffixIcon,
            suffix: suffix,
            prefixIcon: prefix,
            contentPadding: EdgeInsets.symmetric(vertical: heightPadding, horizontal: widthPadding),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: enableBorderColor ?? Colors.grey.shade200),
                borderRadius: BorderRadius.circular(borderRadius ?? 5)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: focusBorderColor ?? Colors.grey),
                borderRadius: BorderRadius.circular(borderRadius ?? 5)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: focusBorderColor ?? Colors.grey),
                borderRadius: BorderRadius.circular(borderRadius ?? 5)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: focusBorderColor ?? Colors.grey),
                borderRadius: BorderRadius.circular(borderRadius ?? 5)),
            fillColor: color ?? Colors.grey.shade200,
            filled: true),
      style: textStyle,
    );
  }
}
