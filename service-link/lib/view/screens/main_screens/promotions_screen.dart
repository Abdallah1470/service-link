import 'package:flutter/material.dart';
import 'package:service_link/data/models/promotion_model.dart';
import 'package:service_link/view/widgets/no_promotions_widget.dart';
import 'package:service_link/view/widgets/promotions_item.dart';

class PromotionsScreen extends StatelessWidget {
  const PromotionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promotions'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          PromotionsItem(
              promotion: PromotionModel(
                  promotionId: '1',
                  title: 'EID ADHA 2024',
                  description: 'Get 2% discount on all orders on this Eid Al ADHA (Max discount= USD 100)',
                  promotionCode: 'EID2024',
                  startDate: DateTime(2024, 10, 1),
                  endDate: DateTime(2024, 10, 27),
                  status: PromotionStatus.active)),
          PromotionsItem(
              promotion: PromotionModel(
                  promotionId: '2',
                  title: 'EID ADHA 2024',
                  description: 'Get 2% discount on all orders on this Eid Al ADHA (Max discount= USD 100)',
                  promotionCode: 'EID2024',
                  startDate: DateTime(2024, 10, 1),
                  endDate: DateTime(2024, 10, 27),
                  status: PromotionStatus.active)),
          PromotionsItem(
              promotion: PromotionModel(
                  promotionId: '3',
                  title: 'EID ADHA 2024',
                  description: 'Get 2% discount on all orders on this Eid Al ADHA (Max discount= USD 100)',
                  promotionCode: 'EID2024',
                  startDate: DateTime(2024, 10, 1),
                  endDate: DateTime(2024, 10, 27),
                  status: PromotionStatus.used)),
          PromotionsItem(
              promotion: PromotionModel(
                  promotionId: '4',
                  title: 'EID ADHA 2024',
                  description: 'Get 2% discount on all orders on this Eid Al ADHA (Max discount= USD 100)',
                  promotionCode: 'EID2024',
                  startDate: DateTime(2023, 10, 1),
                  endDate: DateTime(2023, 10, 27),
                  status: PromotionStatus.expired)),

        ],
      ),

      /*const NoPromotionsWidget(),*/
    );
  }
}
