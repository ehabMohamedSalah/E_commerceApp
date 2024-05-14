import 'package:e_commerce/Domain/entity/Categories_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef Categoryselected= void Function();
class CategoryWidgetList extends StatelessWidget {
  Categoryselected selectCategory;
 CategoryEntity categoryEntity;
 bool isSelected;
 CategoryWidgetList(this.categoryEntity,{this.isSelected = false,required this.selectCategory});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        selectCategory();
      },
      child: Container(
        width: 137.w,
        height: 55.h,
        child: Row(
          children: [
            Visibility(
              visible: isSelected,
              child: Container(
                width: 7,
                color: Theme.of(context).primaryColor,
                height: 50.h,
              ),
            ),
            SizedBox(width: 5.h,),
            Text(categoryEntity.name??"",style: Theme.of(context).textTheme.headlineLarge?.copyWith(overflow:TextOverflow.ellipsis ,),),
          ],
        ),
      ),
    );
  }
}
