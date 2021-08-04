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
    setState(() {
      scrollOffset;
    });
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
    Size size = MediaQuery.of(context).size;
    double rate = 10;
    double rate2 = 10;
    try {
      rate2 = scrollOffset / rate;
      if (rate2 < 1) {
        rate2 = 1;
      }
    } catch (e) {
      rate2 = 1;
    }
    print(" DetailMainFunction rate ${rate2}");
    return Container(
      color: Colors.purple,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: NestedScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                primary: false,
                pinned: true,
                stretch: true,
                snap: false,
                floating: false,
                backgroundColor: Colors.purple,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchWidget(
                      height: 40,
                      width: _scrollController.hasClients ? scrollOffset : 0.0,
                      title: "Tìm kiếm",
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            height: size.width * 0.2 / (rate / 6.5),
                            width: size.width * 0.12,
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              //  color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              // border: Border.all(color: Colors.grey[300], width: 1)
                            ),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        shape: BoxShape.circle),
                                    child: Image.asset(
                                      "assets/black_heart.png",
                                      color: Colors.white,
                                      height: size.width / 13,
                                    )),
                                SizedBox(
                                  height: 10 / rate,
                                ),
                                Container(
                                  width: size.width * 0.12 / rate,
                                  child: Text("asd",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: size.width / 40 / rate,
                                          color: Colors.black)),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            height: size.width * 0.2 / (rate / 6.5),
                            width: size.width * 0.12,
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              //  color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              // border: Border.all(color: Colors.grey[300], width: 1)
                            ),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        shape: BoxShape.circle),
                                    child: Image.asset(
                                      "assets/black_heart.png",
                                      color: Colors.white,
                                      height: size.width / 13,
                                    )),
                                SizedBox(
                                  height: 10 / rate,
                                ),
                                Container(
                                  width: size.width * 0.12 / rate,
                                  child: Text("asd",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: size.width / 40 / rate,
                                          color: Colors.black)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle,
                  ],
                  // centerTitle: true,
                  titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  title: DetailMainFunction(
                      offset:
                          _scrollController.hasClients ? scrollOffset : 0.0),
                ),
              ),
            ];
          },
          body: Center(
            child: Text("hello world"),
          ),
        ),
      ),
    );
  }
}
