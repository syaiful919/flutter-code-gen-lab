// run command: dart run generator/greetings.dart --name=[YOUR_NAME]

import 'dart:io';

void main(List<String> args) async {
  final nameArg = args.firstWhere(
    (arg) => arg.startsWith("--name"),
    orElse: () => "",
  );

  final name = nameArg.replaceAll("--name=", "");

  final buffer = StringBuffer();
  buffer.writeln('Hello $name');

  final contents = buffer.toString();

  await File("greetings.md").writeAsString(contents);
}
