import 'package:flutter/material.dart';

class Wall extends StatelessWidget {
  final String src;
  const Wall({super.key, required this.src});

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
          src,
        ),
      ),
    );
  }
}
