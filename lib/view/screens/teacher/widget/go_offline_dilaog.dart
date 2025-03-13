import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoOfflineDialog extends StatefulWidget {
  @override
  State<GoOfflineDialog> createState() => _GoOfflineDialogState();
}

class _GoOfflineDialogState extends State<GoOfflineDialog> {
  int selectedValue = -1; // Initial selected value (-1 means none selected)

  @override
  Widget build(BuildContext context) {
    final reasons = [
      'Taking time off for personal reasons.',
      'Unavailable due to health issues.',
      'Attending training or workshops.',
      'Engaged in supervising or grading exams.',
      'Participating in a scheduled school activity.',
      'Other',
    ];

    return Container(
      width: Get.width,
      child: AlertDialog(
        backgroundColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'go_offline'.tr,
              style: interSemiBold.copyWith(
                fontSize: 22,
                color: Theme.of(context).disabledColor,
              ),
            ),
            IconButton(
              icon: Icon(Icons.close, color: Theme.of(context).disabledColor),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'select_reason'.tr,
              style: interMedium.copyWith(
                color: Theme.of(context).disabledColor,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            ...List.generate(reasons.length, (index) {
              return ListTile(
                leading: Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Theme.of(context).hintColor,
                  ),
                  child: Radio<int>(
                    activeColor: Theme.of(context).disabledColor,
                    value: index, // Unique value for each radio button
                    groupValue: selectedValue, // The currently selected value
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                ),
                title: Text(
                  reasons[index],
                  style: interMedium.copyWith(
                    fontSize: 12,
                    color: Theme.of(context).disabledColor,
                  ),
                ),
              );
            }),
            SizedBox(height: 16),
            CustomButton(
              height: 50,
              fontSize: 16,
              color: true,
              radius: 50,
              title: 'submit'.tr,
              onPressed: () {
                if (selectedValue != -1) {
                  // Handle submission with selected reason
                  print('Selected reason: ${reasons[selectedValue]}');
                  Navigator.of(context).pop();
                } else {
                  // Handle no selection
                  print('No reason selected');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// To show the dialog
void showGoOfflineDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => GoOfflineDialog(),
  );
}
