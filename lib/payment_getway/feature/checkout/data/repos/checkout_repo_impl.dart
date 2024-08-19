import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/stripe_service.dart';
import '../models/payment_intent_input_model/payment_intent_input_model.dart';
import 'checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo{
  final StripeService stripeService=StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async{
try{
  await stripeService.makePayment(paymentIntentInputModel: paymentIntentInputModel);
  return right(null);
}catch(error){
return left(ServerFailure(error.toString()));
}

  }

}