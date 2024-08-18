import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/Models/PhotosModel.dart';

class ApiOperations {
  static List<PhotoModel> trendingWallpapers = [];
  static List<PhotoModel> searchWallpapers = [];

  // Trending Wallpapers
  static Future<List<PhotoModel>> getTrendingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"), headers: {
      "Authorization":
          "bI5a6nv1SI53wCS36kfpuqTMTLxzHB9eDJA6UMwpbeuXHTC8Yy0UzAvP"
    }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
       searchWallpapers.clear();
      photos.forEach((element) {
        trendingWallpapers.add(PhotoModel.fromAPI2APP(element));
      });
    });
    return trendingWallpapers;
  }

  //Search Wallpapers
  static Future<List<PhotoModel>> getSearchWallpapers(String query) async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=30&page=1&orientation=portrait"),
        headers: {
          "Authorization":
              "bI5a6nv1SI53wCS36kfpuqTMTLxzHB9eDJA6UMwpbeuXHTC8Yy0UzAvP"
        }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      searchWallpapers.clear();
      photos.forEach((element) {
        searchWallpapers.add(PhotoModel.fromAPI2APP(element));
      });
    });
    return searchWallpapers;
  }
}
