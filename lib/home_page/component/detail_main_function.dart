import 'package:flutter/cupertino.dart';

import 'main_fuction_item.dart';

class DetailMainFunction extends StatelessWidget {
  const DetailMainFunction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          MainFuctionItem(
            imageAsset: "assets/sliver_type.png",
            title: "Thanh toán",
            width: size.width * 0.11,
          ),
          MainFuctionItem(
            imageAsset: "assets/sliver_type.png",
            title: "Thanh toán",
            width: size.width * 0.11,
          ),
          MainFuctionItem(
            imageAsset: "assets/sliver_type.png",
            title: "Thanh toán",
            width: size.width * 0.11,
          ),
          MainFuctionItem(
            imageAsset: "assets/sliver_type.png",
            title: "Thanh toán",
            width: size.width * 0.11,
          ),
        ],
      ),
    );
  }
}
