import 'package:apparatus/annotations.dart';
import 'package:build/build.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

class ClassExtrasGenerator extends GeneratorForAnnotation<ClassExtras> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final buffer = StringBuffer();

    if (element is ClassElement) {
      final name = element.displayName;

      buffer.writeln('extension \$${name} on ${name} {');

      if (element.fields.isNotEmpty) {
        // String details() => '[ClassName] id=$id, name=$name';
        buffer.write('String details() => ');

        final fieldWithValues = element.fields
            .where((field) => field.displayName != 'hashCode')
            .map((field) => '${field.displayName}=\$${field.displayName}');
        buffer.write("'[${name}] ${fieldWithValues.join(', ')}';");
      }

      buffer.writeln('}');
    }

    return buffer.toString();
  }
}
