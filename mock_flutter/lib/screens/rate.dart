import 'package:flutter/material.dart';

class RatePage extends StatefulWidget {
  const RatePage({super.key, required this.title});

  final String title;

  @override
  State<RatePage> createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> with AutomaticKeepAliveClientMixin<RatePage>{
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text("DOMESTIC"),
            ),
            Center(
              child: Text("HISTORY"),
            ),
          ],
        ),
        bottomNavigationBar: new TabBar(
          tabs: [
            Tab(
              text: 'DOMESTIC',
            ),
            Tab(
              text: 'INTERNATIONAL',
            ),
          ],
          labelColor: Colors.red,
          unselectedLabelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.red,
        ),
      )
    );
  }
}
