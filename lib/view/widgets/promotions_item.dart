import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/models/promotion_model.dart';

// Assuming PromotionModel and PromotionStatus are defined elsewhere
class PromotionsItem extends StatelessWidget {
  final PromotionModel promotion;

  const PromotionsItem({
    super.key,
    required this.promotion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 18, top: 25),
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                promotion.title,
                style: const TextStyle(
                  fontFamily: 'Roboto Flex',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _getBorderColor(promotion.status),
                    width: 1.5,
                  ),
                  borderRadius:
                  BorderRadius.circular(800), // Optional: rounded corners
                ),
                child: Text(
                  _getStatusText(promotion.status),
                  style: TextStyle(
                    fontFamily: 'Roboto Flex',
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: _getTextColor(promotion.status),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              promotion.description,
              style: TextStyle(
                fontFamily: 'Roboto Flex',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton(
                onPressed: promotion.isActive()
                    ? () {
                  Clipboard.setData(ClipboardData(text: promotion.promotionCode));

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Code copied to clipboard')),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _getButtonColor(promotion.status),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'Copy code',
                  style: TextStyle(
                      fontFamily: 'Roboto Flex',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.95,
                      color: Colors.white),
                ),
              ),
              Text(
                promotion.period, // Using the computed period property from the model
                style: TextStyle(
                  fontFamily: 'Roboto Flex',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getStatusText(PromotionStatus status) {
    switch (status) {
      case PromotionStatus.active:
        return 'Active';
      case PromotionStatus.expired:
        return 'Expired';
      case PromotionStatus.used:
        return 'Used';
      default:
        return '';
    }
  }

  Color _getBorderColor(PromotionStatus status) {
    switch (status) {
      case PromotionStatus.active:
        return Colors.green;
      case PromotionStatus.expired:
        return Colors.red;
      case PromotionStatus.used:
        return Colors.blueGrey;
      default:
        return Colors.grey;
    }
  }

  Color _getTextColor(PromotionStatus status) {
    switch (status) {
      case PromotionStatus.active:
        return Colors.green;
      case PromotionStatus.expired:
        return Colors.red;
      case PromotionStatus.used:
        return Colors.blueGrey;
      default:
        return Colors.black;
    }
  }

  Color _getButtonColor(PromotionStatus status) {
    return status == PromotionStatus.active
        ? Colors.green
        : Colors.red.withOpacity(0.2);
  }
}
