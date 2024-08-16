import 'package:flutter/material.dart';
import 'package:myapp/helpers/textStyle.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Wall-HD",
          style: AppTextStyles.headline(context),
        ),
      ),
    );
  }
}
