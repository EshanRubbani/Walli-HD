import "package:flutter/material.dart";
import "package:myapp/Controllers/ApiOperations.dart";
import "package:myapp/Models/PhotosModel.dart";
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
  late List<PhotoModel> trendingwallList;

  final ScrollController _scrollController = ScrollController();
  getTrendingWallpapers() async {
    trendingwallList = await ApiOperations.getTrendingWallpapers();
    setState(() {
      
    });
  }

  @override
  void initState() {
    super.initState();
    // Listen for keyboard visibility changes
    FocusManager.instance.addListener(_onFocusChange);
    getTrendingWallpapers();
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
      duration: const Duration(seconds: 5), // Animate for 2 seconds
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
        margin: const EdgeInsets.all(16),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height - 225,
          maxWidth: MediaQuery.of(context).size.width,
          minHeight: 400,
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 9 / 16,
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: trendingwallList.length,
          itemBuilder: (context, index) => Container(
            child: Wall(src: trendingwallList[index].imgSrc,),
          ),
        ));
  }

  Container buildCategories(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemBuilder: (context, index) => const CatBlock(),
        scrollDirection: Axis.horizontal,
        itemCount: 8,
      ),
    );
  }

  AppBar HomeAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColors.lightBackgroundColor,
      title: const CustomAppBar(),
    );
  }
}
