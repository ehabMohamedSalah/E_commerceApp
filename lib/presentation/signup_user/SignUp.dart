import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant.dart';
import '../../core/resuable_component/custom_form_field.dart';
import '../../core/resuable_component/text_buttom.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
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
                    if((value?.length??0) < 11){
                      return StringsManger.Notvalidpass;
                    }
                  },),

                SizedBox(height:30.h),
                SizedBox(
                  width: double.infinity,
                  child: TextButtom(title:StringsManger.SignUp ,onPressed:(){
                    formKey.currentState?.validate();
                  } ,),
                ),
                SizedBox(height:20.h),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
