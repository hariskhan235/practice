import 'package:flutter/material.dart';
import 'package:practice/BottomNavigationBar/First/first.dart';
import 'package:practice/BottomNavigationBar/Second/second.dart';
import 'package:practice/BottomNavigationBar/Third/third.dart';


///Using ValueNotifier
ValueNotifier<int> currentIndex = ValueNotifier(0);


class DemoMainScreen extends StatefulWidget {
  const DemoMainScreen({Key? key}) : super(key: key);

  @override
  State<DemoMainScreen> createState() => _DemoMainScreenState();
}

class _DemoMainScreenState extends State<DemoMainScreen> {
  /// Before valueNotifier
  // int currentIndex = 0;
 final List<Widget> pages = [
    First(),
    Second(),
    Third(),
  ];


 /// before ValueNotifier
 // onItemTap(int index){
 //   setState(() {
 //     currentIndex=index;
 //   });
 //   print(currentIndex);
 // }

 /// after ValueNotifier
 onItemTap(index){
   currentIndex.value=index;
 }

  @override
  Widget build(BuildContext context) {
   print("rebuild");
    return ValueListenableBuilder(valueListenable: currentIndex,
      builder: (context,state,child) {
        return Scaffold(

          /// before ValueNotifier
          body: pages[state],
          bottomNavigationBar:
          BottomNavigationBar(
            /// before ValueNotifier
            currentIndex: state,
            onTap: onItemTap,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label:
                'Cart'),
                BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
          ],),
        );
      }
    );
  }
}
