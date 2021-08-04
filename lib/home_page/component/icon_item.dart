import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconItem extends StatelessWidget {
  final String image;
  final Function onClick;
  const IconItem({Key key, this.image, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  GestureDetector(
      onTap: (){
        onClick();
      },
      child: Container(
        padding: const EdgeInsets.all(3),
        // height: size.width * 0.25,
        width: size.width * 0.05,
        margin: const EdgeInsets.fromLTRB(3,0,3,0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          // border: Border.all(color: Colors.grey[300], width: 1)
        ),
        child:Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black38,
                    shape: BoxShape.circle
                ),
                child: Image.asset(image, height: size.width/25, color: Colors.black,)),
          ],
        ),
      ),
    );
  }
}
