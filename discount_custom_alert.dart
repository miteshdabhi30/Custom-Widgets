import 'package:flutter/material.dart';
import 'package:sy_order/core/utils/constants/text_style.dart';
import 'package:sy_order/core/utils/custom_widgets/custom_button.dart';
import 'package:sy_order/core/utils/custom_widgets/custom_textformfield.dart';

class DiscountCustomAlert {
  static Future<void> show(BuildContext context,
      {required String title,
      required VoidCallback onSubmit,
      required TextEditingController controller,
      required String discountType
      }) async {
    final formKey = GlobalKey<FormState>();
    final FocusNode focusNode = FocusNode();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          focusNode.requestFocus();
        });
        return AlertDialog(
          title: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 5),
              Text("Discount Type:- $discountType",style: const TextStyle(fontSize: 15))
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Adjust size to fit content
            children: <Widget>[
              Form(
                  key: formKey,
                  child: CustomTextFormField(
                    controller: controller,
                    focusNode: focusNode,
                    keyboardType: TextInputType.phone,
                    color: Colors.transparent,
                    focusBorderColor: Colors.grey,
                    enableBorderColor: Colors.grey,
                    hintText: 'Enter Discount',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter discount';
                      }
                      return null;
                    },
                  )),
              const SizedBox(height: 5),
              const Text("Note:- If you hit submit button, All quantity you entered will remove!", style: TextStyle(color: Colors.red, fontSize: 12),)
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black87, fontSize: 16),
              ),
            ),
            CustomButton(
              buttonName: 'Submit',
              verticalPadding: 4,
              width: 80,
              onTap: () {
                onSubmit();
              },
            )
          ],
        );
      },
    );
  }
}
