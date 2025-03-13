import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestedLeavesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> leaveRequests = [
    {
      'dateRange': '18 Nov, 2024 - 20 Nov, 2024',
      'type': 'Sick Leave',
      'description':
          'Family commitment requiring out-of-town travel need urgent approval.',
      'status': 'Approved',
    },
    {
      'dateRange': '18 Nov, 2024 - 20 Nov, 2024',
      'type': 'Sick Leave',
      'description':
          'Family commitment requiring out-of-town travel need urgent approval.',
      'status': 'Rejected',
    },
    {
      'dateRange': '18 Nov, 2024 - 20 Nov, 2024',
      'type': 'Sick Leave',
      'description':
          'Family commitment requiring out-of-town travel need urgent approval.',
      'status': 'Approved',
    },
    {
      'dateRange': '18 Nov, 2024 - 20 Nov, 2024',
      'type': 'Sick Leave',
      'description':
          'Family commitment requiring out-of-town travel need urgent approval.',
      'status': 'Rejected',
    },
  ];

  RequestedLeavesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,

      appBar: CustomAppBar(
        title: 'requested_leaves'.tr,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: leaveRequests.length,
        itemBuilder: (context, index) {
          final leave = leaveRequests[index];
          final statusColor = leave['status'] == 'Approved'
              ? Theme.of(context).splashColor
              : Theme.of(context).canvasColor;

          return
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: [BoxShadow()],
                borderRadius:
                BorderRadius.circular(Dimensions.radiusDefault),
              ),
            // margin: EdgeInsets.only(bottom: 10),
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(12),
            // ),
            // elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today,
                          size: 16, color: Theme.of(context).primaryColor),
                      SizedBox(width: 8),
                      Text(leave['dateRange'],
                          style: interMedium.copyWith(
                              fontSize: 14,
                              color: Theme.of(context).primaryColor)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(leave['type'],
                          style: interMedium.copyWith(
                              fontSize: 14,
                              color: Theme.of(context).disabledColor)),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          leave['status'],
                          style: interRegular.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: statusColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    leave['description'],
                    style: interMedium.copyWith(
                        fontSize: 12, color: Theme.of(context).hintColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
