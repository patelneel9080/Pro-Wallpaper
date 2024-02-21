import 'package:flutter/material.dart';
import 'package:photowall/models/api_model.dart';
import 'package:photowall/view/screens/full_screen_view.dart';
import 'package:photowall/view/widgets/wallpaper_box.dart';

class Explorepage extends StatefulWidget {
  const Explorepage({super.key});

  @override
  State<Explorepage> createState() => _ExplorepageState();
}

class _ExplorepageState extends State<Explorepage> {
  List<WallPaperModel> wallPaper = [];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
              child: GridView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisExtent: 300,
                  mainAxisSpacing: 12,
                ),
                itemCount: wallPaper.length,
                itemBuilder: (context, index) {
                  return Hero(
                    tag: wallPaper[index].imgScr,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreenView(
                              imgSrc: wallPaper[index].imgScr,
                            ),
                          ),
                        );
                      },
                      child: WallPaperWidget(
                        imgScr: wallPaper[index].imgScr,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
