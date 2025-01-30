import 'package:flutter/material.dart';

import '../constants/app_strings.dart';
import '../constants/colors.dart';
import '../constants/text_style.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const CustomAppbar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title ?? AppStrings.name, style: AppTextStyle.whiteNormalLine1),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: AppColors.whiteColor)),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("version: ${AppStrings.appVersion}", style: AppTextStyle.whiteNormalLine4),
              Text("${AppStrings.date}      ", style: AppTextStyle.whiteNormalLine4)
            ],
          ),
        ],
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        backgroundColor: AppColors.primaryColor1,
        elevation: 12,
        scrolledUnderElevation: 12,
        shadowColor: Colors.grey);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
