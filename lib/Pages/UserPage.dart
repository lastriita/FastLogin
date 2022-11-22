import 'package:fast_login/assets/data/data.dart';
import 'package:flutter/material.dart';
import 'package:text_transformation_animation/text_transformation_animation.dart';

String surname_t = '1110010101001';
String name_t = '1110010101001';
String nacionalidad_t = '1110010101001';
String birthday_t = '1110010101001';
String sex_t = '1';
String DNI_t = '1110010101001';
String FLid_t = '10101001';

String _name = 'Álvaro';
String _surname = 'Lastra Aragoneses';
String _nacionalidad = 'Española';
String _birthday = '24/11/2000';
String _sex = 'M';
String _DNI = '71313523E';
String _FLid = '1082PF';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((value) {
      print('Async done');
      setState(() {
        surname_t = _surname;
        name_t = _name;
        sex_t = _sex;
        nacionalidad_t = _nacionalidad;
        birthday_t = _birthday;
        DNI_t = _DNI;
        FLid_t = _FLid;
      });
    });

    super.initState();
  }

  Future _getThingsOnStartup() async {
    await Future.delayed(Duration(milliseconds: 800));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        SliverAppBar(
            expandedHeight: 105,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.all(15),
              title: Text('Bienvenido Álvaro',
                  style: TextStyle(
                      color: Color(0xFF000060),
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
            )),
        SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          getCardID(context),
          SizedBox(
            height: 30,
          ),
          Container(
            //height: displayHeight(context)-160-(displayWidth(context)-30)*3/5,
            padding: EdgeInsets.all((displayWidth(context)) * 0.07),
            decoration: ShapeDecoration(
                color: Color(0xFFf3f4f5),
                shadows: [
                  BoxShadow(
                      color: Color(0xFF000000).withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(-5, -5))
                ],
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(15 + (displayWidth(context)) * 0.06)),
                )),
            child: Column(
                children: conections.map((conection) {
              return Container(
                margin:
                    const EdgeInsets.only(right: 0, left: 0, bottom: 8, top: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shadows: [
                      BoxShadow(
                        color: Color(0xFF000000).withOpacity(0.1),
                        blurRadius: 7,
                        spreadRadius: 1,)
                    ],
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.label,
                              size: 24,
                            ),
                            SizedBox(width: 8),
                            Text(
                              conection.platform,
                              style: TextStyle(fontFamily: 'avenir'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).followedBy([
              Container(
                height: 60,
              )
            ]).toList()),
          )
        ])),
      ],
    );
  }
}

Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  return displaySize(context).width;
}

Container getCardID(BuildContext context) {
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
                      colors: [Color(0xFF000060), Color(0xFF108239)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.7, 1]),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFF000000).withOpacity(0.1),
                      blurRadius: 7,
                      spreadRadius: 1,)
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
                            Row(
                              children: [
                                TextTransformationAnimation(
                                    text: surname_t,
                                    duration: Duration(milliseconds: 1000),
                                    style: TextStyle(
                                        fontFamily: 'consolas',
                                        color: Colors.white,
                                        fontSize:
                                            (displayWidth(context) * 0.8) *
                                                0.05,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Name',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            (displayWidth(context) * 0.8) *
                                                0.03,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Row(
                              children: [
                                TextTransformationAnimation(
                                    text: name_t,
                                    duration: Duration(milliseconds: 1000),
                                    style: TextStyle(
                                        fontFamily: 'consolas',
                                        color: Colors.white,
                                        fontSize:
                                            (displayWidth(context) * 0.8) *
                                                0.05,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Sexo',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    (displayWidth(context) *
                                                            0.8) *
                                                        0.03,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        TextTransformationAnimation(
                                            text: sex_t,
                                            duration:
                                                Duration(milliseconds: 1000),
                                            style: TextStyle(
                                                fontFamily: 'consolas',
                                                color: Colors.white,
                                                fontSize:
                                                    (displayWidth(context) *
                                                            0.8) *
                                                        0.05,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Nacionalidad',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    (displayWidth(context) *
                                                            0.8) *
                                                        0.03,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        TextTransformationAnimation(
                                            text: nacionalidad_t,
                                            duration:
                                                Duration(milliseconds: 1000),
                                            style: TextStyle(
                                                fontFamily: 'consolas',
                                                color: Colors.white,
                                                fontSize:
                                                    (displayWidth(context) *
                                                            0.8) *
                                                        0.05,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Date of Birth',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            (displayWidth(context) * 0.8) *
                                                0.03,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Row(
                              children: [
                                TextTransformationAnimation(
                                    text: birthday_t,
                                    duration: Duration(milliseconds: 1000),
                                    style: TextStyle(
                                        fontFamily: 'consolas',
                                        color: Colors.white,
                                        fontSize:
                                            (displayWidth(context) * 0.8) *
                                                0.05,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ), // info id
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('DNI ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        (displayWidth(context) * 0.8 + 1.05) *
                                            0.05,
                                    fontWeight: FontWeight.bold)),
                            TextTransformationAnimation(
                                text: DNI_t,
                                duration: Duration(milliseconds: 1000),
                                style: TextStyle(
                                    fontFamily: 'consolas',
                                    color: Colors.white,
                                    fontSize:
                                        (displayWidth(context) * 0.8 + 1.05) *
                                            0.05,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('FLid ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        (displayWidth(context) * 0.8 + 1.05) *
                                            0.05,
                                    fontWeight: FontWeight.bold)),
                            TextTransformationAnimation(
                                text: FLid_t,
                                duration: Duration(milliseconds: 1000),
                                style: TextStyle(
                                    fontFamily: 'consolas',
                                    color: Colors.white,
                                    fontSize:
                                        (displayWidth(context) * 0.8 + 1.05) *
                                            0.05,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ), // numeros
                  ],
                ),
              ),
            )),
      ],
    ),
  );
}
