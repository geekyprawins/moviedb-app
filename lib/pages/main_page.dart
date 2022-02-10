import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MainPage extends ConsumerWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      backgroundColor: Colors.greenAccent,
    );
  }
}
