import 'package:flutter/material.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key, required this.title});

  final String title;

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> with AutomaticKeepAliveClientMixin<TrackPage>{
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
            Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      padding: EdgeInsets.all(5),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter tracking code',
                          suffixIcon: IconButton(
                            onPressed: () => setState(() {}),
                            icon: const Icon(Icons.qr_code)
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      padding: EdgeInsets.all(5),
                      child: SizedBox(
                          height: 56,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: const Text("TRACK"),
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                    ),
                  ]
                ),
              ],
            ),
            Center(
              child: Text("HISTORY"),
            ),
          ],
        ),
        bottomNavigationBar: new TabBar(
          tabs: [
            Tab(
              text: 'TRACK',
            ),
            Tab(
              text: 'HISTORY',
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
