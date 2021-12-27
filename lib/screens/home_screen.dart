import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wallstate/providers/wallpaper_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    WallPaperProvider wallPaperProvider =
        Provider.of<WallPaperProvider>(context);
    wallPaperProvider.getWallPapers();
    return Scaffold(
      appBar: AppBar(
        title: 'HomeScreen'.text.make(),
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: wallPaperProvider.wallPaperItems.length,
        itemBuilder: (context, index) {
          var data = wallPaperProvider.wallPaperItems[index];
          return Material(
            elevation: 8.0,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: InkWell(
              onTap: () {},
              child: FadeInImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  data.imageUrl.toString(),
                ),
                placeholder: const AssetImage('assets/images/Wlstate.jpg'),
              ),
            ),
          );
        },
        staggeredTileBuilder: (index) =>
            StaggeredTile.count(2, index.isEven ? 2 : 3),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ).p8(),
    );
  }
}
