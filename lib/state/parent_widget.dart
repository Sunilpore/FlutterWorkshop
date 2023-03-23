import 'package:flutter/cupertino.dart';
import 'package:ws_trail/state/tapbox_b.dart';



class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TapboxB(active: _active,onChanged: _handleTapboxChanged,
      ),
    );
  }
}