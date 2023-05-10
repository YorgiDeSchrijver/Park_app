import 'package:flutter/material.dart';

class profileOption extends StatelessWidget {
  final Icon icon;
  final String headText;
  final String subText;
  final Function()? onTap;

  const profileOption({super.key, required this.icon, required this.onTap, required this.headText, required this.subText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headText,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    subText,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.7
                      ,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
