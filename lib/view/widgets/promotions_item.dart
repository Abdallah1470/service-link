import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum PromotionStatus { active, expired }

class PromotionsItem extends StatelessWidget {
  final PromotionStatus status;
  final String title;
  final String description;
  final String period;
  final String promotionCode;

  const PromotionsItem(
      {super.key,
      required this.status,
      required this.title,
      required this.description,
      required this.period,
      required this.promotionCode});

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
                title,
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
                    color: status == PromotionStatus.active
                        ? Colors.green
                        : Colors.red,
                    width: 1.5,
                  ),
                  borderRadius:
                      BorderRadius.circular(800), // Optional: rounded corners
                ),
                child: Text(
                  status == PromotionStatus.active ? 'Active' : 'Expired',
                  style: TextStyle(
                    fontFamily: 'Roboto Flex',
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: status == PromotionStatus.active
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              description,
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
                onPressed: status == PromotionStatus.active
                  ? () {
                  Clipboard.setData(ClipboardData(text: promotionCode));

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Code copied to clipboard')),
                  );
                }: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: status == PromotionStatus.active
                      ? Colors.green
                      : Colors.red.withOpacity(0.2),
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
                period,
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
}
