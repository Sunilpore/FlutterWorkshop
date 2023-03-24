import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




class BatteryUIPage extends StatefulWidget {

  static const platform = MethodChannel('samples.flutter.dev/battery');
  String _batteryLevel = 'Unknown battery level.';


  @override
  State<BatteryUIPage> createState() => _BatteryUIPageState();
}

class _BatteryUIPageState extends State<BatteryUIPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
              print("battery l1");
              _getBatteryLevel();
              },
              child: const Text('Get Battery Level'),
            ),
            Text(widget._batteryLevel),
          ],
        ),
      ),
    );;
  }


  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    print("battery l2");
    try {
      final int result = await BatteryUIPage.platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
      print("battery l3");
    } catch (e) {
      batteryLevel = "Failed to get battery level: '${e.toString()}'.";
      print("battery l4");
    }

    setState(() {
      print("battery l5");
      widget._batteryLevel = batteryLevel;
    });
  }

}
