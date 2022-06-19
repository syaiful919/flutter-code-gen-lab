import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class InfoGenerator extends Generator {
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
    final buffer = StringBuffer();

    buffer.writeln('// TopLevelVariableElement');
    buffer.writeln();

    library.allElements.whereType<TopLevelVariableElement>().forEach((element) {
      buffer.write('// ${element.name} | ');
      buffer.write('${element.type} | ');
      buffer.writeln('isConst: ${element.isConst}');
    });

    buffer.writeln();
    buffer.writeln('// ClassElement');
    buffer.writeln();

    library.allElements.whereType<ClassElement>().forEach((element) {
      buffer.write('// ${element.name} | ');
      buffer.writeln('${element.fields}');
    });

    return buffer.toString();
  }
}
