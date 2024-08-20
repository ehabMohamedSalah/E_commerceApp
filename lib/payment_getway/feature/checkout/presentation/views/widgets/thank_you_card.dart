import 'package:e_commerce/payment_getway/feature/checkout/presentation/views/widgets/payment_item_info.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/styles.dart';
import '../../provider.dart';
import 'card_info_widget.dart';
import 'cart_total_price.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SettingProvider provider=Provider.of<SettingProvider>(context);

    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
          color: Colors.grey.withOpacity(0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.only(top: 50+16,left: 22,right: 22),
        child: Column(
          children: [
            Text(
              "Thank You!",
            textAlign: TextAlign.center,
              style:Styles.style25 ,
            ),
            Text(
              "Your transaction was successful",
              textAlign: TextAlign.center,
              style:Styles.style20 .copyWith(fontWeight: FontWeight.w300,color: Colors.black,fontSize: 16),
            ),
            SizedBox(height: 42,),
            PaymentItemInfo(title:"Date" ,value:"01/24/2023" ,),
            SizedBox(height: 20,),
            PaymentItemInfo(title:"Time" ,value:"10:15 AM" ,),
            SizedBox(height: 20,),
            PaymentItemInfo(title:"To" ,value:"Ehab salah" ,),
            Divider(thickness: 2,height: 60,),
            TotalPrice(title: "Total", value: r"$""${provider.totalPrice}"),
            SizedBox(height: 30,),
            CardInfoWidget(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(FontAwesomeIcons.barcode,size: 64,),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.50,
                          color: Colors.greenAccent,
                          
                        ),borderRadius: BorderRadius.circular(15),
                      )),
                  child: Center(child: Text("PAID",style: Styles.style24.copyWith(color: Color(0XFF34A853)),)),

                ),
              ],
            ),
            SizedBox(
                height: ((MediaQuery.sizeOf(context).height *.2 + 20)  / 2) -29 ,)

          ],
        ),
      ),
    );
  }
}

