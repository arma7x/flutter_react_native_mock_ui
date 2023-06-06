import 'package:flutter/material.dart';

enum ADDRESS_TYPE {
  SENDER,
  RECIPIENT,
}

typedef void AddressFormCallback(Address value);

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

  Address({String name = "", company = "", phoneNumber = "", firstAddress = "", secondAddress = "", poscode = "", town = "", state = "", ADDRESS_TYPE type = ADDRESS_TYPE.SENDER }) {
    this.name = name;
    this.company = company;
    this.phoneNumber = phoneNumber;
    this.firstAddress = firstAddress;
    this.secondAddress = secondAddress;
    this.poscode = poscode;
    this.town = town;
    this.state = state;
    this.type = type;
  }

  Widget getPreviewWidget({String defaultText = "Please enter address"}) {
    List<Widget> columns = [];
    List<String> addressDetails = [];
    if (firstAddress != "")
      addressDetails.add(firstAddress);
    if (secondAddress != "")
      addressDetails.add(secondAddress);
    if (poscode != "")
      addressDetails.add(poscode);
    if (town != "")
      addressDetails.add(town);
    if (state != "")
      addressDetails.add(state);
    if (addressDetails.length > 0) {
      columns.add(Text(addressDetails.join("\n")));
    }
    if (name != "")
      columns.add(Text(name));
    if (company != "")
      columns.add(Text(company));
    if (phoneNumber != "")
      columns.add(Text(phoneNumber));
    if (columns.length == 0)
      columns.add(Text(defaultText));
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: columns
    );
  }


  Widget getAddressForm(BuildContext context, String title, AddressFormCallback callback) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              initialValue: firstAddress,
              decoration: const InputDecoration(
                hintText: 'firstAddress',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                this.firstAddress = value;
                return null;
              },
            ),
            TextFormField(
              initialValue: secondAddress,
              decoration: const InputDecoration(
                hintText: 'secondAddress',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                this.secondAddress = value;
                return null;
              },
            ),
            TextFormField(
              initialValue: poscode,
              decoration: const InputDecoration(
                hintText: 'poscode',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                this.poscode = value;
                return null;
              },
            ),
            TextFormField(
              initialValue: town,
              decoration: const InputDecoration(
                hintText: 'town',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                this.town = value;
                return null;
              },
            ),
            TextFormField(
              initialValue: state,
              decoration: const InputDecoration(
                hintText: 'state',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                this.state = value;
                return null;
              },
            ),
            TextFormField(
              initialValue: name,
              decoration: const InputDecoration(
                hintText: 'name',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                this.name = value;
                return null;
              },
            ),
            this.type == ADDRESS_TYPE.RECIPIENT ? TextFormField(
              initialValue: company,
              decoration: const InputDecoration(
                hintText: 'company',
              ),
              validator: (String? value) {
                this.company = value == null || value.isEmpty ? "" : value;
                return null;
              },
            ) : SizedBox(width:0, height:0),
            TextFormField(
              initialValue: phoneNumber,
              decoration: const InputDecoration(
                hintText: 'phoneNumber',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                this.phoneNumber = value;
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    callback(this);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      )
    );
  }
}
