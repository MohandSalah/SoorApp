import 'package:flutter/material.dart';

class AvoidButton extends StatelessWidget {
  const AvoidButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.visible = true,
  });
  final String text;
  final VoidCallback onPressed;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return visible
        ? GestureDetector(
            onTap: onPressed,
            child: Text(
              text,
              style: theme.textTheme.bodySmall!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
