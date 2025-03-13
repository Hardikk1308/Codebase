import 'package:erp_school/themes/light.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/screens/gallery/add_activity.dart';
import 'package:erp_school/view/screens/gallery/event_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryScreen extends StatefulWidget {
  final bool teacherHomework;
  const GalleryScreen({super.key,this.teacherHomework = false});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      floatingActionButton: widget.teacherHomework
          ? FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Get.to(AddActivityScreen());
        },
        child: Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor),
          child: Center(
            child: Icon(
              Icons.add,
              color: Theme.of(context).cardColor,
            ),
          ),
        ),
      )
          : null,
      appBar: CustomAppBar(
        title: 'Gallery'.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            20.h,
            GestureDetector(
              onTap: () {
                Get.to(EventDetailsScreen());
              },
              child: Container(
                width: Get.width,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      child: Column(
                        children: [
                          Image.asset(Images.gallerPng),
                          7.h,
                          Text(
                            'Special Events | San Academy Group Of Schools Under Kamakoti Nagar',
                            style: interMedium.copyWith(
                                fontSize: 14,
                                color: Theme.of(context).disabledColor),
                          )
                        ],
                      ),
                    ),
                    8.h,
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      height: 35,
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          color: Theme.of(context).primaryColor,
                          boxShadow: [customBoxShadow()]),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: Theme.of(context).cardColor,
                                size: 16,
                              ),
                              5.w,
                              Text(
                                '13 Nov 2024  08:28 A.M'.tr,
                                style: interRegular.copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).cardColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.photo_library,
                                color: Theme.of(context).cardColor,
                                size: 16,
                              ),
                              5.w,
                              Text(
                                '20'.tr,
                                style: interRegular.copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).cardColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(EventDetailsScreen());
              },
              child: Container(
                width: Get.width,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      child: Column(
                        children: [
                          Image.asset(Images.gallerthreePng),
                          7.h,
                          Text(
                            'Special Events | San Academy Group Of Schools Under Kamakoti Nagar',
                            style: interMedium.copyWith(
                                fontSize: 14,
                                color: Theme.of(context).disabledColor),
                          )
                        ],
                      ),
                    ),
                    8.h,
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      height: 35,
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          color: Theme.of(context).primaryColor,
                          boxShadow: [customBoxShadow()]),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: Theme.of(context).cardColor,
                                size: 16,
                              ),
                              5.w,
                              Text(
                                '13 Nov 2024  08:28 A.M'.tr,
                                style: interRegular.copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).cardColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.photo_library,
                                color: Theme.of(context).cardColor,
                                size: 16,
                              ),
                              5.w,
                              Text(
                                '20'.tr,
                                style: interRegular.copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).cardColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(EventDetailsScreen());
              },
              child: Container(
                width: Get.width,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      child: Column(
                        children: [
                          Image.asset(Images.gallerPng),
                          7.h,
                          Text(
                            'Special Events | San Academy Group Of Schools Under Kamakoti Nagar',
                            style: interMedium.copyWith(
                                fontSize: 14,
                                color: Theme.of(context).disabledColor),
                          )
                        ],
                      ),
                    ),
                    8.h,
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      height: 35,
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          color: Theme.of(context).primaryColor,
                          boxShadow: [customBoxShadow()]),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: Theme.of(context).cardColor,
                                size: 16,
                              ),
                              5.w,
                              Text(
                                '13 Nov 2024  08:28 A.M'.tr,
                                style: interRegular.copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).cardColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.photo_library,
                                color: Theme.of(context).cardColor,
                                size: 16,
                              ),
                              5.w,
                              Text(
                                '20'.tr,
                                style: interRegular.copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).cardColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(EventDetailsScreen());
              },
              child: Container(
                width: Get.width,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      child: Column(
                        children: [
                          Image.asset(Images.gallerthreePng),
                          7.h,
                          Text(
                            'Special Events | San Academy Group Of Schools Under Kamakoti Nagar',
                            style: interMedium.copyWith(
                                fontSize: 14,
                                color: Theme.of(context).disabledColor),
                          )
                        ],
                      ),
                    ),
                    8.h,
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      height: 35,
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          color: Theme.of(context).primaryColor,
                          boxShadow: [customBoxShadow()]),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: Theme.of(context).cardColor,
                                size: 16,
                              ),
                              5.w,
                              Text(
                                '13 Nov 2024  08:28 A.M'.tr,
                                style: interRegular.copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).cardColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.photo_library,
                                color: Theme.of(context).cardColor,
                                size: 16,
                              ),
                              5.w,
                              Text(
                                '20'.tr,
                                style: interRegular.copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).cardColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
