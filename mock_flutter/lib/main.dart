import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import './screens/index.dart' as Screens;

void main() {
  runApp(const MyApp());
}

// hello world

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - 56;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  left: ((width * 0.2) - 30) / 2, right: (width * 0.2) / 2),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  const Screens.LoginPage(title: 'Login')),
                        );
                      },
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(30),
                      ),
                    ),
                    const Text('Picture')
                  ]),
              width: width,
              height: 0.3 * height,
              color: Colors.red,
            ),
            Container(
              child: Center(
                  child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              )),
              width: width,
              height: 0.7 * height,
              color: Colors.blue,
            ),
          ],
        ),
        Positioned(
          top: 0.3 * height - (80 / 2),
          left: (width * 0.2) / 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.green,
            ),
            width: width * 0.85,
            height: 80,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                    width: ((width * 0.85)) * 0.23,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  const Screens.TrackPage(title: 'Track')),
                        );
                      },
                      child: Text(
                        'Track',
                        style: TextStyle(fontSize: 12),
                      ),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: ((width * 0.85)) * 0.23,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const Screens.BookPage(
                                  title: 'Book Shipment')),
                        );
                      },
                      child: Text(
                        'Book',
                        style: TextStyle(fontSize: 12),
                      ),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: ((width * 0.85)) * 0.23,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  const Screens.RatePage(title: 'Rate')),
                        );
                      },
                      child: Text(
                        'Rate',
                        style: TextStyle(fontSize: 12),
                      ),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: ((width * 0.85)) * 0.23,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  const Screens.BranchPage(title: 'Branch')),
                        );
                      },
                      child: Text(
                        'Branch',
                        style: TextStyle(fontSize: 12),
                      ),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
