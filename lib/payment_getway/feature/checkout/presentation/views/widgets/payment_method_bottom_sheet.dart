
import 'package:flutter/material.dart';

import '../thank_you_view.dart';
import 'PaymentMethodListView.dart';
import 'custom_bottom.dart';
import 'custom_button_blocConsumer.dart';

class PaymentMethodBottomShet extends StatelessWidget {
  const PaymentMethodBottomShet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16,),
          PaymentMethodListView(),
          SizedBox(height: 32,),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}

