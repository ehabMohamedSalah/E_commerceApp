import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
 import 'package:flutter_svg/svg.dart';


import '../thank_you_view.dart';
import 'PaymentMethodListView.dart';
import 'custom_bottom.dart';
import 'custom_credit_card.dart';

class PaymentDetailViewBody extends StatefulWidget {
  const PaymentDetailViewBody({super.key});

  @override
  State<PaymentDetailViewBody> createState() => _PaymentDetailViewBodyState();
}

class _PaymentDetailViewBodyState extends State<PaymentDetailViewBody> {
  final GlobalKey<FormState>formKey=GlobalKey();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers:
          [
          SliverToBoxAdapter(child: PaymentMethodListView()),
            SliverToBoxAdapter(child: CustomCreditCard(formKey: formKey,autovalidateMode: autovalidateMode,)),
            SliverFillRemaining(
              hasScrollBody: false,
              child:
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.all(16),
                    child: CustomButton(
                      onTap: (){
                        if(formKey.currentState!.validate()){
                          formKey.currentState!.save();
                          log("payment");
                         
                        }else{
                          Navigator.of(context).push( MaterialPageRoute(builder:  (context) =>  ThankYouView(),));
                            autovalidateMode=AutovalidateMode.always;
                            setState(() {

                            });
                        }

                      },
                      text: "Payment",
                    ))),
              ),

        ],

    );
  }
}

