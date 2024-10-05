import 'package:flutter/material.dart';
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
            status: PromotionStatus.active,
            title: 'EID ADHA 2024',
            description: 'Get 2% discount on all orders on this Eid Al ADHA (Max discount= USD 100)',
            period: '1 Oct - 27 Oct',
            promotionCode: 'EID2024',
          ),
          PromotionsItem(
            status: PromotionStatus.expired,
            title: 'EID ADHA 2023',
            description: 'Get 2% discount on all orders on this Eid Al ADHA (Max discount= USD 100)',
            period: '1 Oct - 27 Oct',
            promotionCode: 'EID2023',
          ),
          PromotionsItem(
            status: PromotionStatus.active,
            title: 'EID ADHA 2022',
            description: 'Get 2% discount on all orders on this Eid Al ADHA (Max discount= USD 100)',
            period: '1 Oct - 27 Oct',
            promotionCode: 'EID2022',
          ),
          PromotionsItem(
            status: PromotionStatus.expired,
            title: 'EID ADHA 2021',
            description: 'Get 2% discount on all orders on this Eid Al ADHA (Max discount= USD 100)',
            period: '1 Oct - 27 Oct',
            promotionCode: 'EID2021',
          ),
          PromotionsItem(
            status: PromotionStatus.active,
            title: 'EID ADHA 2020',
            description: 'Get 2% discount on all orders on this Eid Al ADHA (Max discount= USD 100)',
            period: '1 Oct - 27 Oct',
            promotionCode: 'EID2020',
          ),
        ],
      ),

      /*const NoPromotionsWidget(),*/
    );
  }
}
