import 'package:flutter/material.dart';
import 'package:photowall/controller/api_operation.dart';
import 'package:photowall/models/api_model.dart';
import 'package:photowall/view/widgets/searchbox.dart';
import 'package:photowall/view/widgets/wallpaper_box.dart';


import 'full_screen_view.dart';

class SearchScreen extends StatefulWidget {
  String query;
  SearchScreen({super.key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ApiOperation apiOperation = ApiOperation();
  List<WallPaperModel> searchResult = [];
  TextEditingController _searchController = TextEditingController();

  getSearchedWallpaperResult() async {
    searchResult = await apiOperation.getSearchWallpaper(widget.query);
    setState(() {});
  }

  @override
  void initState() {
    getSearchedWallpaperResult();
    print(searchResult.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SearchBox(searchController: _searchController,),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 13,
                  mainAxisExtent: 300,
                  mainAxisSpacing: 13,
                ),
                itemCount: searchResult.length,
                itemBuilder: (context, index) {
                  return Hero(
                    tag: searchResult[index].imgScr,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullScreenView(
                                imgSrc: searchResult[index].imgScr,
                              ),
                            ),
                          );
                        },
                        child: WallPaperWidget(imgScr: searchResult[index].imgScr,)),
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