import 'package:flutter/material.dart';

import '../widgets/expanding_button.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  final List<Map<String, String>> questions = const [
    {
      'question': 'عن تطبيق سور',
      'answer':
          'تطبيق سور هو تطبيق سعودي لعرض العقارات السكنية والغير سكنية سواءًا للبيع أو للإيجار.'
    },
    {
      'question': 'هل تطبيق سور معتمد؟',
      'answer':
          'نعم نحن مسجلون ومعتمدون من وزارة التجارة ومن الهيئة العامة للعقار بسجل تجاري رقم 1010778899'
    },
    {
      'question': 'هل يتطلب اشتراك لنشر الإعلان؟',
      'answer':
          'نعم لابد على المعلن كمسوق عقاري أو صاحب عقار أن يشترك في تطبيق سور قبل نشر الإعلان.'
    },
    {
      'question': 'هل أستطيع ربح مبلغ شهري من خلال العمل على سور؟ ',
      'answer':
          'نعم. إذا اشتركت مع سور سيتم إصدار كود خاص بك تشاركه مع الآخرين ليشتركوا في سور عن طريقك وبالتالي فأنت تحصل على 10 ريال عن كل مشترك يستخدم كودك الخاص للاشتراك (مشترك ذهبي) و 5 ريال عن كل مشترك يستخدم كود خاص لأحد مشتركيك الذهبيين (مشترك فضي).'
    },
    {
      'question': 'متى يتم تحصيل المستحقات من خلال الاشتراكات؟ ',
      'answer':
          'تستطيع تحصيل مستحقاتك بعد 30 يوم من اشتراك المشترك باستخدام كودك الخاص.'
    },
    {
      'question': 'هل استطيع الحصول على خصم؟ ',
      'answer':
          'نعم. تحصل على خصم 50 بالمئة من قيمة اشتراكك للشهر الاول إذا استخدمت كود أحد المشتركين الفعالين مسبقًا. '
    },
    {
      'question': 'كيف استطيع تحويل رصيدي في سور الى حسابي البنكي؟ ',
      'answer':
          'يجب عليك أولاً إضافة حسابك البنكي كمستفيد من خلال حسابك في سور حتى تتمكن بعدها من تحويل أي رصيد مستحق اليه. '
    },
    {
      'question': 'كيف أستطيع التواصل مع إدارة التطبيق؟',
      'answer':
          'تستطيع الاتصال بنا على الرقم 8001247070 أو مراسلاتنا على الواتساب رقم 054444444 '
    },
    {
      'question': 'أين هو مقر إدارة التطبيق؟ ',
      'answer': 'مقرنا هو في حي المرسلات، طريق الملك عبدالله في مدينة الرياض.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            height: 140,
            color: theme.primaryColor,
            padding:
                const EdgeInsets.only(right: 30.0, top: 30.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'الأسئلة الشائعة',
                  style: theme.textTheme.titleLarge,
                ),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 50,
                    height: 45,
                    child: Icon(
                      Icons.arrow_forward,
                      color: theme.colorScheme.secondary,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return ExpandingButton(
                  question: questions[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
