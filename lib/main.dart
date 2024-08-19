import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/payment_getway/core/utils/api_key.dart';
import 'package:e_commerce/payment_getway/feature/checkout/presentation/provider.dart';
 import 'package:e_commerce/presentation/home/homeViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

import 'core/DI/di.dart';
import 'core/myobserver.dart';
import 'core/shared_prefs/local/prefs_helper.dart';
import 'myapp.dart';

void main() async{
  Stripe.publishableKey=ApiKeys.publishableKey;

  WidgetsFlutterBinding.ensureInitialized();//law fe ay haga future m3molha await lazm tkhls abl mdkhol 3ala al runapp
  Bloc.observer = MyBlocObserver();
  // Use cubits...
  configureDependencies();
 await  PrefsHelper.init();
  ApiManager.init();
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingProvider()),
      ],
      child: BlocProvider(
          create: (context) => HomeViewModel(),
          child: MyApp())));
}


