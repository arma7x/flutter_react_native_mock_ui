import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import '../address.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key, required this.title});

  final String title;

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> with AutomaticKeepAliveClientMixin<BookPage>{
  int _counter = 0;

  Address sender = Address(type: ADDRESS_TYPE.SENDER);
  Address recipient = Address(type: ADDRESS_TYPE.RECIPIENT);

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
            Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.child_care_outlined),
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(builder: (context) => sender.getAddressForm(context, 'Sender Address', (Address updated) {
                                setState(() {
                                  sender = updated;
                                });
                              })),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: sender.getPreviewWidget(defaultText: "Please enter sender address")
                          )
                        )
                      ),
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.child_care_outlined),
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(builder: (context) => recipient.getAddressForm(context, "Recipient Address", (Address updated) {
                                setState(() {
                                  recipient = updated;
                                });
                              })),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: recipient.getPreviewWidget(defaultText: "Please enter recipient address"),
                          ),
                        )
                      ),
                    ]
                  ),
                ]
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
