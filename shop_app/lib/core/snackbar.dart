import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Snack {
  static snackbar(context, result) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$result!'),
      ),
    );
  }
}
