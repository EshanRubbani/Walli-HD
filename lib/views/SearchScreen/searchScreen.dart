import "package:flutter/material.dart";
import "package:myapp/Controllers/ApiOperations.dart";
import "package:myapp/Models/PhotosModel.dart";
import "package:myapp/helpers/colors.dart";
import "package:myapp/helpers/textStyle.dart";
import "package:myapp/views/Widgets/CustomAppBar.dart";
import "package:myapp/views/Widgets/Wall.dart";

class SearchScreen extends StatefulWidget {
  final String query;
  SearchScreen({Key? key, required this.query}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<PhotoModel> searchlist;
  final ScrollController _scrollController = ScrollController();
  getSearchWalls() async {
    searchlist = await ApiOperations.getSearchWallpapers(widget.query);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // Listen for keyboard visibility changes
    FocusManager.instance.addListener(_onFocusChange);
    getSearchWalls();
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
              buildCover(widget.query),
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
          itemCount: searchlist.length,
          itemBuilder: (context, index) => Wall(src: searchlist[index].imgSrc),
        ));
  }

  AppBar HomeAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColors.lightBackgroundColor,
      title: const CustomAppBar(),
    );
  }

  Container buildCover(String query) {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(16),
        color: AppColors.lightAccentColor,
        child: Stack(
          children: [
            Image.network(
              searchlist[1].imgSrc,
              fit: BoxFit.cover,
              height: 100,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                query,
                style: AppTextStyles.searchbar1(context),
              ),
              height: 100,
              width: MediaQuery.of(context).size.width,
            )
          ],
        ));
  }
}
