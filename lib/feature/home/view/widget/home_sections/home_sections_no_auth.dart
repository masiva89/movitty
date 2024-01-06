import 'package:flutter/material.dart';
import 'package:movitty/product/utility/constants/decoration/index.dart';
import 'package:movitty/product/widget/button/index.dart';
import 'package:movitty/product/widget/padding/project_padding.dart';

class HomeSectionNoAuth extends StatelessWidget {
  const HomeSectionNoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.allMedium(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Sana özel içerikleri ve dizi/film önerilerini görmek için giriş yapman gerekiyor.',
            textAlign: TextAlign.center,
            style: TextStyles.subtitle1(context),
          ),
          ProjectSpacer.largeHeight(context),
          NormalButton(
            isPrimary: false,
            title: 'Hemen Giriş Yap',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
