import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:vision_bus/Screens/shared/constants.dart';


class body extends StatelessWidget {
  const body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/linhasO.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["linhas"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar( backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: const Text(
          'Pontos disponíveis',
          style: TextStyle(
          fontFamily: 'LibreBaskerville',
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            _items.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          key: ValueKey(_items[index]["id"]),
                          margin: const EdgeInsets.all(10),
                          color: Colors.white,
                          child: ListTile(
                            leading: Text(_items[index]["sentidos"].toString().replaceAll('[]', ''),
                             style: TextStyle(
                            fontFamily: 'LibreBaskerville',
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            ),),
                            //title: Text(_items[index]["numero"]),
                            //subtitle: Text(_items[index]["description"]),
                          ),
                        );
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
