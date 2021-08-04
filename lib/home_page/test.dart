import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestingNew extends StatefulWidget {
  const TestingNew({Key key}) : super(key: key);

  @override
  _TestingNewState createState() => _TestingNewState();
}

class _TestingNewState extends State<TestingNew> {
  ScrollController _scrollController;

  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
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
            floating: false,
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("text sample",
                    style: TextStyle(
                      color: isShrink ? Colors.black : Colors.white,
                      fontSize: 16.0,
                    )),
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