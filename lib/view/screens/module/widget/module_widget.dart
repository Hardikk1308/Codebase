import 'package:erp_school/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ModuleWidget extends StatelessWidget {
  const ModuleWidget({
    super.key,
    required this.context,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final BuildContext context;
  final String icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(6),
                  // border:
                  //     Border.all(color: Theme.of(context).primaryColorLight)
                  ),
              child: SvgPicture.asset(
                icon,
                height: 70,
                width: 70,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: interMedium.copyWith(
                      fontSize: 15,
                      color: Theme.of(context).disabledColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: interRegular.copyWith(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).primaryColor,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
