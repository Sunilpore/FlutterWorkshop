import 'package:flutter/material.dart';

import 'dog.dart';
import 'dog_dao.dart';





var dogDao = new DogDao();
var database;
void main() async{
  database = dogDao.openDb();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //pair programming -- driver, navigator
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'add dog',
      home: Scaffold(
        appBar: AppBar(title: Text('insert dog'),),
        body: AddDogForm(),
      ),
    );
  }
}

class AddDogForm extends StatefulWidget {
  const AddDogForm({Key? key}) : super(key: key);

  @override
  _AddDogFormState createState() => _AddDogFormState();
}


class _AddDogFormState extends State<AddDogForm> {
  int id = 0;
  int age = 0;
  String name = '';
  var idController = TextEditingController();
  var nameController = TextEditingController();
  var ageController = TextEditingController();

  void _addDog() async{
    setState(() {
      id = int.parse(idController.text);
      age = int.parse(ageController.text);
      name = nameController.text;
    });
    var dog = Dog(id:id,name:name,age: age);
    await dogDao.insertDog(dog);
  }
  void _getDogs(){
    dogDao.getDogs();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: idController,
              decoration: InputDecoration(labelText: 'id'),
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'name'),
            ),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'age'),
            ),
            ElevatedButton(onPressed: _addDog, child: Text('add dog'),),
            ElevatedButton(onPressed: _getDogs, child: Text('get dog'),),

          ],
        ),
      ),
    );
  }
}
