
import 'package:flutter/material.dart';

import '../../../../../core/utils/shared/components/components.dart';
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
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('543543'),
        )
      ],
    );
  }
}
