import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class NeuBox extends StatelessWidget {

  final Widget? child;
  const NeuBox({
    super.key,
    required this.child
    });

  @override
  Widget build(BuildContext context) {

    //is dark mode
    bool isdarkMode = Provider.of<ThemeProvider>(context).isdarkMode;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow:  [
          //daker shadow on bottom right
          BoxShadow(
            color:isdarkMode ? Colors.grey.shade800 :  Colors.grey.shade500,
            offset: Offset(4, 4),
            blurRadius: 15,
          ),

          //lighter shadow on top left
          BoxShadow(
            color:isdarkMode ? Colors.grey.shade800 : Colors.white,
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