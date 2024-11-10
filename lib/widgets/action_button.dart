import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Icon icon;
  final Function() onAction;

  const ActionButton({
    Key? key,
    required this.icon,
    required this.onAction
  }):  super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onAction,
      child: icon,
    );
  }
}