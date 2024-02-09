import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ActionButton extends HookWidget {
  const ActionButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
  });
  final AsyncCallback onPressed;
  final String label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
