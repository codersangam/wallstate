import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallstate/models/wallpaper_model.dart';

class WallPaperProvider with ChangeNotifier {
  // Get WishList Products
  List<WallPaperModel> wallPaperItems = [];

  void getWallPapers() async {
    List<WallPaperModel> newList = [];
    QuerySnapshot data =
        await FirebaseFirestore.instance.collection('wallpapers').get();

    for (var element in data.docs) {
      WallPaperModel wallPaperListModel = WallPaperModel(
        imageId: element.get('imageId'),
        imageUrl: element.get('imageUrl'),
      );
      newList.add(wallPaperListModel);
    }
    wallPaperItems = newList;
    notifyListeners();
  }

  List<WallPaperModel> get getWallPaper {
    return wallPaperItems;
  }
}
