import 'package:e_commerce/payment_getway/feature/checkout/presentation/views/widgets/thank_you_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../provider.dart';
import 'CustomCheckItem.dart';
import 'CustomDashLine.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider provider=Provider.of<SettingProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Stack(
        clipBehavior: Clip.none,
        children:[
          ThankYouCard(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height*.2-5,
             left: 20+16,
            right:  20+8,
            child: CustomDashLine(),
          ),
          Positioned(
            left: -20,
              bottom: MediaQuery.sizeOf(context).height*.2,
              child: CircleAvatar(
            backgroundColor: Colors.white,
          )),
          Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height*.2,
              child: CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
            left: 0,
            right: 0,
            top: -30,
            child: CustomCheckItem(),
          ),
        ]),
    );
  }
}
