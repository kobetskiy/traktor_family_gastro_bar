import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(S.of(context).helloWorld),
      ),
    );
  }
}
