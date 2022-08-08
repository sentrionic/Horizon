import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final List<Widget> children;
  const BackgroundContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            width: MediaQuery.of(context).size.width / 2,
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                children: children,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
