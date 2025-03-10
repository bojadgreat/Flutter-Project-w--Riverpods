class RandomTask {
  final String taskName;

  RandomTask({required this.taskName});

  factory RandomTask.fromJson(Map<String, dynamic> json) {
    return RandomTask(taskName: json['activity']);
  }
}
