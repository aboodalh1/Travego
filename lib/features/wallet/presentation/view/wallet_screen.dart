import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/core/utils/shared/styles/colors.dart';
import 'package:travego/core/widgets/custom_progress_indicator/custom_progress_indicator.dart';
import 'package:travego/core/widgets/custom_snack_bar/custom_snack_bar.dart';
import 'package:travego/features/wallet/presentation/view/widgets/my_wallet_screen/my_wallet_screen.dart';
import 'package:travego/features/wallet/repo/wallet_repo_impl.dart';

import '../../../../core/utils/network/remote/service_locator.dart';
import '../../../../core/utils/shared/constant.dart';
import '../manger/wallet_cubit.dart';
import 'create_wallet/create_wallet.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => WalletCubit(getIt.get<WalletRepoImpl>())..getMyWallet(token: token),
  child: BlocConsumer<WalletCubit, WalletState>(
  listener: (context, state) {
    if(state is WalletCreateFailure){
    customSnackBar(context, state.error);
    }
  },
  builder: (context, state) {
    WalletCubit walletCubit= BlocProvider.of<WalletCubit>(context);
    if(state is WalletCreateSuccess){

     return  MyWalletScreen();
    }
    if(state is WalletCreateLoading){
      return CustomProgressIndicator();
    }
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("My wallet"),
      ),
      body: const WalletNotFound(),
      // body: MyWalletScreen(),
    ));
  },
),
);
  }
}

class WalletNotFound extends StatelessWidget {
  const WalletNotFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'You didn\'t have wallet yet!',
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
          const Icon(
            Icons.wallet,
            size: 120,
            color: Colors.grey,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => defaultSecondColor)),
            child: Text(
              'Create my Wallet',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onPressed: () {
              navigateTo(context, CreateWallet());
            },
          ),
        ],
      ),
    );
  }
}
