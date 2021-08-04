import 'package:flutter/material.dart';

class MainFuctionItem extends StatelessWidget {
  final String imageAsset;
  final String title;
  final double width;
  final Function() onClick;
  final double sizeRate;

  const MainFuctionItem({Key key, this.imageAsset, this.title, this.onClick, this.width, this.sizeRate = 1.0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("sizeRate ${sizeRate}");
    return  GestureDetector(
      onTap: (){
        onClick();
      },
      child: Container(
        padding: const EdgeInsets.all(3),
        height: size.width * 0.2/ (sizeRate/6.5),
        width: width,
        margin: const EdgeInsets.fromLTRB(3,0,3,0),
        decoration: BoxDecoration(
          // color: sizeRate == 10.0?Colors.transparent: Colors.white.withOpacity((12.48-sizeRate)/12.48),
          //  color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          // border: Border.all(color: Colors.grey[300], width: 1)
        ),
        child:Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(10,0,10,0),
                decoration: BoxDecoration(
                  color: sizeRate == 10.0?Colors.transparent: Colors.white.withOpacity((12.48-sizeRate)/12.48),
                    shape: BoxShape.circle
                ),
                child: sizeRate < 10 ?Image.asset("assets/black_heart.png", height: size.width/13 , color: Colors.pink,)
                    :Image.asset("assets/black_heart.png", color: Colors.white, height: size.width/13,)),
            SizedBox(height: 10/sizeRate,),
            Container(
                width: (width) / sizeRate,
              child: Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: size.width/40/sizeRate, color: Colors.black)),
            )
          ],
        ),
      ),
    );
  }
}