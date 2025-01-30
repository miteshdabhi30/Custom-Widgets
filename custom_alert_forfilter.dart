import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sy_order/core/utils/constants/text_style.dart';
import 'package:sy_order/core/utils/custom_widgets/custom_button.dart';
import 'package:sy_order/core/utils/custom_widgets/custom_radio_button.dart';
import 'package:sy_order/view_model/dispatch/dispatch_screen_provider.dart';

class CustomAlertForFilter extends StatelessWidget {
  const CustomAlertForFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DispatchScreenProvider>(context);
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: const Text("Filter", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      content: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Date: ", style: AppTextStyle.blackBoldNormalLine3),
                  const SizedBox(width: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        border: Border.all(color: Colors.black38),
                        borderRadius: BorderRadius.circular(5)),
                    child: GestureDetector(
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              provider.selectedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
                            });
                            provider.fetchHistory(
                                provider.vendorId.toString(),
                                provider.selectedDate,
                                provider.selectedCity,
                                provider.selectedTransportId,
                                provider.orderStatus);
                          }
                        },
                        child: Text(
                            provider.selectedDate == "" ? "Select Date" : provider.selectedDate)),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.7,
                height: 40,
                child: CustomDropdown.search(
                  items: provider.vendorList,
                  onChanged: (value) async {
                    provider.setSelectedVendor(value);
                    int index = provider.vendorList.indexOf(value!);
                    if (index != -1) {
                      setState(() {
                        provider.vendorId = provider.vendorIdList[index].toString();
                      });
                    }
                    provider.fetchHistory(provider.vendorId.toString(), provider.selectedDate,
                        provider.selectedCity, provider.selectedTransportId, provider.orderStatus);
                  },
                  hintText:
                      provider.selectedVendor == "" ? "Select Vendor" : provider.selectedVendor,
                  searchHintText: "Search",
                  noResultFoundText: "Loading...",
                  decoration: CustomDropdownDecoration(
                      closedBorder: Border.all(color: Colors.grey),
                      closedBorderRadius: BorderRadius.circular(8),
                      expandedBorderRadius: BorderRadius.circular(8),
                      expandedBorder: Border.all(color: Colors.grey),
                      hintStyle: AppTextStyle.blackNormalLine2),
                  closedHeaderPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.7,
                height: 40,
                child: CustomDropdown.search(
                  items: provider.cityList,
                  onChanged: (value) async {
                    setState(() {
                      provider.citySelection(value);
                    });
                    provider.fetchHistory(provider.vendorId.toString(), provider.selectedDate,
                        provider.selectedCity, provider.selectedTransportId, provider.orderStatus);
                  },
                  hintText: "Select City",
                  searchHintText: "Search",
                  decoration: CustomDropdownDecoration(
                    closedBorder: Border.all(color: Colors.grey),
                    closedBorderRadius: BorderRadius.circular(8),
                    expandedBorderRadius: BorderRadius.circular(8),
                    expandedBorder: Border.all(color: Colors.grey),
                    hintStyle: AppTextStyle.blackNormalLine2,
                  ),
                  closedHeaderPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 1.7,
                  height: 40,
                  child: CustomDropdown.search(
                    items: provider.transportList,
                    onChanged: (value) async {
                      for (int i = 0; i < provider.transportList.length; i++) {
                        if (provider.transportList[i] == value) {
                          setState(() {
                            provider.transportSelection(i);
                          });
                        }
                      }
                      provider.setSelectedTransport(value);
                      provider.fetchHistory(
                          provider.vendorId.toString(),
                          provider.selectedDate,
                          provider.selectedCity,
                          provider.selectedTransportId,
                          provider.orderStatus);
                    },
                    hintText: "Select Transport",
                    searchHintText: "Search",
                    noResultFoundText: "Loading...",
                    decoration: CustomDropdownDecoration(
                        closedBorder: Border.all(color: Colors.grey),
                        closedBorderRadius: BorderRadius.circular(8),
                        expandedBorderRadius: BorderRadius.circular(8),
                        expandedBorder: Border.all(color: Colors.grey),
                        hintStyle: AppTextStyle.blackNormalLine2),
                    closedHeaderPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    overlayHeight: 400,
                  )),
              const SizedBox(height: 10),
              Text("Order Status", style: AppTextStyle.blackBoldNormalLine3),
              const SizedBox(height: 5),
              CustomRadioButton(
                  value: "Dispatched",
                  groupValue: provider.orderStatus,
                  onChanged: (value) async {
                      provider.setOrderStatus(value);
                    await provider.fetchHistory(provider.vendorId.toString(), provider.selectedDate,
                        provider.selectedCity, provider.selectedTransportId, provider.orderStatus);
                    print(provider.vendorId);
                    print(provider.selectedDate);
                    print(provider.selectedCity);
                    print(provider.selectedTransportId);
                    print(provider.orderStatus);
                  },
                  label: "Dispatched"),
              const SizedBox(height: 5),
              CustomRadioButton(
                  value: "Pending Dispatch",
                  groupValue: provider.orderStatus,
                  onChanged: (value) {
                    setState(() {
                      provider.setOrderStatus(value);
                    });
                    provider.fetchHistory(provider.vendorId.toString(), provider.selectedDate,
                        provider.selectedCity, provider.selectedTransportId, provider.orderStatus);
                  },
                  label: "Pending Dispatch"),
            ],
          );
        },
      ),
      actions: <Widget>[
        Row(
          children: [
            Align(
                alignment: Alignment.center,
                child: CustomButton(
                  buttonName: "Done",
                  verticalPadding: 10,
                  width: 100,
                  onTap: () {
                    Navigator.pop(context);
                  },
                )),
            const SizedBox(width: 20),
            Align(
                alignment: Alignment.center,
                child: CustomButton(
                  buttonName: "Clear Filter",
                  verticalPadding: 10,
                  width: 100,
                  onTap: () async {
                    provider.clearFilter();
                    provider.setSelectedVendor("");
                    Navigator.pop(context);
                    await provider.fetchHistory("", "", "", "", "");
                  },
                )),
          ],
        ),
      ],
    );
  }
}
