import 'package:erp_school/themes/light.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadResultWidget extends StatelessWidget {
  const UploadResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [customBoxShadow()]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ruhi Sharma',
                style: interMedium.copyWith(
                    fontSize: 16, color: Theme.of(context).disabledColor),
              ),
              Text(
                'Roll number : 001',
                style: interRegular.copyWith(
                    fontSize: 14, color: Theme.of(context).hintColor),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.surface),
            child: Center(
              child: Text(
                'enter_marks'.tr,
                style: interMedium.copyWith(
                    fontSize: 14, color: Theme.of(context).disabledColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
