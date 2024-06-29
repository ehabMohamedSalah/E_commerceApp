import 'package:e_commerce/core/DI/di.dart';
import 'package:e_commerce/core/constant.dart';
 import 'package:e_commerce/presentation/signin_user/sign_in_view_model_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/resuable_component/custom_form_field.dart';
import '../../core/resuable_component/text_buttom.dart';
import '../../core/shared_prefs/local/prefs_helper.dart';
import '../../core/utils/assets_manager.dart';
import '../../core/utils/routes_manager.dart';
import '../../core/utils/strings_manager.dart';
import '../signup_user/SignUp_ViewModel/sign_up_view_model_cubit.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController emailContrller;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailContrller = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return getIt<SignInViewModel>();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 91.h,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        assetManagerr.logo,
                        width: 200.w,
                        height: 120.h,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 87.h,
                  ),
                  Text(
                    StringsManger.welcome,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    StringsManger.pleaseSign,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 16.sp, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CutomFormField(
                    maxLength: 50,
                    title: StringsManger.email,
                    controller: emailContrller,
                    hintText: StringsManger.enterYourEmail,
                    keyboard: TextInputType.emailAddress,
                    validator: (value) {
                      if (!Constant.regexEmail.hasMatch(value ?? "")) {
                        return StringsManger.notValidEmail;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CutomFormField(
                    maxLength: 11,
                    title: StringsManger.password,
                    controller: passwordController,
                    hintText: StringsManger.enteryourpassword,
                    keyboard: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: (value) {
                      if ((value?.length ?? 0) < 7) {
                        return StringsManger.Notvalidpass;
                      }
                    },
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        StringsManger.forgetpassword,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w400),
                      )),
                  SizedBox(height: 30.h),
                  SizedBox(
                    width: double.infinity,
                    child: BlocConsumer<SignInViewModel, SignInViewModelState>(
                      listener: (context, state) {
                        if (state is SignInSuccess) {
                          PrefsHelper.setToken(state.AuthEntity.token??"");
                          Fluttertoast.showToast(
                              msg: "login is Success",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                          Navigator.pushNamedAndRemoveUntil(context,
                              RoutesManager.HomeRoutes, (route) => false);
                        }
                        if (state is SignInErorr) {
                          Fluttertoast.showToast(
                              msg: state.ErrorMessage,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }

                      },
                      builder: (context, state) {
                        if (state is SignInloading) {
                          return Center(
                            child: CircularProgressIndicator(color: Colors.white,),);
                        }

                        return TextButtom(
                            title: StringsManger.Login,
                            onPressed: () {
                              if (formKey.currentState?.validate() != false) {
                                SignInViewModel.get(context).SignIn(Email: emailContrller.text, password: passwordController.text);

                              }
                            });
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesManager.SignUproute);
                    },
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          StringsManger.dontHaveAcc,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontSize: 18.sp),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
