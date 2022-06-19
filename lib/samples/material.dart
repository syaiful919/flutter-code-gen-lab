import 'package:apparatus/annotations.dart';

part 'material.g.dart';

const myString = 'Lorem';
final myInt = 12;
final myDouble = 2.5;
var myBool = false;
final myList = [2];
final myMap = {'a': 'b'};
final mySet = {'a', 'b'}; // Set()..add('a')..add('b')
final mySymbol = #g; // Symbol('g')

void myFunction = () {
  print('Hello');
};

@ClassExtras()
class User {
  final String name;
  final int age;

  const User(this.name, this.age);

  @override
  String toString() => details();
}

@ClassExtras()
class Pokemon {
  final String name;
  final String type;

  const Pokemon(this.name, this.type);

  @override
  String toString() => details();
}
