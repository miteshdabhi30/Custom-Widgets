import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final String title;
  final VoidCallback? onTap;
  final IconData icon;

  const CustomListTile({
    super.key,
    required this.title,
    required this.iconColor,
    required this.backgroundColor,
    this.onTap,
    required this.icon

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: backgroundColor, child: Icon(icon, color: iconColor)),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
