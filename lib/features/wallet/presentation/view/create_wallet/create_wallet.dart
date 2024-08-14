import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/core/utils/shared/styles/colors.dart';
import 'package:travego/core/widgets/alert_dialog/loading_alert_dialog.dart';
import 'package:travego/features/wallet/repo/wallet_repo_impl.dart';

import '../../../../../core/utils/network/remote/service_locator.dart';
import '../../../../../core/utils/shared/Widgets/default_button.dart';
import '../../../../../core/utils/shared/constant.dart';
import '../../../../../core/widgets/circled_form_field/circled_form_field.dart';
import '../../../../auth/presentation/views/register_screen.dart';
import '../../manger/wallet_cubit.dart';
import '../widgets/my_wallet_screen/my_wallet_screen.dart';


class CreateWallet extends StatelessWidget {
  CreateWallet({super.key});

  TextEditingController securityCodeController = TextEditingController();
  TextEditingController securityCodeConfController = TextEditingController();
  TextEditingController bankAccount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletCubit(getIt.get<WalletRepoImpl>()),
      child: BlocConsumer<WalletCubit, WalletState>(
        listener: (context, state) {
          if(state is WalletCreateLoading){
            showDialog(context: context, builder: (context)=> const LoadingAlertDialog());
          }
          if(state is WalletCreateSuccess){
            if(Navigator.canPop(context)){Navigator.pop(context);}
            navigateTo(context,  MyWalletScreen(walletCubit: BlocProvider.of<WalletCubit>(context),));
          }
          if(state is WalletCreateFailure){
            if(Navigator.canPop(context)){Navigator.pop(context);}

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error.toString())));
          }
        },
        builder: (context, state) {
          WalletCubit walletCubit = BlocProvider.of<WalletCubit>(context);
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
                    prefix: Icon(
                      Icons.email,
                      color: defaultSecondColor,
                    ),

                    fill: false,
                  ),
                  const Gap(20),
                  const FormFieldText(
                    title: 'Security code',
                  ),
                  const Gap(6),
                  defaultCircleTextField(
                    hintText: '********',
                    secure: walletCubit.passwordIsSecure,
                    controller: securityCodeConfController,
                    prefix: Icon(
                      Icons.lock,
                      color: defaultSecondColor,
                    ),
                    suffix: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: walletCubit.passwordChangeSecure,
                          child: walletCubit.passwordSecureIcon,),
                    ),
                    fill: false,
                  ),
                  const Gap(20),

                  const FormFieldText(
                    title: 'Security code confirmation',
                  ),
                  const Gap(6),
                  defaultCircleTextField(
                    hintText: '*******',
                    secure: walletCubit.passConfIsSecure,
                    controller: securityCodeController,
                    prefix: Icon(
                      Icons.lock,
                      color: defaultSecondColor,
                    ),
                    suffix: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: walletCubit.passConfChangeSecure,
                          child: walletCubit.passwordConfSecureIcon,),
                    ),
                    fill: false,
                  ),
                  const Gap(25),
                  SizedBox(
                    height: 50,
                    child: DefaultElevated(
                      onPressed: () {
                        print(token);
                        // walletCubit.deleteMyWallet(token: token);
                        walletCubit.createWallet(token: token,
                            securityCode: securityCodeController.text,
                            confSecurityCode: securityCodeConfController.text,
                            bankAccount: bankAccount.text);
                      },
                      label: "Create Wallet",
                      fill: true,
                    ),
                  ),
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}
