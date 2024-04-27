import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view_model/HomeTab.dart';
import 'category_widget.dart';
//3mlt al consumer fe widget lw7dha 3shan afslha 3n al consumer bta3t al brands l2n kol wahed leh al states bta3to
class CategoryConsumer extends StatefulWidget {
  const CategoryConsumer({super.key});

  @override
  State<CategoryConsumer> createState() => _CategoryConsumerState();
}

class _CategoryConsumerState extends State<CategoryConsumer> {
  @override
  //htet GetCateories gowa al init 3shan awl m build al widget ygeb al category
  void initState() {
    // TODO: implement initState
    super.initState();
    //3shan b3d m build awl frame ynade 3ala GetCateories
    //b3d m tbuild awl frame le al widget nade 3ala al categories
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeTabViewModel>().GetCateories();
    });
  }
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabViewModel, HomeTabState>(
      //hy3ml build fe state al success bs
      buildWhen: (previous, current) {
        if (current is HomeTabLoadingState || current is HomeTabErrorState) {
          return false; //mtro7sh t build
        }

        return true;
      },

      //b2olo listen fe al state de bsss
      listenWhen: (previous, currentState) {
        if (currentState is HomeTabLoadingState || currentState is HomeTabErrorState || currentState is HomeSuccessState) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is HomeTabLoadingState) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: SizedBox(
                    height: 60.h,
                    child: Center(child: CircularProgressIndicator())),
              );
            },
          );
        }
        if (state is HomeTabErrorState) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.errorMessage),
              );
            },
          );
        }
        if(state is HomeSuccessState){
          Navigator.pop(context);
        }
      },

      builder: (context, state) {
        if (state is HomeSuccessState) {
          return SizedBox(
            height: 330.h,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  CategoryWidget(state.categories[index]),
              itemCount: state.categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.h,
              ),
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
