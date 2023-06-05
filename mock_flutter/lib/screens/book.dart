import 'package:flutter/material.dart';
import '../address.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key, required this.title});

  final String title;

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> with AutomaticKeepAliveClientMixin<BookPage>{
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
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'BOOK',
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
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text("BOOK"),
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
