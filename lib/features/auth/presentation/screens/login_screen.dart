import 'package:flutter/material.dart';

import '../widgets/button_widget.dart';
import '../widgets/text_form_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController controller;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(
          right: 20.0,
          left: 20,
          top: 150.0,
          bottom: 20.0,
        ),
        children: [
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'هلا بك في سور',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'رفيق رحلتك العقارية',
                    style: theme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'قم بإدخال رقم الجوال المسجل في أبشر',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  TextFormFieldWidget(
                    controller: controller,
                  ),
                  const SizedBox(height: 16.0),
                  const ButtonWidget(
                    text: 'أرسل رمز التحقق',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: theme.textTheme.bodyMedium,
              children: [
                const TextSpan(
                  text: 'بالتسجيل أنت توافق على ',
                ),
                TextSpan(
                  text: 'شروط الاستخدام',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                  ),
                ),
                TextSpan(
                  text: ' و ',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                  ),
                ),
                TextSpan(
                    text: 'سياسة الخصوصية',
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                    )),
                const TextSpan(
                  text: ' الخاصة بسور',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
