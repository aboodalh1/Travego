
import 'package:flutter/material.dart';

import '../../utils/shared/components/components.dart';

class LoadingAlertDialog extends StatelessWidget {
  const LoadingAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Row(
        children: [
          CircularProgressIndicator(
            color: defaultColor,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text("Loading")
        ],
      ),
    );
  }
}
