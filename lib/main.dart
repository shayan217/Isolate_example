import 'package:flutter/material.dart';
import 'package:isolates/isolates.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 50,),
            ElevatedButton(
              onPressed: () => runHeavyTastWithOutIsolates(400000000),
              // onPressed: () => useIsolate,
              child: Text('Run Heavy Task with Isolates'),
            )
          ],
        ),
      ),
      ),
    );
  }
}

