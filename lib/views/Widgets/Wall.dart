import 'package:flutter/material.dart';
import 'package:myapp/helpers/colors.dart';

class Wall extends StatelessWidget {
  const Wall({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size

    return Container(
      
      // height: screenSize.height * 0.2 + 4500, // 20% of screen width
      margin: EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
         
          fit: BoxFit.fitHeight,
          "https://images.pexels.com/photos/1261728/pexels-photo-1261728.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        ),
      ),
    );
  }
}
