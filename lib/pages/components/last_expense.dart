import 'package:expense/core/constants/constants.dart';
import 'package:flutter/material.dart';

class LastExpenseCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? backgroundColor;

  const LastExpenseCard({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: const Color.fromARGB(255, 232, 234, 245),
              ),
              child: Icon(
                icon,
                color: iconColor ?? Theme.of(context).primaryColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "30 Apr 2022",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "+\$1500",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
