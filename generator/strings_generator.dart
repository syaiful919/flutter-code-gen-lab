// run command: dart run generator/strings_generator.dart --lang=[id/en]

import 'dart:convert';
import 'dart:io';

void main(List<String> args) async {
  stdout.writeln("generate strings started ...");

  final langArg = args.firstWhere(
    (arg) => arg.startsWith("--lang"),
    orElse: () => "",
  );

  final lang = langArg.isEmpty ? "en" : langArg.replaceAll("--lang=", "");

  final String resourcePath = getResourcePath(lang);

  await generateStrings(resourcePath);
  stdout.writeln("generate strings finished ...");
}

String getResourcePath(String lang) {
  stdout.writeln("lang: $lang");

  switch (lang) {
    case "id":
      return "assets/json/strings_id.json";
    case "en":
    default:
      return "assets/json/strings_en.json";
  }
}

Future<void> generateStrings(String resourcePath) async {
  stdout.writeln("resource path: $resourcePath");

  final jsonString = File(resourcePath).readAsStringSync();
  final maps = json.decode(jsonString);

  if (maps.isEmpty) {
    stdout.writeln("resource is empty");
    return;
  }

  final buffer = StringBuffer();
  buffer.writeln('// GENERATED FILE\n');

  buffer.writeln('class Strings {');
  buffer.writeln('  const Strings();\n');
  maps.forEach((key, value) {
    buffer.writeln("  String get ${key.toString()} => '$value';");
  });
  buffer.writeln('}\n');

  final contents = buffer.toString();

  final directory = await Directory('lib/resources').create(recursive: true);

  await File("${directory.path}/strings.dart").writeAsString(contents);
}
