import 'package:flutter/material.dart';
import '../tabs/answer_tab.dart';
import '../tabs/ask_tab.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: _buildAppBar(),
        floatingActionButton: _buildFAB(),
        body: TabBarView(
          children: <Widget>[
            AnswerTab(),
            AskTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      title: Text("Decision Made"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {},
          tooltip: 'My Profile',
        ),
      ],
      bottom: new TabBar(
        tabs: <Widget>[
          new Tab(text: "Answer"),
          new Tab(text: "Ask"),
        ],
      ),
    );
  }

  Widget _buildFAB() {
    return new FloatingActionButton(
      tooltip: 'Create company',
      child: const Icon(Icons.add),
      backgroundColor: Theme.of(context).accentColor,
      onPressed: () {},
    );
  }
}
