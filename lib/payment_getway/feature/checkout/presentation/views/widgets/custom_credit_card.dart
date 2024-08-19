import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'custom_bottom.dart';

class CustomCreditCard extends StatefulWidget {
  CustomCreditCard({super.key,required this.formKey,required this.autovalidateMode});

  final GlobalKey<FormState>formKey;
  final AutovalidateMode autovalidateMode;
  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber="",expiryDate="",cardHolderName="",cvvCode="",showBackView="";

  bool showBackVieww=false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
            isHolderNameVisible: true,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: showBackVieww,
            onCreditCardWidgetChange: (value){} ),
        CreditCardForm(
          autovalidateMode: widget.autovalidateMode,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            //model feh kol al data ale m7tagha
            onCreditCardModelChange:  (creditCardModel){
              cardHolderName=creditCardModel.cardHolderName;
              expiryDate=creditCardModel.expiryDate;
              cvvCode=creditCardModel.cvvCode;
              cardNumber=creditCardModel.cardNumber;
              showBackVieww=creditCardModel.isCvvFocused;//awl mtkon true btlf
              setState(() {

              });
            },
            formKey: widget.formKey),

      ],
    );
  }
}
