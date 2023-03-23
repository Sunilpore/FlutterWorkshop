import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dog.dart';




var database;
void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  database = openDatabase(join(await getDatabasesPath(), 'dogdb'),
      version: 1,
      onCreate: (db, version) {
        String sql =
            'CREATE TABLE dogs(id INTEGER PRIMARY KEY,name TEXT,age INTEGER)';
        db.execute(sql);
      });


  createDog(Dog(id:1,name:'dauberman', age: 5));
  readDog();
}
void createDog(Dog dog) async {
  final db = await database;

  String strOne = 'Marvel';
  strOne = strOne+'$strOne';

  db.insert('dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}


Future<List<Dog>> readDog() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query('dogs');
  return List.generate(maps.length, (index) {
    var dog = Dog(id: maps[index]['id'],
        name: maps[index]['name'],
        age: maps[index]['age']);
    print(dog.toString());
    return dog;
  });
}
void updateDog() {}
void deleteDog() {}

//await getDogs();
