import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class IssueData {
  IssueData({
    this.title,
    this.description,
  });
  final String title;
  final String description;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Issue Gallery',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(title: 'Issue Gallery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<IssueData> _issueList;

  @override
  void initState() {
    super.initState();
    _issueList = [
      new IssueData(
          title:
              "PageView in ListView resets position after being scrolled out "
              "of view",
          description:
              "If you build a PageView with multiple pages in a ListView, "
              "scroll to a non-zero page, and scroll it so that the "
              "PageView goes out of view, when it becomes visible again, "
              "the page position is reset. \n\nActually this is fixed now"
              " using PageStorageKeys, going to update this project so I can"
              "reuse it in the future"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView.builder(
        itemCount: _issueList.length,
        itemBuilder: (buildContext, index) {
          return new Padding(
            padding: new EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              top: 8.0,
              bottom: 4.0,
            ),
            child: new Material(
              color: new Color(0xFFD8D8D8),
              child: new InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    new MaterialPageRoute<Null>(
                      builder: (BuildContext context) {
                        return new Scaffold(
                          appBar: new AppBar(
                            title: new Text("Issue Detail"),
                          ),
                          body: new ListView(
                            children: <Widget>[
                              new Container(
                                height: 100.0,
                                child: new PageView(
                                  key: new PageStorageKey<String>("Pages 1"),
                                  children: <Widget>[
                                    new Container(
                                      color: Colors.green,
                                      padding: new EdgeInsets.all(4.0),
                                      child: new Text("Page 1"),
                                    ),
                                    new Container(
                                      color: Colors.green,
                                      padding: new EdgeInsets.all(4.0),
                                      child: new Text("Page 2"),
                                    ),
                                    new Container(
                                      color: Colors.green,
                                      padding: new EdgeInsets.all(4.0),
                                      child: new Text("Page 3"),
                                    ),
                                  ],
                                  controller: new PageController(),
                                ),
                              ),
                              new Container(
                                height: 100.0,
                                child: new PageView(
                                  key: new PageStorageKey<String>("Pages 2"),
                                  children: <Widget>[
                                    new Container(
                                      color: Colors.green,
                                      padding: new EdgeInsets.all(4.0),
                                      child: new Text("Page 1"),
                                    ),
                                    new Container(
                                      color: Colors.green,
                                      padding: new EdgeInsets.all(4.0),
                                      child: new Text("Page 2"),
                                    ),
                                    new Container(
                                      color: Colors.green,
                                      padding: new EdgeInsets.all(4.0),
                                      child: new Text("Page 3"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
                child: new Container(
                  padding: new EdgeInsets.all(4.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        _issueList[index].title,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new Padding(
                        padding: new EdgeInsets.only(top: 8.0),
                        child: new Text(
                          _issueList[index].description,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
