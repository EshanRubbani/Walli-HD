import 'package:flutter/material.dart';
import 'package:myapp/helpers/colors.dart';

class Wall extends StatelessWidget {
  const Wall({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: AspectRatio(
          aspectRatio: 9 / 16, // Example aspect ratio for phones
          child: Image.network(
            fit: BoxFit.cover,
            "https://images.pexels.com/photos/1261728/pexels-photo-1261728.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          ),
        ),
      ),
    );
  }
}
