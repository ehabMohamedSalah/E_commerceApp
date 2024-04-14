import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:flutter/material.dart';

import 'core/DI/di.dart';
import 'core/myobserver.dart';
import 'myapp.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  // Use cubits...
  configureDependencies();
  ApiManager.init();
  runApp(const MyApp());
}


