import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/button_widget.dart';
import '../widgets/text_button_widget.dart';
import 'login_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  int countdown = 60;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void startTimer() {
    setState(() {
      countdown = 60;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 20.0, top: 150.0, bottom: 20.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          'التحقق من رقم الهاتف',
                          textAlign: TextAlign.right,
                          style: theme.textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        Text(
                          'قم بإدخال رمز التحقق المرسل إلى',
                          textAlign: TextAlign.right,
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: 100.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              PinCodeTextField(
                                length: 6,
                                keyboardType: TextInputType.number,
                                obscureText: false,
                                animationType: AnimationType.fade,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight: 45,
                                  fieldWidth: 50,
                                  disabledColor: theme.colorScheme.background,
                                  selectedFillColor: theme.colorScheme.surface,
                                  activeColor: theme.colorScheme.surface,
                                  selectedColor: theme.colorScheme.background,
                                  inactiveColor: theme.colorScheme.surface,
                                  inactiveFillColor: theme.colorScheme.surface,
                                  activeFillColor: theme.colorScheme.background,
                                ),
                                animationDuration:
                                    const Duration(milliseconds: 200),
                                backgroundColor: theme.colorScheme.background,
                                enableActiveFill: true,
                                onCompleted: (v) {},
                                onChanged: (value) {
                                  setState(() {});
                                },
                                beforeTextPaste: (text) {
                                  return true;
                                },
                                appContext: context,
                              ),
                              const SizedBox(height: 20.0),
                              const SizedBox(
                                height: 40,
                                width: double.infinity,
                                child: ButtonWidget(
                                  text: 'التأكيد',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButtonWidget(
                                    text: '${countdown}s إعادة الإرسال ',
                                    onPressed: () {
                                      startTimer();
                                    },
                                  ),
                                  TextButtonWidget(
                                    text: 'تعديل رقم الهاتف',
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
