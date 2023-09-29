
import 'package:flutter/material.dart';
import 'package:practice/main.dart';

class Home extends StatefulWidget {
  int counterValue;
  Home({Key? key,required this.counterValue}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: counterVariable,
              builder: (context,counter,child){
                return Text('$counter');
              },
            ),
            Text(widget.counterValue.toString()),
          ],
        ),
      ),
    );
  }
}
