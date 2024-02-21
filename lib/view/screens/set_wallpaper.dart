import 'package:flutter/material.dart';

class SetWallpaper extends StatelessWidget {
  String imgSrc;

  SetWallpaper({Key? key, required this.imgSrc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imgSrc),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.black26,
              ),
              child: Text("Set Wallpaper"),
            ),
          )
        ],
      ),
    );
  }
}