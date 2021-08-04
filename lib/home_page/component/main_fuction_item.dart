import 'package:flutter/material.dart';

class MainFuctionItem extends StatelessWidget {
  final String imageAsset;
  final String title;
  final double width;
  final Function() onClick;

  const MainFuctionItem({Key key, this.imageAsset, this.title, this.onClick, this.width}) : super(key: key);
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
        width: width,
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
                child: Image.asset(imageAsset, height: size.width/15, color: Colors.black,)),
            SizedBox(height: size.height * 0.01,),
            Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: size.width/40, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}