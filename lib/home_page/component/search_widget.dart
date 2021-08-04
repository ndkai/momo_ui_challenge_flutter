import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final ValueChanged onChanged;
  final ValueChanged onSummited;
  final String title;
  final double width;
  final double height;

  const SearchWidget({Key key, this.onChanged, this.onSummited, this.title, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double rate = 30;
    rate = width/rate;
    print("SearchWidget rate ${rate}");
    if(rate < 1){
      rate = 1;
    }
    return Container(
        height: height,
        width: size.width * 0.6 / rate,
        margin: EdgeInsets.fromLTRB(5, 10, 0, 15),
        decoration: BoxDecoration(
            color: width == 200? Colors.transparent: Colors.white70.withOpacity((8.32-rate)/8.32),
            borderRadius: BorderRadius.circular(5),
            // border: Border.all(color: Colors.blueAccent)
        ),
        child: Center(
          child: TextField(
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 18, ),
              hintText: title,
                prefixIcon: Icon(Icons.search, color: Colors.white,),
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0 ),
            ),
            onChanged: onChanged,
            onSubmitted: onSummited,
          ),
        ));
  }
}
