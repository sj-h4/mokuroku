import 'package:grinder/grinder.dart';

Future<void> main(List<String> args) => grind(args);

@Task('Run build_runner')
Future<void> generate() async {
  await runAsync('fvm', arguments: [
    'flutter',
    'pub',
    'run',
    'build_runner',
    'build',
    '--delete-conflicting-outputs'
  ]);
}

@Task('Launch on Chrome in debug mode')
Future<void> runChrome() async {
  await runAsync('fvm', arguments: [
    'flutter',
    'run',
    '-d',
    'Chrome',
  ]);
}
