import 'package:e_commerce/payment_getway/feature/checkout/presentation/views/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';
 import 'package:provider/provider.dart';

import '../../provider.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({super.key});

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  final List<String>paymemtMthodItemss=const [
    "assets/images/card.svg",
    "assets/images/paypal.svg",
  ];

  int activeIndex=0;

  @override
  Widget build(BuildContext context) {
    SettingProvider provider=Provider.of<SettingProvider>(context);

    return SizedBox(
      height: 62,
      child: ListView.builder(
        itemCount:paymemtMthodItemss.length ,
        itemBuilder:(context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: (){
                  //activeIndex=index;
                  provider.changeIndex(index);
                  setState(() {

                  });
                },
                child: PaymentMethodItem(isActive: provider.index==index,image:paymemtMthodItemss[index] ,)),
          );},
        scrollDirection: Axis.horizontal,


      ),
    );
  }
}
