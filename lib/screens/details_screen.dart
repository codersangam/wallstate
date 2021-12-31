import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Hero(
                tag: data,
                child: Image.network(data),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppBar(
                    elevation: 0.0,
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Vx.black,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
