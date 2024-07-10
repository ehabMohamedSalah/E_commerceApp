 import 'package:e_commerce/core/DI/di.dart';
import 'package:e_commerce/core/utils/strings_manager.dart';
import 'package:e_commerce/presentation/home/tabs/profile_tab/view_model/profile_view_model_cubit.dart';
import 'package:e_commerce/presentation/home/tabs/profile_tab/widget/custom_filed_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../core/shared_prefs/local/prefs_helper.dart';

class ProfileTab extends StatefulWidget {
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {

  late TextEditingController AddressContrller;


  void initState() {
    // TODO: implement initState
    super.initState();

    AddressContrller=TextEditingController(text: "Maadi cairo");

  }

  @override
  Widget build(BuildContext context) {
    var userId =  getDataFromToken();
    return  BlocProvider(
      create: (context) => getIt<ProfileViewModel>()..getuserData( userId: userId),
      child: Padding(
        padding:   REdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: BlocBuilder<ProfileViewModel,ProfileViewModelState>(

            builder: (context, state) {
              if(state is ProfileViewModelSuccess){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h,),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(state.userDataEntity.name??"",style:  Theme.of(context).textTheme.labelLarge,)),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(state.userDataEntity.email??"",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w300),)),
                    SizedBox(height: 40.h,),
                    CustomFieldProfile(controller: TextEditingController(text: state.userDataEntity.name),text: StringsManger.yourFullName,),

                    SizedBox(height: 20.h,),
                    CustomFieldProfile(controller:TextEditingController(text: state.userDataEntity.email),text: StringsManger.yourEmail,),

                    SizedBox(height: 20.h,),
                    CustomFieldProfile(controller: TextEditingController(text: "esraa1111"),text: StringsManger.yourPass,obscureText: true,),

                    SizedBox(height: 20.h,),
                    CustomFieldProfile(controller:TextEditingController(text: state.userDataEntity.phone),text: StringsManger.yourMobile,),

                    SizedBox(height: 20.h,),
                    CustomFieldProfile(controller: AddressContrller,text: StringsManger.yourAddress,),

                    SizedBox(height: 20.h,),


                  ],
                );
              }
              if(state is ProfileViewModelError){
                return Center(child: Text("${state.message}"),);
              }
              return CircularProgressIndicator();
            },

          ),
        ),
      ),
    );
  }
  getDataFromToken(){
    Map<String, dynamic> decodedToken = JwtDecoder.decode(PrefsHelper.getToken());
    return decodedToken["id"] ;
  }
}
