
import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/screens/details.dart';

class EntryCard extends StatelessWidget {
  EntryCard({super.key, required this.entry, required this.isSaved}); 
  final Entry entry;
  final bool isSaved;

  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Dismissible(
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          child: const Icon(Icons.delete),
        ),
        direction: isSaved ? DismissDirection.endToStart : DismissDirection.none,
        key: ValueKey<int>(entry.id),
        onDismissed: (direction) {
          daoController.deleteEntry(entry: entry);
        },
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => Details(entry: entry),
                  ),
                );
              },
              child: Ink(
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      child: Image.network(
                        entry.image, 
                        width: 180, 
                        height: 200,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(entry.name),
                            Text(entry.description),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Wrap(
              children: entry.commonLocationsConverter().map(
                (e) => Chip(
                  label: Text(e),
                ),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}