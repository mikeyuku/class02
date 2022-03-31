// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

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
  final googleProducts = GoogleProducts();

  ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: googleProducts.items.length,
      itemBuilder: (context, index) {
        return Card(child: ProductListTile([googleProducts.items[index], index]));
      },
    );
  }
}

///googleProducts.items[index]
class ProductListTile extends StatelessWidget {
  final List productLabel;

  const ProductListTile(this.productLabel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        productLabel[0],
        style: TextStyle(color: Colors.black),
      ),
      subtitle: Text('The subtitle ' + productLabel[1].toString(), style: TextStyle(color: Colors.black)),
      leading: Icon(Icons.share, color: Colors.black),
      tileColor: Colors.green,
      onTap: () {
        /// show snack bar
        final snackBar = SnackBar(content: Text('you selected $productLabel'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        /// end show snack bar
        /// Navigator for another page
        Navigator.push(context, MaterialPageRoute(builder: ((context) => MyDetails(productLabel[0]))));

        /// end Navigator for another page
      },
    );
  }
}

///
/// MyDetails()-Page
///
class MyDetails extends StatefulWidget {
  final String lastdata;

  MyDetails(this.lastdata, {Key? key}) : super(key: key);

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
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Text('Helo Details Page ' + widget.lastdata),
      ),
    );
  }
}

class AppBarActionShare extends StatelessWidget {
  const AppBarActionShare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.share),
      onPressed: () {
        final snackBar = SnackBar(
          content: Text('you selected the Share Action.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
