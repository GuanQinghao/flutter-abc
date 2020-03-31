import 'package:flutter/material.dart';

class My0x1ContainerLayout extends StatelessWidget {
  // 导航栏标题
  final String title;

  const My0x1ContainerLayout({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: FlatButton(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.grey[400],
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 10.0,
                          color: Colors.blueGrey,
                        ),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      margin: const EdgeInsets.all(4.0),
                      child: Image.asset('images/01.jpeg'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 10.0,
                          color: Colors.blueGrey,
                        ),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      margin: const EdgeInsets.all(4.0),
                      child: Image.asset('images/02.jpeg'),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 10.0,
                          color: Colors.blueGrey,
                        ),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      margin: const EdgeInsets.all(4.0),
                      child: Image.asset('images/03.jpeg'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 10.0,
                          color: Colors.blueGrey,
                        ),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      margin: const EdgeInsets.all(4.0),
                      child: Image.asset('images/04.jpeg'),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 10.0,
                          color: Colors.blueGrey,
                        ),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      margin: const EdgeInsets.all(4.0),
                      child: Image.asset('images/05.jpeg'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 10.0,
                          color: Colors.blueGrey,
                        ),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      margin: const EdgeInsets.all(4.0),
                      child: Image.asset('images/06.jpeg'),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
