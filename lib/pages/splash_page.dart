import 'package:flutter/material.dart';
import 'package:flutter_router_riverpod/widget/loading_spinner.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('スプラッシュページ'),
            SizedBox(height: 16),
            LoadingSpinner(),
          ],
        ),
      ),
    );
  }
}
