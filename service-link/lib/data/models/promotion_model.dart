import 'package:intl/intl.dart';

enum PromotionStatus { active, expired, used }

class PromotionModel {
  final String promotionId;
  final String title;
  final String description;
  final String promotionCode;
  final DateTime startDate;
  final DateTime endDate;
  final PromotionStatus status;

  PromotionModel({
    required this.promotionId,
    required this.title,
    required this.description,
    required this.promotionCode,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  String get period {
    final DateFormat formatter = DateFormat('MMM dd, yyyy');
    return '${formatter.format(startDate)} - ${formatter.format(endDate)}';
  }

  bool isExpired() => DateTime.now().isAfter(endDate);

  bool isActive() => DateTime.now().isBefore(endDate) && status == PromotionStatus.active;

  Map<String, dynamic> toJson() {
    return {
      'promotionId': promotionId,
      'title': title,
      'description': description,
      'promotionCode': promotionCode,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'status': status.toString().split('.').last,
    };
  }

  factory PromotionModel.fromJson(Map<String, dynamic> json) {
    return PromotionModel(
      promotionId: json['promotionId'],
      title: json['title'],
      description: json['description'],
      promotionCode: json['promotionCode'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      status: PromotionStatus.values.firstWhere(
            (e) => e.toString().split('.').last == json['status'],
        orElse: () => PromotionStatus.active,
      ),
    );
  }
}
