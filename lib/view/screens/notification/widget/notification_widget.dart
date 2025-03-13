import 'package:erp_school/data/models/response/notification_model.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_Image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationModel notification;

  const NotificationWidget({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           DateFormat("EEEE").format(DateTime.parse(notification.notificationDate)),
            style: interMedium.copyWith(
              color: Theme.of(context).disabledColor,
              fontSize: 16,
            ),
          ),
          15.h,
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const ClipRRect(
                      child: CustomImage(
                        image: '',
                        height: 60,
                        width: 60,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        notification.notificationTitle, // Dynamic title
                        style: interMedium.copyWith(
                          color: Theme.of(context).disabledColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_sharp,
                      color: Theme.of(context).primaryColor,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      DateFormat("dd-MM-yyy hh:mm a").format(DateTime.parse(notification.notificationDate)),
                       // Dynamic date
                      style: interMedium.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  notification.notificationMessage, // Dynamic message
                  style: interRegular.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}