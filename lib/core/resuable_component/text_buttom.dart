import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TextButtom extends StatelessWidget {
  String title;
  void Function()? onPressed;
  TextButtom({super.key,required this.title,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:ElevatedButton.styleFrom(backgroundColor: Colors.white) ,
        onPressed: onPressed,
        child: Text(title,style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize:18.sp ),));
  }
}
