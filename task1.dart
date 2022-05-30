import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: PreferredSize(
            preferredSize:
                const Size.fromHeight(50.0), // here the desired height
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.refresh,
                    color: Colors.black,
                  ),
                )
              ],
            )),
        body: body(context));
  }

  Widget body(BuildContext context) {
    return (SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          profileSection(),
          contactSection(),
          insightSection(),
          listSection(),
          logoutSection()
        ],
      ),
    ));
  }

  Widget profileSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 10),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: 130,
                    height: 155,
                    margin: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.asset(
                        "assets/shubhamImage.jpeg",
                        width: 150,
                        height: 175,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 40,
                      width: 100,
                      child: Card(
                        elevation: 5,
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Text("Shubham",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54)),
                            )),
                      )),
                ],
              ),
            ],
          ),
        ),
        Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () => {},
                style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrange.shade200,
                    fixedSize: const Size(60, 45)),
                child: Column(
                  children: const [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 13,
                      ),
                    ),
                    Text(
                      "Follow",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 10),
                child: Column(
                  children: const [
                    Text(
                      "104",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                    Text(
                      "Design Posted",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Column(
                  children: const [
                    Text("12",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54)),
                    Text(
                      "Board Created",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              )
            ],
          )
        ]),
      ],
    );
  }

  Widget contactSection() {
    return (Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 10),
          child: Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          child: Icon(
                            Icons.phone,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 11,
                        child: SizedBox(
                          child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "7405272851",
                                style: TextStyle(color: Colors.black54),
                              )),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          child: Icon(Icons.email, color: Colors.black54),
                        ),
                      ),
                      Expanded(
                        flex: 11,
                        child: SizedBox(
                          child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "jasanishubh@gmail.com",
                                style: TextStyle(color: Colors.black54),
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        )
      ],
    ));
  }

  Widget insightSection() {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(18.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
          child: Column(
            children: const [
              Text("\$2084",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
              Text(
                "Balance",
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        )),
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(18.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
          child: Column(
            children: const [
              Text("14",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
              Text(
                "Order",
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        )),
      ],
    ));
  }

  Widget listSection() {
    return (SizedBox(
      height: 275,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: const <Widget>[
          ListTile(
              title: Text("Your Favorites"),
              leading: Icon(
                CupertinoIcons.heart_fill,
                color: Colors.deepOrangeAccent,
                size: 24.0,
              )),
          ListTile(
              title: Text("Payment"),
              leading: Icon(
                CupertinoIcons.creditcard,
                color: Colors.deepOrangeAccent,
                size: 24.0,
              )),
          ListTile(
              title: Text("Referral code"),
              leading: Icon(
                Icons.share_outlined,
                color: Colors.deepOrangeAccent,
                size: 24.0,
              )),
          ListTile(
              title: Text("Promotions"),
              leading: Icon(
                Icons.percent,
                color: Colors.deepOrangeAccent,
                size: 24.0,
              )),
          ListTile(
              title: Text("Settings"),
              leading: Icon(
                Icons.settings,
                color: Colors.deepOrangeAccent,
                size: 24.0,
              )),
        ],
      ),
    ));
  }

  Widget logoutSection() {
    return (Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          border:
              Border(top: const BorderSide(width: 1, color: Colors.black12))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Icon(Icons.logout, color: Colors.red),
            ),
          ),
          Expanded(
            flex: 11,
            child: SizedBox(
              child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Logout",
                  )),
            ),
          )
        ],
      ),
    ));
  }
}
