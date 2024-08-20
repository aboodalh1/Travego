import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/network/remote/service_locator.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/core/widgets/circled_form_field/circled_form_field.dart';
import 'package:travego/core/widgets/custom_snack_bar/custom_snack_bar.dart';
import 'package:travego/features/wallet/repo/wallet_repo_impl.dart';
import 'package:travego/translations/locale_keys.g.dart';

import '../../../../../core/utils/shared/constant.dart';
import '../../manger/wallet_cubit.dart';

class ChargeWallet extends StatelessWidget {
  const ChargeWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletCubit(getIt.get<WalletRepoImpl>()),
      child: BlocConsumer<WalletCubit, WalletState>(
        listener: (context, state) {
          if(state is AddMoneyToWalletFailure) {
            customSnackBar(context, state.error);
          if(state is AddMoneyToWalletLoading){
            showToast(text: 'Loading', state: ToastStates.SUCCESS);
          }
          }
        },
        builder: (context, state) {
          WalletCubit walletCubit = BlocProvider.of<WalletCubit>(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter your charge code",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const Gap(20),
                  defaultCircleTextField(
                    hintText: 'Code',
                    controller: walletCubit.chargeCodeController,
                    fill: false,
                    secure: walletCubit.passCodeIsSecure,
                    suffix: IconButton(
                      icon: walletCubit.passwordCodeSecureIcon,
                      onPressed: (){walletCubit.passCodeChangeSecure();},
                    ),
                  ),
                  const Gap(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: DefaultElevated(
                        label: LocaleKeys.confirm.tr(),
                        fill: false,
                        onPressed: () {
                          walletCubit.addMoneyToWallet(token: token, code: walletCubit.chargeCodeController.text);
                        }),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
