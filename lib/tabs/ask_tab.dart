import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AskTab extends StatefulWidget {
  @override
  State createState() => AskTabState();
}

class AskTabState extends State<AskTab> {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('questions').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        return new ListView(
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return new ListTile(
              title: new Text(document['question_text'].toString()),
              subtitle: new Text(document['answer'].toString()),
            );
          }).toList(),
        );
      },
    );
  }
}
