import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/shared/styles/colors.dart';

import '../../../../core/utils/shared/Widgets/default_button.dart';
import '../../../../core/widgets/circled_form_field/circled_form_field.dart';
import '../../../auth/presentation/views/register_screen.dart';

class CreateWallet extends StatelessWidget {
  CreateWallet({super.key});

  TextEditingController securityCodeController = TextEditingController();
  TextEditingController securityCodeConfController = TextEditingController();
  TextEditingController bankAccount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create wallet'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Form(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormFieldText(
              title: 'Bank Account (optional)',
            ),
            const Gap(6),
            defaultCircleTextField(
              hintText: 'Acc@gmail.com',
              secure: false,
              controller: bankAccount,
              prefix:  Icon(
                Icons.email,
                color: defaultSecondColor,
              ),

              fill: false,
            ),
            const Gap(20),
            const FormFieldText(
              title: 'Security code confirmation',
            ),
            const Gap(6),
            defaultCircleTextField(
              hintText: '********',
              secure: true,
              controller: securityCodeConfController,
              prefix:  Icon(
                Icons.lock,
                color: defaultSecondColor,
              ),
              suffix: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    child: const Icon(Icons.remove_red_eye)),
              ),
              fill: false,
            ),
            const Gap(20),

            const FormFieldText(
              title: 'Security code',
            ),
            const Gap(6),
            defaultCircleTextField(
              hintText: '*******',
              secure: true,
              controller: securityCodeController,
              prefix: Icon(
                Icons.lock,
                color: defaultSecondColor,
              ),
              suffix: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    child: const Icon(Icons.remove_red_eye)),
              ),
              fill: false,
            ),
            const Gap(25),
            SizedBox(
              height: 50,
              child: DefaultElevated(
                onPressed: () {
                  },
                label: "Create Wallet",
                fill: true,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
