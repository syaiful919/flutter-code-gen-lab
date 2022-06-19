library builder;

import 'package:apparatus/src/class_extras_generator.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/info_generator.dart';

Builder infoGeneratorBuilder(BuilderOptions options) =>
    SharedPartBuilder([InfoGenerator()], 'info');

Builder classExtrasGeneratorBuilder(BuilderOptions options) =>
    SharedPartBuilder([ClassExtrasGenerator()], 'class_extras');
