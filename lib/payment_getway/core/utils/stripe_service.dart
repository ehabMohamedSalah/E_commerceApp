import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../feature/checkout/data/models/Payment_intet_model.dart';
import '../../feature/checkout/data/models/ephemeral_key_model/EphemeralKeyModel.dart';
import '../../feature/checkout/data/models/ephemeral_key_model/init_Payment_Sheet_Input_Model.dart';
import '../../feature/checkout/data/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'api_key.dart';
import 'api_service.dart';




class StripeService {
  final ApiService apiService=ApiService();

  //PaymentIntentObject create payment intent(amount,currency)
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }




// init payment sheet(paymentIntentClientSecret)
Future initPaymentSheet({required InitPaymentSheetInputModel initPaymentSheetInputModel})async{
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
      merchantDisplayName: "Ehab",
          customerEphemeralKeySecret:initPaymentSheetInputModel.ephemeralKey,
          customerId:initPaymentSheetInputModel.customerId,
        ));
}


//present paymentsheet()
Future displayPaymentSheet()async{
   await  Stripe.instance.presentPaymentSheet();
}
//3ayz a3ml payment wahda t3de 3ala al 3 steps dol
Future makePayment(
    {required PaymentIntentInputModel paymentIntentInputModel})async{
    var paymentIntentModel=await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel=await createEphemeralKey( customerId:paymentIntentInputModel.customerId );

    var initPaymentSheetInputModel=InitPaymentSheetInputModel(clientSecret: paymentIntentModel.clientSecret!,customerId:paymentIntentInputModel.customerId,ephemeralKey:ephemeralKeyModel.secret!);
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel );
    await displayPaymentSheet();
}



//da al req ale by3ml al EphemeralKeyModel le m7tago fe initPaymentSheet
  Future<EphemeralKeyModel> createEphemeralKey({ required
   String customerId}) async {
    var response = await apiService.post(
      body:  {
        'customer':customerId,
      },

      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretKey ,
      headers: {
        'Authorization': "Bearer ${ApiKeys.secretKey}",
        'Stripe-Version':'2024-06-20',
      }
    );

    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKeyModel ;
  }



}



