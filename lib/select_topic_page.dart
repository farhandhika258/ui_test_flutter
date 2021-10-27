import 'package:flutter/material.dart';
import 'package:flutter_app_ui_test/models/category.dart';
import 'package:flutter_app_ui_test/size_config.dart';

class SelectTopicPage extends StatefulWidget {
  @override
  _SelectTopicPageState createState() => _SelectTopicPageState();
}

class _SelectTopicPageState extends State<SelectTopicPage> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<Category> _placeholderCategory = [];

  List<Category> _queryCategory = [];
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _generateCategory();

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: _appBarWidget(context),
        backgroundColor: Colors.black,
        body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Stack(
            children: [
              Column(
                children: <Widget>[

                  _buildSearchViewWidget(),

                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 20),
                      child: _initListBuilder(),
                    ),
                  ),
                ],
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: _buildBottomWidget(),
              )
            ],
          ),
        )
      ),
    );
  }

  Widget _appBarWidget(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      title: Text( 'Follow Topic' ,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Merriweather',
            fontSize: 25.0
        ),
      ),
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
    );
  }

  Widget _buildSearchViewWidget() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 0),
      padding: EdgeInsets.only(left: 5),
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20.0)
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.left,
              initialValue: _searchQuery,
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10, bottom: 15, top: 15),
                hintText: 'Search topics...',
                prefixIcon: Icon(Icons.search),
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              onChanged: (text) {
                setState(() {
                  _searchQuery = text;
                  _queryCategory.clear();
                  _populateQuery();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomWidget() {
    return Container(
      height: 120,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [
              0.7,
              1
            ],
            colors: [
              Colors.black,
              Colors.transparent,
            ],
          )
      ),
      child: Center(
        child: Text(
          'Select at least 3 categories to continue',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
    );
  }

  Widget _initListBuilder() {
    if (_queryCategory.isNotEmpty) {
      return  GridView.count(
        childAspectRatio: 2.1,
        crossAxisCount: 2,
        shrinkWrap: true,
        children: _queryCategory.map((category) {
          return _buildCategoryContainer(category);
        }).toList(),
      );
    } else {
      return GridView.count(
        childAspectRatio: 2.1,
        crossAxisCount: 2,
        shrinkWrap: true,
        children: _placeholderCategory.map((category) {
          return _buildCategoryContainer(category);
        }).toList(),
      );
    }
  }

  Widget _buildCategoryContainer(Category category) {

    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      height: 50,
      child: Stack(
        children: <Widget>[

          InkWell(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                category.url,
                width: 200.0,
                height: 50.0,
                fit: BoxFit.fill,
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Text(
                category.name ?? 'New Feature',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  fontWeight: FontWeight.bold,
                )
            ),
          )
        ],
      ),
    );
  }

  _generateCategory() {
    _placeholderCategory.clear();
    _placeholderCategory.add(Category(name: 'Future Tech', url: 'assets/sample-image1.jpeg'));
    _placeholderCategory.add(Category(name: 'Cryptocurrency', url: 'assets/sample-image2.jpeg'));
    _placeholderCategory.add(Category(name: 'Gaming', url: 'assets/sample-image3.jpeg'));
    _placeholderCategory.add(Category(name: 'Business', url: 'assets/sample-image4.jpeg'));
    _placeholderCategory.add(Category(name: 'Fintech', url: 'assets/sample-image5.jpeg'));
    _placeholderCategory.add(Category(name: 'Gadget', url: 'assets/sample-image6.jpeg'));
    _placeholderCategory.add(Category(name: 'Self Development', url: 'assets/sample-image7.jpeg'));
    _placeholderCategory.add(Category(name: 'Startups', url: 'assets/sample-image8.jpeg'));
    }

  _populateQuery() {
    _placeholderCategory.forEach((element) {
      if (element.name.toLowerCase().contains(_searchQuery.toLowerCase())) {
        _queryCategory.add(element);
      }
    });
  }
}