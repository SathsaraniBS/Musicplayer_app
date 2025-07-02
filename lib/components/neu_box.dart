import 'package:flutter/material.dart';
class NeuBox extends StatelessWidget {

  final Widget? child;
  const NeuBox({
    super.key,
    required this.child
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow:  [
          //daker shadow on bottom right
          BoxShadow(
            color: Colors.grey.shade500,
            offset: Offset(4, 4),
            blurRadius: 15,
          ),

          //lighter shadow on top left
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 15,
          ),
        ]
    ),
    padding: const EdgeInsets.all(12),
      child: child,
    );
  }
}