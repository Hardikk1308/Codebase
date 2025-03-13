import 'package:erp_school/utils/styles.dart';
import 'package:flutter/material.dart';

class StudentWidget extends StatelessWidget {
  const StudentWidget({
    super.key,

    required this.label,
    required this.icon, required this.onpressed,
  });


  final String label;
  final String icon;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onpressed,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6,vertical: 6),
            height: height*0.08,
            width: width*0.5 /*115*/,
            decoration: BoxDecoration(
              // color: Colors.white,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                // BoxShadow(
                //   color: Colors.grey.withOpacity(0.1),
                //   spreadRadius: 2,
                //   blurRadius: 5,
                //   offset: Offset(0, 3),
                // ),
              ],
            ),
            child:
                // ClipRRect(
                //   child: CustomImage(
                //     image: '',
                //
                //   ),
                // ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                    child: Image.asset(icon,height: 93,width: 93,)),
          ),
        ),
        SizedBox(height: 0),
        Text(label,
            style: interMedium.copyWith(
                fontSize: 11, color: Theme.of(context).disabledColor)),
      ],
    );
  }
}
