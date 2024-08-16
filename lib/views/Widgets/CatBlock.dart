import 'package:flutter/material.dart';
import 'package:myapp/helpers/textStyle.dart';

class CatBlock extends StatelessWidget {
  const CatBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            margin:
                const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                "https://images.pexels.com/photos/1261728/pexels-photo-1261728.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Container(
            margin:
                const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
            decoration: BoxDecoration(
                color: Colors.grey.shade400.withOpacity(0.7),
                borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: Text(
                "Animal",
                style: AppTextStyles.subtitle2(context)?.copyWith(
                  color: Colors.white, // Ensure the text is white for contrast
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
