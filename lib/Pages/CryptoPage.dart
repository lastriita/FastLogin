import 'package:fast_login/assets/data/data.dart';
import 'package:flutter/material.dart';

class CryptoPage extends StatefulWidget {
  CryptoPage({Key key}) : super(key: key);

  _CryptoPageState createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage>
    with SingleTickerProviderStateMixin {
  final _pages = [
    Tab(
      text: 'Contraseñas',
    ),
    Tab(
      text: 'Documentos',
    ),
    Tab(
      text: 'Tarjetas',
    )
  ];

  final List<Widget> _tabs = [
    Container(
      child: Text('hola'),
    ),
    Container(
      child: Text('hola2'),
    ),
    Container(
      child: Text('hola4'),
    ),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this,);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: true,
                floating: true,
                bottom: TabBar(
                  physics: BouncingScrollPhysics(),
                  indicatorColor: Color(0xff000060),
                  labelColor: Color(0xff000060),
                  unselectedLabelColor: Color(0xff000060),
                  controller: _tabController,
                  tabs: _pages,
                ),
                expandedHeight: 105,
                backgroundColor: Color(0xfff3f4f5),
                foregroundColor: Color(0xfff3f4f5),
                stretch: true,
                title: Text('Mis documentos',
                    style: TextStyle(
                        color: Color(0xFF000060),
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
              ),
            ];
          },
          body: TabBarView(
              controller: _tabController,
              physics: BouncingScrollPhysics(),
              children: [
                buildTab(),
                Container(color: Colors.grey),
                buildTab(),
              ])),
    );
  }

  ListView buildTab() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: conections.map((conection) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
          decoration: ShapeDecoration(
              color: Colors.white,
              shadows: [
                BoxShadow(
                  color: Color(0xFF000000).withOpacity(0.1),
                  blurRadius: 7,
                  spreadRadius: 1,
                )
              ],
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 35,
                        width: 50,
                        child: ClipPath(
                          clipper: Sky(),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Image.network(
                              'https://public.bnbstatic.com/image/cms/blog/20200707/631c823b-886e-4e46-b12f-29e5fdc0882e.png',
                            ),
                          ),
                        ),
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
                                    color: Color(0xff000060),
                                    fontFamily: 'consolas',
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: <Widget>[
                              Text('lastriita99',
                                  style: TextStyle(
                                    color: Color(0xff000060),
                                    fontFamily: 'consolas',
                                  )),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Icon(
                    Icons.content_copy_sharp,
                    size: 30,
                    color: Color(0xff000060),
                  )
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class Sky extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double h = size.height;
    double w = size.width;

    double xOffset = 5;
    Path path = Path()
      ..lineTo(0, xOffset)
      ..lineTo(0, h - xOffset)
      ..lineTo(xOffset, h)
      ..lineTo(w - xOffset, h)
      ..lineTo(w, h - xOffset)
      ..lineTo(w, xOffset)
      ..lineTo(w - xOffset, 0)
      ..lineTo(xOffset, 0)
      ..lineTo(0, xOffset);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
