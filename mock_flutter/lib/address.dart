import 'package:flutter/material.dart' show Text, Widget, Column;

enum ADDRESS_TYPE {
  SENDER,
  RECIPIENT,
}

class Address {
  String name = "";
  String company = "";
  String phoneNumber = "";
  String firstAddress = "";
  String secondAddress = "";
  String poscode = "";
  String town = "";
  String state = "";
  ADDRESS_TYPE type = ADDRESS_TYPE.SENDER;

  Adress({String name = "", company = "", phoneNumber = "", firstAddress = "", secondAddress = "", poscode = "", town = "", state = ""}) {
    this.name = name;
    this.company = company;
    this.phoneNumber = phoneNumber;
    this.firstAddress = firstAddress;
    this.secondAddress = secondAddress;
    this.poscode = poscode;
    this.town = town;
    this.state = state;
  }

  Widget getPreviewWidget() {
    List<Widget> columns = [Text("$this.phoneNumber\n$this.firstAddress\n$this.secondAddress\n$this.poscode\n$this.town\n$this.state")];
    if (name != "")
      columns.add(Text(this.name));
    if (company != "")
      columns.add(Text(this.company));
    if (phoneNumber != "")
      columns.add(Text(this.phoneNumber));
    return Column(
      children: columns
    );
  }
}
