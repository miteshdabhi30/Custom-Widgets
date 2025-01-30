import 'package:flutter/material.dart';
import 'package:sy_order/core/utils/constants/colors.dart';
import 'package:sy_order/core/utils/custom_widgets/custom_loading_indicator.dart';

import '../constants/text_style.dart';

class CustomButton extends StatelessWidget {
  final Color? color;
  final String buttonName;
  final double verticalPadding;
  final double? width;
  final double? radius;
  final VoidCallback? onTap;
  final bool isLoading;

  const CustomButton(
      {super.key,
      this.color,
      required this.buttonName,
      required this.verticalPadding,
      this.width,
      this.radius,
      this.onTap,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: color ?? AppColors.primaryColor1,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(0, 2),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            borderRadius: BorderRadius.circular(radius ?? 6)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          child: Center(
              child: isLoading
                  ? const CustomLoadingIndicator()
                  : Text(buttonName, style: AppTextStyle.whiteBoldNormalLine2)),
        ),
      ),
    );
  }
}
