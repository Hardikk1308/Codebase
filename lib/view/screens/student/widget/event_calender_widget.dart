import 'package:erp_school/data/models/request/event_model.dart';
import 'package:erp_school/themes/light.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:flutter/material.dart';


class EventCalenderWidget extends StatelessWidget {
  final Event event;
  const EventCalenderWidget({
    super.key, required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [customBoxShadow()],
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_month,
                  color: Theme.of(context).primaryColor,
                size: 13,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                  '${event.eventDate} ${event.eventTime}',
                style: interMedium.copyWith(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            event.eventName,
            style: interMedium.copyWith(
                fontSize: 14, color: Theme.of(context).disabledColor),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            event.eventDescription,
            style: interRegular.copyWith(
                fontSize: 11, color: Theme.of(context).disabledColor),
          )
        ],
      ),
    );
  }
}
