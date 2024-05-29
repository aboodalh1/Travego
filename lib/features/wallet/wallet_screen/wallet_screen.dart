import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/core/utils/shared/styles/colors.dart';
import 'package:travego/features/wallet/wallet_screen/create_wallet/create_wallet.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("My wallet"),
      ),
      body: const WalletNotFound(),
      // body: MyWalletScreen(),
    ));
  }
}

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      child: Text('Charge more',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                              fontSize: ScreenSizeUtil.screenWidth * 0.06,
                              fontWeight: FontWeight.w700)),
                    ),
                    const Gap(20),
                    Icon(Icons.credit_card,size: 35,color: Colors.white,)
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
                                  'For what al Df3a',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge,
                                ),
                                const Gap(15),
                                Row(
                                  children: [
                                    Text(
                                      'Date al Df3a',
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
    ]);
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
