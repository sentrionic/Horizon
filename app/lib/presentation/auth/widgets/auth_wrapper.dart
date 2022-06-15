import 'package:flutter/material.dart';
import 'package:horizon/presentation/common/widgets/title_bar.dart';
import 'package:horizon/presentation/common/widgets/widget_sizes.dart';

class AuthWrapper extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  const AuthWrapper({
    Key? key,
    required this.child,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TitleBar(),
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            width: width,
            height: height,
            child: child,
          ),
        ),
        const SizedBox(
          height: titleBarHeight,
        ),
      ],
    );
  }
}
