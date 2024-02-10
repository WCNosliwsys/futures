import 'package:flutter/material.dart';

class FuturePage extends StatefulWidget {
  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  Future<String> getTitle() async {
    return Future.delayed(
      Duration(seconds: 5),
      () {
        return "Los inocentes";
      },
    );
  }

  Future<int> getNumber() async {
    return Future.delayed(Duration(seconds: 3), () {
      return 999;
    });
  }

  Future<List<String>> getProducts() async {
    return Future.delayed(
      Duration(seconds: 5),
      () {
        return ["Fresa", "Papaya", "Platano", "Manzana"];
      },
    );
  }

  Future<List<Map<String, dynamic>>> getItems() async {
    return Future.delayed(Duration(seconds: 5), () {
      return [
        {"id": 1, "name": "zapatos"},
        {"id": 2, "name": "vestidos"},
        {"id": 3, "name": "zapatillas"},
        {"id": 4, "name": "polos"},
        {"id": 5, "name": "camisas"},
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Page"),
      ),
      body: Center(
        child: FutureBuilder(
          future: getItems(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              List<Map<String, dynamic>> data = snapshot.data;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(data[index]["name"]);
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),

        // FutureBuilder(
        //   future: getTitle(),
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     if (snapshot.hasData) {
        //       dynamic respuesta = snapshot.data;
        //       return Text(respuesta.toString());
        //     }
        //     return SizedBox(
        //       width: 120,
        //       height: 120,
        //       child: CircularProgressIndicator(
        //         color: Colors.pink,
        //         strokeWidth: 20,
        //       ),
        //     );

        //     // print("snapshot: $snapshot");
        //     // print("connection state: ${snapshot.connectionState}");
        //     // print("has data: ${snapshot.hasData}");
        //     // print("has error: ${snapshot.hasError}");
        //     // dynamic variable = snapshot.data;
        //     // return Text(variable.toString());
        //   },
        // ),
      ),
    );
  }
}
