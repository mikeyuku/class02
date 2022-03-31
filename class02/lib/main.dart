// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

/*

class02-learning from 'Working with Onscreen Data in a Flutter Application'
https://www.qwiklabs.com/focuses/28820?parent=catalog


*/

class GoogleProducts {
  final List<String> items = [
    'Cloud Functions',
    'App Engine',
    'Kubernetes Engine',
    'Compute Engine',
    'Bare Metal',
    'Preemptible VMs',
    'Shielded VMs',
    'Sole-tenet Nodes',
    'VMWare Engine',
    'Cloud Firestore',
    'Cloud Storage',
    'Persistent Disk',
    'Local SSD',
    'Cloud Bigtable',
    'Cloud Firestore',
    'Cloud Memorystore',
    'Cloud Spanner',
  ];
}

void main() {
  const title = 'Google Products';
  runApp(
    const MaterialApp(
      title: title,
      home: MyApp(title),
    ),
  );
}

class MyApp extends StatefulWidget {
  final String title;
  const MyApp(this.title, {Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title, style: TextStyle(color: Colors.black))),
      body: ProductListView(),
    );
  }
}

class ProductListView extends StatelessWidget {
  final String? productLabel;

  const ProductListView({Key? key, this.productLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '$productLabel',
        style: TextStyle(color: Colors.black),
      ),
      subtitle: Text('subtitle', style: TextStyle(color: Colors.black)),
      leading: Icon(Icons.help_center_outlined, color: Colors.black),
      onTap: () {
        /// show snack bar
        final snackBar = SnackBar(content: Text('you selected $productLabel'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        /// end show snack bar
        /// Navigator for another page
        Navigator.push(context, MaterialPageRoute(builder: ((context) => MyDetails())));

        /// end Navigator for another page
      },
    );
  }
}

///
/// MyDetails()-Page
///
class MyDetails extends StatefulWidget {
  const MyDetails({Key? key}) : super(key: key);

  @override
  State<MyDetails> createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  final String title = 'Details Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [AppBarActionShare()],
          title: Text(
            title,
          )),
    );
  }
}
