import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;
  final String title;
  const CustomContainer({
    super.key,
    required this.containerHeight,
    required this.containerWidth,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          alignment: Alignment.centerLeft,
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: containerWidth * 0.08),
            child: Wrap(
              spacing: containerWidth * 0.03,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Image.asset(
                  'assets/companies_asset.png',
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: containerWidth * 0.05,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
