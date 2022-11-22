import 'package:fast_login/Pages/CryptoPage.dart';
import 'package:fast_login/Pages/HistoryPage.dart';
import 'package:fast_login/Pages/HomePage.dart';
import 'package:fast_login/Pages/UserPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xfff3f4f5),
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xff000060),
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF000060)),
      ),
      home: MyHomePage(title: 'Fast Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*
  SnakeShape customSnakeShape = SnakeShape(
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      centered: true);

  ShapeBorder customBottomBarShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25), topRight: Radius.circular(25)),
  );

  ShapeBorder customBottomBarShape1 = BeveledRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25), topRight: Radius.circular(25)),
  );*/

  SnakeShape snakeShape = SnakeShape.rectangle;

  ShapeBorder bottomBarShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)));

  ShapeBorder customBottomBarShape = BeveledRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25), topRight: Radius.circular(25)),
  );

  int _selectedItemPosition = 0;
  SnakeBarBehaviour snakeBarBehaviour = SnakeBarBehaviour.pinned;

  Color backgroundColor = Colors.white;
  Color selectionColor = Color(0xFF000060);

  EdgeInsets padding = EdgeInsets.all(12);
  Color containerColor = Color(0xFFFDE1D7);

  final UserPage _userPage = new UserPage();
  final HistoryPage _historyPage = new HistoryPage();
  final CryptoPage _cryptoPage = new CryptoPage();
  final HomePage _homePage = new HomePage();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _userPage;
        break;
      case 1:
        return _historyPage;
        break;
      case 2:
        return _homePage;
        break;
      case 3:
        return _cryptoPage;
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text(
              'Page not found',
              style: new TextStyle(fontSize: 30)
            ),
          )
        );
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      backgroundColor: Color(0xFFf3f4f5),
      //appBar: AppBar(title: Text(widget.title),),
      body: _pageChooser(_selectedItemPosition),

      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: snakeBarBehaviour,
        snakeShape: snakeShape,
        shape: customBottomBarShape,
        //padding: padding,

        snakeViewColor: selectionColor, //comment if you want to see colors
        backgroundColor: backgroundColor, //comment if you want to see colors

        currentIndex: _selectedItemPosition,
        onTap: (index) =>
            setState(() => _selectedItemPosition = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined),
              label: 'Account'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history_sharp),
              label: 'Calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_sharp),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_outline_sharp),
              label: 'Microphone'),
        ],
      ),
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}