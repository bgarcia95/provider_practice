import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      builder: (context) => Data(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.teal,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
            centerTitle: true,
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(),
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(Provider.of<Data>(context).text),
          SizedBox(
            width: 15.0,
          ),
          FlatButton(
            child: Text(Provider.of<Data>(context).text),
            color: Colors.teal,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context, listen: false).text);
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        Provider.of<Data>(context).changeText(newText);
      },
    );
  }
}

class Data extends ChangeNotifier {
  String text = 'Some  data';

  void changeText(String newText) {
    text = newText;
    notifyListeners();
  }
}
