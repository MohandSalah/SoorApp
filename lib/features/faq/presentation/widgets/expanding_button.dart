import 'package:flutter/material.dart';

class ExpandingButton extends StatefulWidget {
  const ExpandingButton({super.key, required this.question});
  final Map<String, String> question;

  @override
  State<ExpandingButton> createState() => _ExpandingButtonState();
}

class _ExpandingButtonState extends State<ExpandingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(_controller);

    _controller.value = isExpanded ? 0.5 : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
              if (isExpanded) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            });
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    RotationTransition(
                      turns: _rotationAnimation,
                      child: Icon(
                        Icons.add,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                Expanded(
                  child: Text(
                    widget.question['question']!,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Container(
            padding: const EdgeInsets.all(16.0),
            color: theme.colorScheme.primary,
            child: Text(
              widget.question['answer']!,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        const Divider(),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
