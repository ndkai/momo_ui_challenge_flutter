import 'package:flutter/cupertino.dart';

import 'icon_item.dart';

class IconFunction extends StatelessWidget {
  const IconFunction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconItem(
            image: "assets/sliver_type.png",
            onClick: (){},
          ),
          IconItem(
            image: "assets/sliver_type.png",
            onClick: (){},
          ),
          IconItem(
            image: "assets/sliver_type.png",
            onClick: (){},
          ),
          IconItem(
            image: "assets/sliver_type.png",
            onClick: (){},
          ),

        ],
      ),
    );
  }
}


