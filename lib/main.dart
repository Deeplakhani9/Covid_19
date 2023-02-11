import 'package:covid_19/finl.dart';
import 'package:flutter/material.dart';

import 'helper/api.dart';
import 'models/castam.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => myapp(),
        '1': (context) => finl(),
      },
    ),
  );
}

class myapp extends StatefulWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid 19"),
      ),
      body: FutureBuilder(
        future: API.api.fetchCurrency(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            Covid? data = snapshot.data;

            return (data != null)
                ? Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: data.loc
                            .map((e) => Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed('1', arguments: e);
                                      },
                                      child: ListTile(
                                        title: Text("${e['loc']}"),
                                      ),
                                    ),
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
                  )
                : Center(
                    child: Text("No Data"),
                  );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
