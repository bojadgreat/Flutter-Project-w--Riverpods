import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/services/services.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        ),
        home: const RandomState(),
      ),
    );
  }
}

class RandomState extends ConsumerStatefulWidget {
  const RandomState({super.key});

  @override
  ConsumerState<RandomState> createState() => _RandomState();
}

class _RandomState extends ConsumerState<RandomState> {
  @override
  Widget build(BuildContext context) {
    final randomTask = ref.watch(taskProvider);
    return Scaffold(
      appBar: AppBar(title: Text('RandomText'), centerTitle: true),
      body: randomTask.when(
        data:
            (task) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Wrap(
                      spacing: 6.0,
                      runSpacing: 3.0,
                      children: [
                        Text(
                          task,
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () => ref.refresh(taskProvider),
                      child: Text('Refresh'),
                    ),
                  ),
                ],
              ),
            ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
