import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../data/models/notification_model.dart';
import '../../generated/assets.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String description;
  final Timestamp timestamp;
  final NotificationState state;

  const NotificationItem({
    super.key,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    String notificationIcon = state == NotificationState.Announcements
        ? Assets.imagesNotificationAnnouncments
        : state == NotificationState.ConfirmedOrder
            ? Assets.imagesNotificationConfrmOrder
            : state == NotificationState.OrderAssigned
                ? Assets.imagesNotificationOrderAssigned
                : state == NotificationState.OrderCompleted
                    ? Assets.imagesNotificationOrderCompleted
                    : state == NotificationState.OrderCancelled
                        ? Assets.imagesNotificationOrderCancelled
                        : state == NotificationState.OrderAccepted
                            ? Assets.imagesNotificationOrderAccepted
                            : '';
    return ListTile(
      isThreeLine: true,
      tileColor: Colors.white,
      leading: Image.asset(notificationIcon, width: 36, height: 36),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              Icon(Icons.access_time,
                  color: Colors.black.withOpacity(0.3), size: 18),
              const SizedBox(width: 4),
              Text(
                timeago.format(timestamp.toDate(), allowFromNow: true),
                style: TextStyle(
                    fontSize: 15, color: Colors.black.withOpacity(0.3)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
      subtitle: Text(
        description,
        maxLines: 2,
        softWrap: true,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black38,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
