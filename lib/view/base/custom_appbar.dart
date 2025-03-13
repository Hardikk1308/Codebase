import 'package:erp_school/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTile;

  @override
  Size get preferredSize => const Size.fromHeight(55);

  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTile = false,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 6,
            blurRadius: 4,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: AppBar(
        elevation: 44,backgroundColor: Color(0xffEFEBEB),
        // shadowColor: Colors.black.withOpacity(0.0),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).disabledColor,
          ),
        ),
        automaticallyImplyLeading: false,
        // backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.title,
          style: interMedium.copyWith(
            color: Theme.of(context).disabledColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
