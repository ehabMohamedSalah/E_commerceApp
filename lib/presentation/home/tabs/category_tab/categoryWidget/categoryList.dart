import 'package:e_commerce/core/utils/colors_manager.dart';
import 'package:e_commerce/presentation/home/tabs/category_tab/categoryViewModel/categoryViewModel.dart';
import 'package:e_commerce/presentation/home/tabs/category_tab/categoryWidget/subCategoryWidget.dart';
import 'package:e_commerce/presentation/home/tabs/hometab/widget/category_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CategoryWidgetList.dart';

class CategoryList extends StatefulWidget {

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selected=1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //3shan b3d m build awl frame ynade 3ala GetCateories
    //b3d m tbuild awl frame le al widget nade 3ala al categories
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CategoryViewModel>().getCategories();
    });
  }
  Widget build(BuildContext context) {
    return   BlocConsumer<CategoryViewModel,CategoryStates>(
      listener: (context, state) {
        if(state is SuccessCategoryState){
          context.read<CategoryViewModel>().getSubCategories(state.categories[selected].id??"");
        }
      },
      buildWhen: (previous, current) {
        if(current is SuccessCategoryState||current is LoadingCategoryState||current is ErrorCategoryState){
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if(state is SuccessCategoryState){
          return  Column(
            children: [
              SizedBox(height: 10.h,),
              Row(children: [
                Container(

                    width: 160.w,
                    height: 600.h,
                    decoration: BoxDecoration(color:ColorManager.categoriesBackgroundColor,
                        border: Border.all(color: ColorManager.primaryColor,width: 2,),borderRadius: BorderRadius.circular(10)),
                    child: ListView.separated(
                        itemBuilder:  (context, index) => CategoryWidgetList(
                          selectCategory: (){
                            selected=index;
                            setState(() {

                            });
                            CategoryViewModel.get(context).getSubCategories(state.categories[selected].id??"");
                          },
                          state.categories[index],
                          isSelected: index==selected,),
                        separatorBuilder: (context, index) => SizedBox(height: 3.h,),
                        itemCount: state.categories.length)),
                SizedBox(width: 10.w,),
                BlocBuilder<CategoryViewModel,CategoryStates>(
                  buildWhen: (previous, current) {
                    if(current is SubcategoriesErrorState || current is SubcategoriesSuccessState || current is SubcategoriesLoadingState){
                      return true;
                    }
                    return false;
                  },
                  builder:  (context, state) {
                    if(state is SubcategoriesSuccessState){

                      return SizedBox(
                        width: 200.w,
                        height: 600.h,
                        child: GridView.builder(
                          itemCount: state.subcategoryEntity.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1/2,
                              crossAxisSpacing: 10.w,
                              mainAxisSpacing: 10.h
                          ),
                          itemBuilder: (context, index) => SubCategoryWidget( state.subcategoryEntity[index]),
                        ),
                      );
                    }
                    if(state is SubcategoriesErrorState){
                      return Center(child: Text(state.ErrorMessage),);
                    }
                    return Center(child: CircularProgressIndicator());
                  },)

              ],),
            ],
          );
        }
        if(state is ErrorCategoryState){
       return Center(child: Text("${state.errorMessage}"),);
        }
        return Center(child: CircularProgressIndicator());

      },
    );
  }
}
