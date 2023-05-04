import 'package:flutter/material.dart';

class profileOptionTop extends StatelessWidget {
  final String headText;
  final String subText;

  const profileOptionTop({super.key, required this.headText, required this.subText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headText,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subText,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey.shade200,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 1,
                    blurRadius: 24,
                    offset: Offset(0, 8),
                  )
                ],
              ),
              child: Image.asset(
                'lib/images/logo.png',
                height: 60,
              ),
            ),
          ],
        ),
    );
  }
}
