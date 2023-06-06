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
          title: Text(widget.title),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'DOMESTIC',
              ),
              Tab(
                text: 'INTERNATIONAL',
              ),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Theme.of(context).primaryColor,
          ),
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
      )
    );
  }
}
