import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/core/utils/network/remote/service_locator.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/features/wallet/repo/wallet_repo_impl.dart';

import '../../../../../../core/utils/screen_size_util.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/constant.dart';
import '../../../manger/wallet_cubit.dart';
import '../../charge_wallet/charge_wallet.dart';


class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({
    super.key,
    required this.walletCubit
  });
  final WalletCubit walletCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => WalletCubit(getIt.get<WalletRepoImpl>()),
  child: BlocConsumer<WalletCubit, WalletState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: (){
        showDialog(context: context, builder: (context)=>SizedBox(
          width: ScreenSizeUtil.screenWidth*0.8,
          height:ScreenSizeUtil.screenHeight*0.4 ,
          child:  AlertDialog(
            title: const Text('Do you want to delete your wallet?!'),
            actions: [
              DefaultElevated(label: "Yes", fill: true, onPressed: (){
               walletCubit.deleteMyWallet(token: token);
               Navigator.pop(context);
              }),
              DefaultElevated(label: "No", fill: true, onPressed: (){
                Navigator.pop(context);
              })
            ],
          ),
        ));
      }, icon: const Icon(Icons.delete))],),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Card(
                elevation: 20,
                shadowColor: Colors.black45,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text('Your Balance',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              fontSize: ScreenSizeUtil.screenWidth * 0.06,
                              fontWeight: FontWeight.w700)),
                      const Gap(20),
                      Text(
                        '100 \$',
                        style: GoogleFonts.inter(
                            fontSize: 25, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 20,
                shadowColor: Colors.black45,
                color: defaultColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          navigateTo(context, ChargeWallet());
                        },
                        child: Text('Charge more',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: ScreenSizeUtil.screenWidth * 0.06,
                                fontWeight: FontWeight.w700)),
                      ),
                      const Gap(20),
                      const Icon(Icons.credit_card,size: 35,color: Colors.white,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 20,
              margin: const EdgeInsetsDirectional.symmetric(
                  vertical: 10, horizontal: 20),
              shadowColor: Colors.black45,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      'Your lasts payments',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const Gap(20),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Payment num #',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                  ),
                                  const Gap(15),
                                  Row(
                                    children: [
                                      Text(
                                        '2024-06-08',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                      const Spacer(),
                                      Text(
                                        '500 \$',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.grey,
                            );
                          },
                          itemCount: 10),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  },
),
);
  }
}
