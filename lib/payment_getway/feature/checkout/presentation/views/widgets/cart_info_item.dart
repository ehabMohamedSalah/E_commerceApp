
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class OrderInfoItem extends StatelessWidget {
  final String title,value; //key , value
  const OrderInfoItem({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Styles.style18,),
        Spacer(),
        Text(value , style: Styles.style18,),

      ],
    );
  }
}

