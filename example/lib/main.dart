import 'package:flutter/material.dart';
import 'package:bottommultinavigationbar/bottommultinavigationbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BottomMultiNavigationBar(
        index: pageIndex,
        pageNavigators: pages,
        onIndexChanged: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      )
    );
  }
}

//Page navigators with their own onGenerateRoute
final pages = [
  PageNavigator(
    bottomNavigationIcon: Icon(Icons.home),
    bottomNavigationText: "Home",
    onGenerateRoute: (settings) {
      if(settings.name == PageNavigator.home) {
        return MaterialPageRoute(builder: (context) => buildTestPage("home/page 1","/pageTwo",context));
      } else if (settings.name == "/pageTwo") {
        return MaterialPageRoute(builder: (context) => buildTestPage("home/page 2","/",context));
      }
    }
  ),
  PageNavigator(
    bottomNavigationIcon: Icon(Icons.settings),
    bottomNavigationText: "Settings",
    onGenerateRoute: (settings) {
      if(settings.name == PageNavigator.home) {
        return MaterialPageRoute(builder: (context) => buildTestPage("settings/page 1","/pageTwo",context));
      } else if (settings.name == "/pageTwo") {
        return MaterialPageRoute(builder: (context) => buildTestPage("settings/page 2","/",context));
      }
    }
  )
];

Widget buildTestPage(String pageName,String nextPage, BuildContext context) {
  return Scaffold(
    body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(pageName),
          RaisedButton(
            child: Text("open " + nextPage),
            onPressed: () => Navigator.of(context).pushNamed(nextPage)
          )
        ],
      ),
    )
  );
}