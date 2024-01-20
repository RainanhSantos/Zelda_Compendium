import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';

class Details extends StatelessWidget {
  Details({super.key, required this.entry});

  final Entry entry;
  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.star),
          label: const Text(
            "Favoritar",
            style: TextStyle(
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: (){
            daoController.saveEntry(entry: entry);
          },
        ),
        body: Column(
          children: <Widget>[
            Text(entry.name),
            Wrap(
              children: entry.commonLocationsConverter().map((e) => Chip(label: Text(e))).toList(),
            ),
            Image.network(entry.image),
            Padding(
              padding: const EdgeInsets.only(top: 9.0),
              child: Text(entry.description),
            ),
          ],
        ),
      ),
    );
  }
}