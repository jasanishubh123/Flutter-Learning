import 'dart:async';


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String formatTime(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');
  return "$hours:$minutes:$seconds";
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer',
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

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Stopwatch _stopwatch;
  late Timer _timer;
  late Timer _secondTimer;
  bool timerset = false;
  List<String> logs = [];

  @override
  void initState() {
    _stopwatch = Stopwatch();
    // re-render every 30ms
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if(logs.length==15) {
          dispose();
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void setDurationOfTimer(){
      _secondTimer=Timer.periodic(const Duration(seconds: 20), (timer) {
        timerset = true;
        if (logs.length < 15 && _stopwatch.isRunning) {
          logs.add(formatTime(_stopwatch.elapsedMilliseconds));
        }
        //  add time in list
      });
  }

  void handleStartStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      // _secondTimer.cancel();
    } else {
      _stopwatch.start();
      // setDurationOfTimer();
      if(!timerset) {
        Timer.periodic(const Duration(seconds: 1), (timer) {
          if (_stopwatch.isRunning && logs.length < 15) {
            timerset = true;
            String time = formatTime(_stopwatch.elapsedMilliseconds);
            int second = int.parse(time
                .split(":")
                .last);
            if (second % 20 == 0) {
              logs.add(time);
            }
          }
          // add time in list
        });
      }
    }
    setState(() {}); // re-render the page
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = const AlertDialog(
      title: Text("Message"),
      content: Text("Time Over"),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  showDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Message"),
            content: const Text("Time Over"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"))
            ],
          );
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
      appBar: AppBar(
        title: const Text("Stop Watch"),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(formatTime(_stopwatch.elapsedMilliseconds),
                style: const TextStyle(fontSize: 48.0)),
            (logs.length == 15)
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: const Text("Reset"))
                : ElevatedButton(
                    onPressed: handleStartStop,
                    child: Text(_stopwatch.isRunning ? 'Stop' : 'Start')),
            (logs.length == 15)
                ? DialogWidget(
                    isVisible: true,
                  )
                : DialogWidget(
                    isVisible: false,
                  ),
            SizedBox(
              height: 400,
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: logs.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(logs[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class DialogWidget extends StatefulWidget {
  bool isVisible = false;

  DialogWidget({Key? key, required this.isVisible})
      : super(
          key: key,
        );

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible,
      child: Center(
        child: AlertDialog(
          title: const Text("Message"),
          content: const Text("Time Over"),
          actions: [
            TextButton(
                onPressed: () {
                  widget.isVisible = !widget.isVisible;
                  setState(() {});
                },
                child: const Text("Cancel"))
          ],
        ),
      ),
    );
  }
}
