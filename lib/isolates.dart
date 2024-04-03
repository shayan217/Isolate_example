import 'dart:isolate';
import 'package:flutter/material.dart';

useIsolate() async{
  final ReceivePort receivePort = ReceivePort();
  try{
    await Isolate.spawn(
      runHeavyTaskIWithIsolates, [receivePort.sendPort, 400000000]
    );
  } on Object{
    debugPrint('Isolate field');
    receivePort.close();
  }
  final response = await receivePort.first;
  print('Response: $response');
}

  int runHeavyTaskIWithIsolates(List<dynamic> args){
    SendPort resultPort = args[0];
    int value = 0;
    for (var i = 0; i < args[1]; i++){
      value += i;
    }
    Isolate.exit(resultPort, value);
  }

    int runHeavyTastWithOutIsolates(int count){
      int value = 0;
      for (var i = 0; i < count; i++){
        value += i;
      }
      print(value);
      return value;
 }
  
