import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo_homepage_ui_challenge/home_page/component/search_widget.dart';

import 'component/detail_main_function.dart';
import 'component/icon_function.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;

  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
    print("scrollOffset ${scrollOffset}");
  }

  double get scrollOffset {
    return _scrollController.offset;
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - 100);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
         
            pinned: true,
            stretch: true,
            backgroundColor: Colors.purple,
            title: Row(
              children: [
                SearchWidget(
                  height: 40,
                  width: 200,
                  title: "Tìm kiếm",
                ),
                SizedBox(width: 200,),
                Container(child: Text("duy2"),),
                Container(child: Text("duy2"),),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.zoomBackground
              ],
              centerTitle: true,
              title: Align(
                alignment: Alignment.bottomCenter,
                child: !isShrink?DetailMainFunction():IconFunction(),),
              ),
          ),

        ];
      },
      body: Center(
        child: Text("hello world"),
      ),
    );
  }

}