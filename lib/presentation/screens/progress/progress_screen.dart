import 'package:flutter/material.dart';

class ProgresScreen extends StatelessWidget {
  static const String name = 'progress_screen';

  const ProgresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress indicators'),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text('Circular progress indicator'),
          const SizedBox(
            height: 10,
          ),
          const CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black12,
          ),
          const Divider(
            thickness: 1,
            height: 40,
            indent: 10,
            endIndent: 10,
          ),
          const Text('Circular and linear indicator '),
          const SizedBox(
            height: 10,
          ),
          _ControlledProgressIndicator(),
          const Divider(
            thickness: 1,
            height: 40,
            indent: 10,
            endIndent: 10,
          ),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100;
        }).takeWhile((value) => value < 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: Colors.black12,
                    value: progressValue,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: progressValue,
                    ),
                  ),
                ],
              ));
        });
  }
}
