import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '966+');
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF2F2F7),
        prefixText: '966+',
        contentPadding:
            const EdgeInsets.symmetric(vertical: 11.0, horizontal: 10.0),
        enabledBorder: InputBorder.none,
        prefixStyle: const TextStyle(color: Color(0xFF563EBF)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle: const TextStyle(
          color: Color(0xFF3D3A47),
          fontSize: 16,
          fontFamily: 'SF Arabic',
          fontWeight: FontWeight.w400,
          height: 0.07,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
