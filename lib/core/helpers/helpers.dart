import 'package:flutter/material.dart';

mixin Helpers {
  void showSnackBar({
    required BuildContext context,
    required String message,
    bool error = false,
    bool hideAction = false,
    int durationInSeconds = 2,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message),
          backgroundColor: error ? Colors.red : Colors.green,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: durationInSeconds),
          dismissDirection: DismissDirection.horizontal,
          action: hideAction
              ? SnackBarAction(
                  label: 'Hide',
                  textColor: Colors.black,
                  onPressed: () {
                    // Some code to undo the change.
                  },
                )
              : null),
    );
  }
}
