import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:sy_order/core/utils/constants/text_style.dart';

class CustomAlertDialogHtml extends StatelessWidget {
  final String title;
  final String content;
  final String cancelText;
  final String confirmText;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const CustomAlertDialogHtml({
    super.key,
    required this.title,
    required this.content,
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
      content: HtmlWidget(
        '''
  <span style="font-size: 20px;">${content}</span>
  ''',
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
