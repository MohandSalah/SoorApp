import 'package:flutter/material.dart';

class SwipeNextButtonWidget extends StatelessWidget {
  const SwipeNextButtonWidget({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  final String Function() buttonText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, //todo: Add White color to theme_data
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: const Size(380, 50),
      ),
      child: Text(buttonText()),
    );
  }
}
