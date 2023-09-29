import 'package:flutter/material.dart';
import 'package:practice/Home/home.dart';
import 'package:practice/demo.dart';



/// Creating global Variable
ValueNotifier<int> counterVariable = ValueNotifier(0);


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DemoMainScreen(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  /// local Variable
  int _counter = 0;

 @override
  void initState() {
    super.initState();
  }

  /// through setState
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
   print("rebuild");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),

      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            /// before valueNotifier
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),

            /// after valueNotifier
            ValueListenableBuilder(
                valueListenable:
            counterVariable, builder: (context,counter,child){
                  return Text(counter.toString());
            }),

            TextButton(onPressed:(){
             Navigator.of(context).push(MaterialPageRoute(builder:
                 (context)=> Home(counterValue: counterVariable.value,)));
            },child:const Text('Click')),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: FloatingActionButton(
              onPressed: (){
                counterVariable.value--;
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ),
          Expanded(
            child: FloatingActionButton(
              onPressed: (){
                counterVariable.value++;
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
          Expanded(
            child: FloatingActionButton(
              onPressed: (){
                counterVariable.value=0;
              },
              tooltip: 'Increment',
              child: const Icon(Icons.lock_reset),
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
