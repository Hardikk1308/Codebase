import 'package:erp_school/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const NameWidget({
    super.key, required this.title, required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$title'.tr,style: interMedium.copyWith(
              fontSize: 14,
              color: Theme.of(context).disabledColor
          ),),
          const Spacer(),
          Text('$subtitle'.tr,style: interRegular.copyWith(
              fontSize: 14,
              color: Theme.of(context).hintColor
          ),),
        ],
      ),
    );
  }
}
