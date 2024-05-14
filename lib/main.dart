import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/presentation/home/homeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/DI/di.dart';
import 'core/myobserver.dart';
import 'myapp.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  // Use cubits...
  configureDependencies();
  ApiManager.init();
  runApp(  BlocProvider(
     create: (context) => HomeViewModel(),
      child: MyApp()));
}


