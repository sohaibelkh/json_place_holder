import 'package:flutter/material.dart';

class UserFailureWidget extends StatelessWidget {
  const UserFailureWidget(
      {super.key, required this.message, required this.onRetry});

  final String message;
  final void Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: const TextStyle(fontSize: 18),
        ),
       const SizedBox(height: 8),
        Center(
          child: ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry again'),
          ),
        ),
      ],
    );
  }
}
