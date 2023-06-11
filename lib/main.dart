import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chapter_9 AnimatedSwitcher Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimatedSwitcherCounterRoute(),
    );
  }
}

class AnimatedSwitcherCounterRoute extends StatefulWidget {
   const AnimatedSwitcherCounterRoute({Key?key}) : super(key: key);

   @override
   // ignore: library_private_types_in_public_api
   _AnimatedSwitcherCounterRouteState createState() => _AnimatedSwitcherCounterRouteState();
 }

 class _AnimatedSwitcherCounterRouteState extends State<AnimatedSwitcherCounterRoute> {
   int _count = 0;

   @override
   Widget build(BuildContext context) {
     return Center(
      
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Text(
              'This is the chapter_9 AnimatedSwitcher:',
              style: Theme.of(context).textTheme.headline4,
            ),
           AnimatedSwitcher(
             duration: const Duration(milliseconds: 500),
             transitionBuilder: (Widget child, Animation<double> animation) {
               //执行缩放动画
               return ScaleTransition(scale: animation, child: child);
             },
             child: Text(
               '$_count',
               //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
               key: ValueKey<int>(_count),
               style: Theme.of(context).textTheme.headline4,
             ),
           ),
           ElevatedButton(
             child: const Text('+1',),
             onPressed: () {
               setState(() {
                 _count += 1;
               });
             },
           ),
         ],
       ),
     );
   }
 }