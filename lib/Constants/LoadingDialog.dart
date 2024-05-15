import 'package:flutter/material.dart';

class LoadingDialog {
  void start(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent users from dismissing the dialog.
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  void stop(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
