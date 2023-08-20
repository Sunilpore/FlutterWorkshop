import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class HomeWidget extends StatelessWidget {

  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          CircularProgressIndicator(),

          const SizedBox(height: 10,),

          ElevatedButton(
              onPressed: () async {

                final recievePort = ReceivePort();

                await Isolate.spawn(performHeavyTask, recievePort.sendPort);

                recievePort.listen((sum) {
                  print("total_sum: $sum");
                });

                /*int sum = computeHeavyTask(1000000000);
                print("total_sum: $sum");*/
              },
              child: Text('start'))
        ],
      ),
    );
  }

  int computeHeavyTask(int value) {
    print('task started');
    var sum = 0;
    for (var i = 0; i <= value; i++) {
      sum += i;
    }
    print('finished task');
    return sum;
  }


  performHeavyTask(SendPort sendPort) {
    print('task started');
    var sum = 0;
    for (var i = 0; i <= 1000000000; i++) {
      sum += i;
    }
    print('finished task');
    sendPort.send(sum);
  }

}



