import 'package:flutter/material.dart';

class CategoryHeader extends StatelessWidget {
  final String category;
  final Function()? onClick;
  final bool showMore;

  const CategoryHeader({
    super.key,
    required this.category,
    this.onClick,
    this.showMore = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: GestureDetector(
        onTap: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: category,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                mouseCursor: SystemMouseCursors.click,
              ),
            ),
            if (showMore)
              Text.rich(
                TextSpan(
                  text: "SEE ALL",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                  mouseCursor: SystemMouseCursors.click,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
