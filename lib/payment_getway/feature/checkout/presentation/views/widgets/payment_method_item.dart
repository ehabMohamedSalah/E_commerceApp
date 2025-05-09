import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatefulWidget {
    PaymentMethodItem({super.key,this.isActive=false,required this.image});

    String image;
  final bool isActive;

  @override
  State<PaymentMethodItem> createState() => _PaymentMethodItemState();
}

class _PaymentMethodItemState extends State<PaymentMethodItem> {
  @override
  Widget build(BuildContext context) {
    return   AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.50,color:widget.isActive? Color(0xFF34A853):Colors.grey),
              borderRadius: BorderRadius.circular(15)
          ),
          shadows: [
            BoxShadow(
              color:  widget.isActive? Color(0xFF34A853):Colors.white,
              blurRadius: 4,
              offset: Offset(0,0),
              spreadRadius: 0,
            ),
          ]
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),color: Colors.white,

        ),
        child: Center(child: SvgPicture.asset(widget.image,height: 34,)),),
    );
  }
}
