import 'package:e_commerce/core/DI/di.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/presentation/signup_user/SignUp_ViewModel/sign_up_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/constant.dart';
 import '../../core/resuable_component/custom_form_field.dart';
import '../../core/resuable_component/text_buttom.dart';
import '../../core/shared_prefs/local/prefs_helper.dart';
import '../../core/utils/routes_manager.dart';
import '../../core/utils/strings_manager.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  late TextEditingController fullnameController;
  late TextEditingController mobileController;
  late TextEditingController emailContrller;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailContrller=TextEditingController();
    fullnameController=TextEditingController();
    mobileController=TextEditingController();
    passwordController=TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailContrller.dispose();
    passwordController.dispose();
    fullnameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignUpViewModel>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding:   REdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 91.h,),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset(assetManagerr.logo,width:200.w,height: 120.h, fit:BoxFit.cover ,)),
                  SizedBox(height: 40.h,),
                  CutomFormField(
                    maxLength: 50,title: StringsManger.enterYourFullName,controller: fullnameController,hintText: StringsManger.enterYourFullName,keyboard:TextInputType.text ,
                    validator: (value){
                      if(value!.isEmpty){
                        return StringsManger. validFullname;
                      }
                    },),
                  SizedBox(height: 10.h,),
                  CutomFormField(
                    maxLength: 11,title: StringsManger.mobileNo,controller: mobileController,hintText: StringsManger.hintMobile,keyboard:TextInputType.number ,
                    validator: (value){
                      if((value!.length)<11){
                        return StringsManger.notValidPhone;                    }
                    },),

                  CutomFormField( maxLength: 50,title: StringsManger.email,controller: emailContrller,hintText: StringsManger.enterYourEmail,keyboard:TextInputType.emailAddress ,
                    validator: (value){
                      if(!Constant.regexEmail.hasMatch(value??"")){
                        return StringsManger.notValidEmail;
                      }
                    },),
                  SizedBox(height: 10.h,),
                  CutomFormField( maxLength: 11,title: StringsManger.password,controller: passwordController ,hintText: StringsManger.enteryourpassword,keyboard:TextInputType.visiblePassword ,
                    validator: (value){
                      if((value?.length??0) < 8){
                        return StringsManger.Notvalidpass;
                      }
                    },),

                  SizedBox(height:30.h),
                  SizedBox(
                    width: double.infinity,
                    child: BlocConsumer<SignUpViewModel,SignUpState>(
                      listener:  (context, state) {
                        if(state is SignUpErrorState){
                          Fluttertoast.showToast(
                              msg: state.errorMsg,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                        if(state is SignUpSuccessState){
                          PrefsHelper.setToken(state.token??"");
                          Fluttertoast.showToast(
                              msg: "Register is Success",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                          Navigator.pushNamedAndRemoveUntil(context, RoutesManager.HomeRoutes, (route) => false);
                        }
                      },

                      builder:  (context, state) {
                        if(state is SignUpLoadingState){
                          return Center(child: CircularProgressIndicator(color: Colors.white,));
                        }
                        return TextButtom(
                          title:StringsManger.SignUp ,onPressed:(){
                          if(formKey.currentState?.validate()??false){
                              SignUpViewModel.get(context).SignUp(
                              email: emailContrller.text,
                              password: passwordController.text,
                              name: fullnameController.text,
                              mobile: mobileController.text
                              );
                        } });
                      },)
                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
