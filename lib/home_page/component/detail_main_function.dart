import 'package:flutter/cupertino.dart';

import 'main_fuction_item.dart';

class DetailMainFunction extends StatelessWidget {
  final double offset;
  const DetailMainFunction({Key key, this.offset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double rate = 20;
    rate = offset/rate;
    print(" DetailMainFunction rate ${rate}");
    if(rate < 1){
      rate = 1;
    }
    return Container(
      height: size.height * 0.1,
      // width: size.width,
      child: Row(
        mainAxisAlignment: rate == 1 ? MainAxisAlignment.spaceEvenly :rate < 8 ?MainAxisAlignment.center:MainAxisAlignment.start,
        crossAxisAlignment: rate < 9 ? CrossAxisAlignment.start:CrossAxisAlignment.center,
        children: [
          rate < 8? Container():Container(width: size.width * 0.18,),
          MainFuctionItem(
            imageAsset: "assets/sliver_type.png",
            title: "Nạp tiền",
            width: size.width * 0.12,
            sizeRate: rate,
          ),
          MainFuctionItem(
            imageAsset: "assets/sliver_type.png",
            title: "Rút tiền",
            width: size.width * 0.12,
            sizeRate: rate,
          ),
          MainFuctionItem(
            imageAsset: "assets/sliver_type.png",
            title: "Thanh toán",
            width: size.width * 0.12,
            sizeRate: rate,
          ),
          MainFuctionItem(
            imageAsset: "assets/sliver_type.png",
            title: "Quét mã",
            width: size.width * 0.12,
            sizeRate: rate,
          ),
        ],
      ),
    );
  }
}
