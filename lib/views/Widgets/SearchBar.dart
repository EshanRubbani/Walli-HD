import 'package:flutter/material.dart';
import 'package:myapp/helpers/colors.dart';
import 'package:myapp/helpers/textStyle.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({Key? key}) : super(key: key);

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
        decoration: InputDecoration(
          hintText: "Search Wallpaper",
          hintStyle: AppTextStyles.searchbar(context),
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          suffixIcon: const Icon(
            Icons.search,
            color: AppColors.deepPurple,
          ),
        ),
      ),
    );
  }
}
