import 'dart:math';

import 'package:fast_login/Pages/UserPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  PageController pageController = PageController(viewportFraction: 0.6);

  List<Widget> itemsData = [];

  void getPostsData() {
    itemsData = new List.generate(15, (index) => getCardHolder(context));
    itemsData.add(Container(height: 100,));
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => setState(() {getPostsData();}));
  }

  @override
  Widget build(BuildContext context) {

    controller.addListener(() {
      double value = controller.offset / ((displayWidth(context)-30)*3/5*0.7);

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 0;
      });
    });

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 15, right: 15,
                        top: 30, bottom: 0),
                child: Text(
                  'Card Holder',
                  style: TextStyle(
                      color: Color(0xFF000060),
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
              ),
            ],
          ),
          Padding(
            padding:
            const EdgeInsets.only(left: 15, right: 15,
                top: 10, bottom: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shadows: [
                    BoxShadow(
                      color: Color(0xFF000000).withOpacity(0.05),
                      blurRadius: 4,
                      spreadRadius: 1,
                    )
                  ],
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Search...', style: TextStyle(color: Colors.grey),),
                  Icon(Icons.search_sharp, size: 20,)
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  controller: controller,
                  itemCount: itemsData.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    double scale = 1.0;
                    scale = index + 1 - topContainer;
                    if (scale < 0) {
                      scale = 0;
                    } else if (scale > 1) {
                      scale = 1;
                    }
                    return Opacity(
                      opacity: scale,
                      child: Transform.translate(
                        offset: Offset(-(scale-1)*displayWidth(context),
                            (-scale+1)*(displayWidth(context)-30)*3/5*0.7),
                        child: Align(
                            heightFactor: 0.7,
                            alignment: Alignment.topCenter,
                            child: itemsData[index]),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}

Container getCardHolder(BuildContext context) {
  final rnd = new Random();
  final r = rnd.nextInt(255);
  final g = rnd.nextInt(255);
  final b = rnd.nextInt(255);

  return Container(
    padding: const EdgeInsets.only(right: 15, left: 15),
    child: Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 5 / 3,
          child: Container(
              decoration: ShapeDecoration(
                  //color: Color(0xFF000060),
                  gradient: LinearGradient(
                      colors: [Color.fromRGBO(r, g, b, 1), Color(0xFF108239)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.7, 1]),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFF000000).withOpacity(0.1),
                      blurRadius: 7,
                      spreadRadius: 1,
                    )
                  ],
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        (displayWidth(context) - 15) * 0.06),
                  )),
              child: Padding(
                padding: EdgeInsets.only(
                    top: (displayWidth(context) - 15) * 0.04,
                    bottom: (displayWidth(context) - 15) * 0.04,
                    left: (displayWidth(context) - 15) * 0.07,
                    right: (displayWidth(context) - 15) * 0.07),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Fast Login ID',
                            style: TextStyle(
                                fontFamily: 'consolas',
                                color: Colors.white,
                                fontSize: (displayWidth(context) * 0.8) * 0.05,
                                fontWeight: FontWeight.bold)),
                        Icon(
                          Icons.fingerprint_outlined,
                          color: Colors.white,
                          size: (displayWidth(context) * 0.8) * 0.06,
                        )
                      ],
                    ), // header id
                    Spacer(),
                    Row(
                      children: [
                        Image.network(
                          'https://media.istockphoto.com/photos/portrait-of-a-young-professional-man-picture-id1086350530?k=6&m=1086350530&s=612x612&w=0&h=em-GeiJktQnwQC2Deo03uXdb7W66kRHpgct80Opdyk0=',
                          height: (displayWidth(context) * 0.8) * 0.38,
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Surname',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            (displayWidth(context) * 0.8) *
                                                0.03,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ) // numeros
                      ],
                    ),
                  ],
                ),
              )),
        )
      ],
    ),
  );
}
