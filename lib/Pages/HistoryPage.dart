import 'package:fast_login/assets/data/data.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
            expandedHeight: 105,
            backgroundColor: Color(0xfff3f4f5),
            foregroundColor: Color(0xfff3f4f5),
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.all(15),
              title: Text(
                'History',
                style: TextStyle(
                    color: Color(0xFF000060),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
            )),
        SliverList(
            delegate: SliverChildListDelegate(
          conections.map((conection) {
            return Container(
              margin: const EdgeInsets.only(
                  right: 15, left: 15, bottom: 0, top: 14),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: ShapeDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF000060), Color(0xFF2271b3)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFF000000).withOpacity(0.17),
                      blurRadius: 7,
                      spreadRadius: 2,
                    )
                  ],
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.network(
                            'https://play-lh.googleusercontent.com/fHfTlNIq5PMps_296XPMC2N-u5ARCmaSM_lNuukKjhK8ITbHHS5YyYyT5ABJU1s8_Q',
                            height: 35,
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    conection.platform,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: 'consolas'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: <Widget>[
                                  Text('Date: ',
                                      style: TextStyle(
                                          color: Colors.white,
                                        fontFamily: 'consolas',)),
                                  Text(toDate(conection.conectionDateTime),
                                      style: TextStyle(
                                          color: Colors.white,
                                        fontFamily: 'consolas',))
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      Icon(
                        Icons.info_outline,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
            );
          }).followedBy([
            Container(
              height: 60,
            )
          ]).toList(),
        ))
      ],
    );
  }
}

String toDate(DateTime dateTime) {
  return dateTime.toLocal().day.toString() +
      '/' +
      dateTime.toLocal().month.toString() +
      '/' +
      dateTime.toLocal().year.toString() +
      ' ' +
      dateTime.toLocal().hour.toString() +
      ':' +
      dateTime.toLocal().minute.toString();
}
