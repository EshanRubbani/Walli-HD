import "package:flutter/material.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_navigation/get_navigation.dart";
import "package:myapp/helpers/colors.dart";
import "package:myapp/views/SearchScreen/searchScreen.dart";
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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Listen for keyboard visibility changes
    FocusManager.instance.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(_onFocusChange);
    _scrollController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (FocusManager.instance.primaryFocus == null) {
      // Keyboard is dismissed
      _scrollToTop();
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(seconds: 5), // Animate for 2 seconds
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.lightBackgroundColor,
        child: SingleChildScrollView(
          controller: _scrollController, // Assign the controller
          child: Column(
            children: [
              SearchBarCustom(),
              buildCategories(context),
              buildWalls(context),
            ],
          ),
        ),
      ),
    );
  }

  Container buildWalls(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height - 225,
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
          itemCount: 25,
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
