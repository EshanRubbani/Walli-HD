import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:myapp/helpers/colors.dart';
import 'package:myapp/helpers/textStyle.dart';
import 'package:myapp/views/SearchScreen/searchScreen.dart';

class SearchBarCustom extends StatelessWidget {
   SearchBarCustom({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          minHeight: 40, maxHeight: 50, maxWidth: 350, minWidth: 320),
      padding: const EdgeInsets.only(left: 15, right: 8, top: 8, bottom: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.deepPurple, width: 2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: searchController,
        style: AppTextStyles.searchbar(context),
        cursorColor: AppColors.deepPurple,
        onSubmitted: (value) {
          Get.to(SearchScreen(query: value,));
        },
        decoration: InputDecoration(
          hintText: "Search Wallpaper",
          hintStyle: AppTextStyles.searchbar(context),
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          suffixIcon:  IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.deepPurple,
            ),
            onPressed: () {
              Get.to(SearchScreen(query: searchController.text,));
            },
          ),
        ),
      ),
    );
  }
}
