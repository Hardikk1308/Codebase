import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: CustomAppBar(
        title: 'event_details'.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  'Special Events | San Academy Group Of Schools Under Kamakoti Nagar',
                  style: interMedium.copyWith(
                      fontSize: 13, color: Theme.of(context).disabledColor),
                ),
              ),
              10.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          child: Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            insetPadding: const EdgeInsets.all(16),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.symmetric(
                                        horizontal: 16,),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(width: 20,),
                                         Text(
                                          'Event Image',
                                          style: interMedium.copyWith(
                                            fontSize: 14,
                                            color: Theme.of(context).disabledColor
                                          )
                                        ),
                                        IconButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          icon:  Icon(Icons.close,color: Theme.of(context).disabledColor,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    child: Divider(color: Theme.of(context).hintColor,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                    child: ClipRRect(
                                      // borderRadius: const BorderRadius.vertical(
                                      //     bottom: Radius.circular(16)),
                                      child: Image.asset(
                                        Images.galleryDialogImage, // Replace with your image URL
                                        fit: BoxFit.cover,
                                        height: 280,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      child: Image.asset(
                        Images.galleryDetailsone,
                        height: 125,
                        width: Get.width / 3.50,
                      ),
                    ),
                  ),
                  ClipRRect(
                    child: Image.asset(
                      Images.galleryDetailsTwo,
                      height: 125,
                      width: Get.width / 3.50,
                    ),
                  ),
                  ClipRRect(
                    child: Image.asset(
                      Images.galleryDetailsThree,
                      height: 125,
                      width: Get.width / 3.50,
                    ),
                  ),
                ],
              ),
              10.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      Images.galleryDetailsfour,
                      height: 125,
                      width: Get.width / 3.50,
                    ),
                  ),
                  ClipRRect(
                    child: Image.asset(
                      Images.galleryDetailsfive,
                      height: 125,
                      width: Get.width / 3.50,
                    ),
                  ),
                  ClipRRect(
                    child: Image.asset(
                      Images.galleryDetailssix,
                      height: 125,
                      width: Get.width / 3.50,
                    ),
                  ),
                ],
              ),
              10.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      Images.galleryDetailsseven,
                      height: 125,
                      width: Get.width / 3.50,
                    ),
                  ),
                  ClipRRect(
                    child: Image.asset(
                      Images.galleryDetailseight,
                      height: 125,
                      width: Get.width / 3.50,
                    ),
                  ),
                  ClipRRect(
                    child: Image.asset(
                      Images.galleryDetailsnine,
                      height: 125,
                      width: Get.width / 3.50,
                    ),
                  ),
                ],
              ),
              10.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      Images.galleryDetailsten,
                      height: 125,
                      width: Get.width / 3.50,
                    ),
                  ),
                  ClipRRect(
                    child: Image.asset(
                      Images.galleryDetailelevan,
                      height: 125,
                      width: Get.width / 3.50,
                    ),
                  ),
                  ClipRRect(
                    child: Image.asset(
                      Images.galleryDetailsnine,
                      height: 125,
                      width: Get.width / 3.50,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
