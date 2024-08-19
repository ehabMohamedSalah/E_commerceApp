import 'package:e_commerce/payment_getway/feature/checkout/presentation/views/widgets/payment_method_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


import '../../../../../core/utils/styles.dart';
import '../../../data/repos/checkout_repo_impl.dart';
import '../../manager/payment_cubit.dart';
import '../../provider.dart';
import '../thank_you_view.dart';
import 'cart_info_item.dart';
import 'cart_total_price.dart';
import 'custom_bottom.dart';

class MyCartViewBody extends StatelessWidget {

    MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider provider= Provider.of<SettingProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 18,),
          Expanded(child: Image.asset("assets/images/cart.png")),
          SizedBox(height: 25,),
          OrderInfoItem(title: "Order Subtotal",value:"${provider.totalPrice}" ,),
          SizedBox(height: 3,),
          OrderInfoItem(title: "Discount",value:r'0$' ,),
          SizedBox(height: 3,),
          OrderInfoItem(title: "Shipping",value:r"0$" ,),
          Divider(),
          TotalPrice(title: 'Total',value: r'$''${provider.totalPrice}',),
          SizedBox(height: 16,),
          CustomButton(
            text: "Complete Payment",
            onTap: (){
             // Navigator.of(context).push(MaterialPageRoute(builder:  (context) =>PaymentDetails() ,));
              showModalBottomSheet(context: context,shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ) ,builder:  (context)
              {
                return BlocProvider(
                    create: (context) =>PaymentCubit(CheckoutRepoImpl()) ,
                    child: PaymentMethodBottomShet());
              },);
            },
          ),
          SizedBox(height: 12,),

        ],
      ),
    );
  }
}