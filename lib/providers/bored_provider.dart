import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_project/models/bored_task.dart';

part 'bored_provider.g.dart';

List<BoredTask> allTasks = [
  BoredTask(activity: 'Learn Flutter'),
  BoredTask(activity: 'Learn Riverpod'),
  BoredTask(activity: 'Learn Provider'),
  BoredTask(activity: 'Learn State Management'),
  BoredTask(activity: 'Learn Flutter Testing'),
  BoredTask(activity: 'Learn Flutter Animations'),
  BoredTask(activity: 'Learn Flutter Web'),
  BoredTask(activity: 'Learn Flutter Desktop'),
  BoredTask(activity: 'Learn Flutter Mobile'),
  BoredTask(activity: 'Learn Flutter Plugins'),
  BoredTask(activity: 'Learn Flutter Packages'),
  BoredTask(activity: 'Learn Flutter Widgets'),
];

@riverpod
List<BoredTask> tasks(ref) {
  return allTasks;
}
