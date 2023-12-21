import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

class BaseWrapperLoading extends StatelessWidget {
  const BaseWrapperLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: ColorName.backgroundPrimary.withOpacity(0.2),
      ),
      child: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
