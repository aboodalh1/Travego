
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/shared/components/components.dart';
import '../../../../../model/remote/wallet/transaction_history_model.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../wallet/presentation/view/wallet_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('سفريات'),
      actions: [
        GestureDetector(
          onTap: () {
            navigateTo(context, const WalletScreen());
          },
          child: const Icon(Icons.wallet),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(LocaleKeys.wallet.tr()),
        )
      ],
    );
  }
}
