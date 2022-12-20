import 'package:grinder/grinder.dart';

Future<void> main(List<String> args) => grind(args);

@Task('Run build_runner')
Future<void> generate() async {
  await runAsync('flutter', arguments: [
    'pub',
    'run',
    'build_runner',
    'build',
    '--delete-conflicting-outputs'
  ]);
}
