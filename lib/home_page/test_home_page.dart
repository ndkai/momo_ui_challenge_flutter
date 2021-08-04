// import 'package:flutter/material.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   ScrollController _scrollController = ScrollController();
//
//   bool lastStatus = true;
//
//   _scrollListener() {
//     if (isShrink != lastStatus) {
//       setState(() {
//         lastStatus = isShrink;
//       });
//     }
//   }
//
//   bool get isShrink {
//     return _scrollController.hasClients &&
//         _scrollController.offset > (200 - kToolbarHeight);
//   }
//
//   @override
//   void initState() {
//     _scrollController = ScrollController();
//     _scrollController.addListener(_scrollListener);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _scrollController.removeListener(_scrollListener);
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverAppBar(
//             pinned: true,
//             backgroundColor: Colors.teal[800],
//             expandedHeight: 200.0,
//             stretch: true,
//             centerTitle: false,
//             actionsIconTheme: IconThemeData.fallback(),
//             leading: Icon(Icons.add_a_photo),
//             onStretchTrigger: () async {
//               print('Load new data!');
//               // await Server.requestNewData();
//             } ,
//             title: Row(
//               children: [
//                 SizedBox(width: 200,),
//                 Container(child: Text("duy2"),),
//                 Container(child: Text("duy2"),),
//               ],
//             ),
//             flexibleSpace: FlexibleSpaceBar(
//               background: Container(
//                   child: Row(
//                     children: [
//                       Container(
//                         color: Colors.blueAccent,
//                         height: 50,
//                         width: 50,
//                         child: Text("duy1"),),
//                       Container(child: Text("duy2"), color: Colors.red,
//                         height: 50,
//                         width: 50,),
//                       Container(child: Text("duy2"), color: Colors.yellow,
//                         height: 50,
//                         width: 50,),
//                     ],
//                   )
//               ),
//               stretchModes: [
//                 StretchMode.zoomBackground
//               ],
//             ),
//           ),
//           WeeklyForecastList()
//         ],
//       ),
//     );
//   }
// }
//
// class WeeklyForecastList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final DateTime currentDate = DateTime.now();
//     final TextTheme textTheme = Theme.of(context).textTheme;
//
//     return SliverList(
//       delegate: SliverChildBuilderDelegate(
//             (BuildContext context, int index) {
//           final DailyForecast dailyForecast = Server.getDailyForecastByID(index);
//           return Card(
//             child: Row(
//               children: <Widget>[
//                 SizedBox(
//                   height: 200.0,
//                   width: 200.0,
//                   child: Stack(
//                     fit: StackFit.expand,
//                     children: <Widget>[
//                       DecoratedBox(
//                         position: DecorationPosition.foreground,
//                         decoration: BoxDecoration(
//                           gradient: RadialGradient(
//                             colors: <Color>[ Colors.grey[800], Colors.transparent ],
//                           ),
//                         ),
//                         child: Image.network(
//                           dailyForecast.imageId,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Center(
//                         child: Text(
//                           dailyForecast.getDate(currentDate.day).toString(),
//                           style: textTheme.headline2,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           dailyForecast.getWeekday(currentDate.weekday),
//                           style: textTheme.headline4,
//                         ),
//                         SizedBox(height: 10.0),
//                         Text(dailyForecast.description),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Text(
//                     '${dailyForecast.highTemp} | ${dailyForecast.lowTemp} F',
//                     style: textTheme.subtitle1,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//         childCount: 7,
//       ),
//     );
//   }
// }
//
// // --------------------------------------------
// // Below this line are helper classes and data.
//
// const String baseAssetURL = 'https://dartpad-workshops-io2021.web.app/getting_started_with_slivers/';
// const String headerImage = '${baseAssetURL}assets/header.jpeg';
//
// const Map<int, DailyForecast> _kDummyData = {
//   0 : DailyForecast(
//     id: 0,
//     imageId: '${baseAssetURL}assets/day_0.jpeg',
//     highTemp: 73,
//     lowTemp: 52,
//     description: 'Partly cloudy in the morning, with sun appearing in the afternoon.',
//   ),
//   1 : DailyForecast(
//     id: 1,
//     imageId: '${baseAssetURL}assets/day_1.jpeg',
//     highTemp: 70,
//     lowTemp: 50,
//     description: 'Partly sunny.',
//   ),
//   2 : DailyForecast(
//     id: 2,
//     imageId: '${baseAssetURL}assets/day_2.jpeg',
//     highTemp: 71,
//     lowTemp: 55,
//     description: 'Party cloudy.',
//   ),
//   3 : DailyForecast(
//     id: 3,
//     imageId: '${baseAssetURL}assets/day_3.jpeg',
//     highTemp: 74,
//     lowTemp: 60,
//     description: 'Thunderstorms in the evening.',
//   ),
//   4 : DailyForecast(
//     id: 4,
//     imageId: '${baseAssetURL}assets/day_4.jpeg',
//     highTemp: 67,
//     lowTemp: 60,
//     description: 'Severe thunderstorm warning.',
//   ),
//   5 : DailyForecast(
//     id: 5,
//     imageId: '${baseAssetURL}assets/day_5.jpeg',
//     highTemp: 73,
//     lowTemp: 57,
//     description: 'Cloudy with showers in the morning.',
//   ),
//   6 : DailyForecast(
//     id: 6,
//     imageId: '${baseAssetURL}assets/day_6.jpeg',
//     highTemp: 75,
//     lowTemp: 58,
//     description: 'Sun throughout the day.',
//   ),
// };
//
// class Server {
//   static List<DailyForecast> getDailyForecastList() => _kDummyData.values.toList();
//
//   static DailyForecast getDailyForecastByID(int id) {
//     assert(id >= 0 && id <= 6);
//     return _kDummyData[id];
//   }
// }
//
// class DailyForecast {
//   const DailyForecast({
//     this.id,
//     this.imageId,
//     this.highTemp,
//     this.lowTemp,
//     this.description,
//   });
//   final int id;
//   final String imageId;
//   final int highTemp;
//   final int lowTemp;
//   final String description;
//
//   static const List<String> _weekdays = <String>[
//     'Monday',
//     'Tuesday',
//     'Wednesday',
//     'Thursday',
//     'Friday',
//     'Saturday',
//     'Sunday',
//   ];
//
//   String getWeekday(int today) {
//     final int offset = today + id;
//     final int day = offset >= 7 ? offset - 7 : offset;
//     return _weekdays[day];
//   }
//
//   int getDate(int today) => today + id;
// }
//
// class ConstantScrollBehavior extends ScrollBehavior {
//   const ConstantScrollBehavior();
//
//   @override
//   Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) => child;
//
//   @override
//   Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) => child;
//
//   @override
//   TargetPlatform getPlatform(BuildContext context) => TargetPlatform.macOS;
//
//   @override
//   ScrollPhysics getScrollPhysics(BuildContext context) => const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
// }
//
