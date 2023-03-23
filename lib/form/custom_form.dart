

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class CustomFormWidget extends StatefulWidget {

  const CustomFormWidget({Key? key}) : super(key: key);

  @override
  State<CustomFormWidget> createState() => _CustomFormWidgetState();


}

class _CustomFormWidgetState extends State<CustomFormWidget> {

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if(_formkey.currentState!.validate()){
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Processing Data')));
                }
              },
              child: const Text('Submit'),
            ),
            )
          ],
        ));
  }
}
