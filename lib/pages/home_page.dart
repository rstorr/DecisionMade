import 'package:flutter/material.dart';
import '../tabs/answer_tab.dart';
import '../tabs/ask_tab.dart';
import '../strings.dart';

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
      title: Text(Strings.appName),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {},
          tooltip: Strings.profileTT,
        ),
      ],
      bottom: new TabBar(
        tabs: <Widget>[
          new Tab(text: Strings.answerTab),
          new Tab(text: Strings.askTab),
        ],
      ),
    );
  }

  Widget _buildFAB() {
    return new FloatingActionButton(
      tooltip: Strings.newQuestionTT,
      child: const Icon(Icons.add),
      backgroundColor: Theme.of(context).accentColor,
      onPressed: () =>
          Navigator.of(context).pushNamed(Strings.newQuestionRoute),
    );
  }
}
