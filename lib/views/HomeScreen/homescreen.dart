import "package:flutter/material.dart";
import "package:myapp/helpers/colors.dart";
import "package:myapp/views/Widgets/CatBlock.dart";
import "package:myapp/views/Widgets/CustomAppBar.dart";
import "package:myapp/views/Widgets/SearchBar.dart";
import "package:myapp/views/Widgets/Wall.dart";

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColors.lightBackgroundColor,
          child: Column(
            children: [
              SearchBarCustom(),
              buildCategories(context),
              buildWalls(context),
            ],
          )),
    );
  }

  Container buildWalls(BuildContext context) {
    return Container(
        color: Colors.red,
        margin: EdgeInsets.all(16),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height - 200,
          maxWidth: MediaQuery.of(context).size.width,
          minHeight: 400,
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 9 / 16,
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: 10,
          itemBuilder: (context, index) => Container(
            child: Wall(),
          ),
        ));
  }

  Container buildCategories(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 16, right: 16),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemBuilder: (context, index) => CatBlock(),
        scrollDirection: Axis.horizontal,
        itemCount: 8,
      ),
    );
  }

  AppBar HomeAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColors.lightBackgroundColor,
      title: CustomAppBar(),
    );
  }
}
