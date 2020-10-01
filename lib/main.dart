import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'calculate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bandwith'),
          centerTitle: true,
        ),
        body: Content(),
      ),
    );
  }
}

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  var todayGb = Calculate().getGbOfToday();
  var gbUsed = 0;
  var todayPercent = Calculate().getPercentOfToday();
  var percentUsed = 0;
  var absValueGbRemained = 0;
  var remainedGb = 0;

  Widget allowence(int context) {
    Widget child;
    if (context >= 0) {
      child = Text(
        'You used $percentUsed% of your allowence and you still have $remainedGb Gb to use.',
        style: TextStyle(fontSize: 20),
      );
    } else {
      var absValueGbRemained = remainedGb.abs();
      child = Text(
        'You used $percentUsed% of your overall allowence and you overused $absValueGbRemained Gb.',
        style: TextStyle(fontSize: 20),
      );
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            '$todayGb Gb should be used today \n $todayPercent% of your allowence',
            style: TextStyle(fontSize: 20),
          ),
          TextField(
            onChanged: (String userInput) {
              setState(
                () {
                  gbUsed = int.parse(userInput);
                  percentUsed = gbUsed ~/ 2;
                  remainedGb = Calculate().getGbremained(gbUsed);
                },
              );
            },
            decoration: InputDecoration(
              hintText: 'your internet consumption',
              hintStyle: TextStyle(fontSize: 20),
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly
            ], // Only numbers can be entered
          ),
          allowence(remainedGb),
        ],
      ),
    );
  }
}
