import 'package:flutter/material.dart';

import '../../model/info_model.dart';
import '../../service/info_service.dart';
import '../../source/network_source.dart';


class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  Future<List<InfoModel>> process = InfoService(NetworkSource.dio()).getInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REST API"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                process = InfoService(NetworkSource.dio()).getInfo();
              });
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: FutureBuilder<InfoModel>(
        future: InfoService(NetworkSource.dio()).getInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(snapshot.data?.data?.id ?? "-"),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
