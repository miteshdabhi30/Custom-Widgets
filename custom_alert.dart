import 'package:flutter/material.dart';
import 'package:sy_order/core/utils/constants/text_style.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String? content2;
  final String cancelText;
  final String confirmText;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.content2,
    required this.cancelText,
    required this.confirmText,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: Row(
        children: [Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold))],
      ),
      content: Column(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(content, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 5),
          Text(content2 ?? "", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red)),
        ],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: onCancel, child: Text(cancelText, style: AppTextStyle.fadedBoldNormalLine3)),
        TextButton(
            onPressed: onConfirm,
            child: Text(confirmText,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),
      ],
    );
  }
}
