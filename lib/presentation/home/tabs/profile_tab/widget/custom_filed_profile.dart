import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/strings_manager.dart';

class CustomFieldProfile extends StatelessWidget {
  String text;
  bool obscureText;
  TextEditingController? controller;
  CustomFieldProfile({required this.controller, required this.text, this.obscureText= false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(text,style: Theme.of(context).textTheme.labelLarge,)),
        SizedBox(height: 5.h,),
        TextFormField(
          obscureText: obscureText,
          controller:controller ,
          decoration: InputDecoration(
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.sp),borderSide: BorderSide(width: 1,color: Colors.black26,)),
            enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(20.sp),borderSide: BorderSide(width: 1,color: Colors.black26,)),
            focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(20.sp),borderSide: BorderSide(width: 1,color: Colors.black26,)),
            hintStyle: TextStyle(color: Theme.of(context).primaryColor),
            suffixIcon: IconButton(onPressed:  (){}, icon: Icon(Icons.edit,size:30.sp ,color: Theme.of(context).primaryColor,)),

          ),
        ),

      ],
    );
  }
}
