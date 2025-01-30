import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_order/core/utils/constants/text_style.dart';
import 'package:sy_order/core/utils/custom_widgets/custom_button.dart';
import 'package:sy_order/view_model/place_order/cartscreen_provider.dart';

class CustomAlertForMarka extends StatelessWidget {
  const CustomAlertForMarka({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartScreenProvider>(context);

    return Dialog(
      insetPadding: const EdgeInsets.only(bottom: 0, left: 0, right: 0), // Adjust top padding as needed
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select Marka",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              width: 350,
              child: StatefulBuilder(
                builder: (context, setState) {
                  return CustomDropdown.search(
                    items: provider.markaList,
                    onChanged: (value) {
                      for (int i = 0; i < provider.markaList.length; i++) {
                        if (provider.markaList[i] == value) {
                          provider.markaIdSelection(i);
                        }
                      }
                      provider.setSelectedMarka(value);
                    },
                    hintText: provider.selectedMarka != "" ? provider.selectedMarka : provider.initialMarka == ""
                        ? "Select Marka"
                        : provider.initialMarka,
                    searchHintText: "Search",
                    noResultFoundText: "Loading...",
                    decoration: CustomDropdownDecoration(
                      closedBorder: Border.all(color: Colors.grey),
                      closedBorderRadius: BorderRadius.circular(8),
                      expandedBorderRadius: BorderRadius.circular(8),
                      expandedBorder: Border.all(color: Colors.grey),
                      hintStyle: AppTextStyle.blackNormalLine2,
                    ),
                    closedHeaderPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    overlayHeight: 400,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              buttonName: "Done",
              verticalPadding: 10,
              width: 100,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
