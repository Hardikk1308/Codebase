import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:flutter/material.dart';

class SidebarMenuButton extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final Function onPressed;
  final color;

  const SidebarMenuButton(
      {this.isSelected = false,
      required this.title,
      required this.icon,
      required this.onPressed,
        this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      height: 50,
      decoration: BoxDecoration(),
      child: InkWell(
        onTap: () => onPressed(),
        child: ListTile(
          trailing: Icon(
            Icons.arrow_forward_ios_outlined,
            color: Theme.of(context).cardColor,
            size: 18,
          ),
          leading: Image.asset(
            icon,
            height: 25,
            width: 25,
            color: color,
          ),
          title: Text(
            title,
            style: interRegular.copyWith(
                color: Theme.of(context).cardColor,
                fontSize: Dimensions.fontSizeSmall),
          ),
        ),
      ),
    );
  }
}
