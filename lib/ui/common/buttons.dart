import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool enabled;

  PrimaryButton(
      {required this.onPressed, required this.text, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return _BaseButton(
      onPressed: onPressed,
      text: text,
      enabled: enabled,
      color: Colors.black,
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool enabled;

  SecondaryButton(
      {required this.onPressed, required this.text, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return _BaseButton(
      onPressed: onPressed,
      text: text,
      enabled: enabled,
      color: Colors.white,
    );
  }
}

class DestructiveSecondaryButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool enabled;

  DestructiveSecondaryButton(
          {required this.onPressed, required this.text, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return _BaseButton(
      onPressed: onPressed,
      text: text,
      enabled: enabled,
      color: Colors.red,
    );
  }
}

class _BaseButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool enabled;
  final double fontSize;
  final Color color;
  _BaseButton(
      {required this.onPressed,
      required this.text,
      this.enabled = true,
      this.fontSize = 16,
      required this.color});

  @override
  Widget build(BuildContext context) {
    final Color color;
    if(enabled)
      color = this.color;
    else
      color = this.color.withOpacity(0.4);
    return TextButton(
        child: Text(text, style: TextStyle(fontSize: fontSize, color: color)),
        onPressed: enabled ? onPressed : null);
  }
}
