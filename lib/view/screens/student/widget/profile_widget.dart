import 'package:erp_school/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color? titleColor;

  const ProfileDetail({
    required this.icon,
    required this.title,
    required this.value,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: Theme.of(context).primaryColor),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: interMedium.copyWith(
                      color: Theme.of(context).primaryColor, fontSize: 16),
                ),
                Text(
                  value,
                  style: interMedium.copyWith(
                      fontSize: 16, color: Theme.of(context).disabledColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
