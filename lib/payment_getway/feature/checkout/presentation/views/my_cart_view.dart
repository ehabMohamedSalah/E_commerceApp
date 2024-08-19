import 'package:e_commerce/core/utils/routes_manager.dart';
import 'package:e_commerce/payment_getway/feature/checkout/presentation/views/widgets/my_cart_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
          Navigator.pushNamed(context, RoutesManager.cartScreen);
        },color: Colors.black,),
        title: Text(
          "My Cart",
          textAlign: TextAlign.center,
          style: Styles.style25,
        ) ,
        centerTitle: true,
      ),
      body: MyCartViewBody(),
    );
  }
}
