import 'package:flutter/material.dart';
import 'package:photowall/controller/api_operation.dart';
import 'package:photowall/model/category_model.dart';
import 'package:photowall/models/api_model.dart';
import 'package:photowall/view/screens/full_screen_view.dart';
import 'package:photowall/view/widgets/category_box.dart';
import 'package:photowall/view/widgets/searchbox.dart';
import 'package:photowall/view/widgets/wallpaper_box.dart';

class HomePAge extends StatefulWidget {
  const HomePAge({super.key});

  @override
  State<HomePAge> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePAge> {
  List<WallPaperModel> wallPaper = [];
  List<CategoryModel> categoryModelList = [];
  ApiOperation apiOperation = ApiOperation();
  final TextEditingController _searchController = TextEditingController();

  getCategoryDetails() async {
    categoryModelList = await ApiOperation().getCategoriesList();
    setState(() {
      categoryModelList = categoryModelList;
    });
  }

  getWallPaper() async {
    wallPaper = await apiOperation.getWallpaper();
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  @override
  void initState() {
    getWallPaper();
    getCategoryDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          "Pro-Wallpaper",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: GridView.builder(
                  itemCount: categoryModelList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 13,),
              itemBuilder: (context, index) {
                return CategoriesBox(
                  categoryImgSrc: categoryModelList[index].catImgUrl,
                  categoryName: categoryModelList[index].catName,
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
