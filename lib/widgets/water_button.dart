import 'package:flutter/material.dart';

class WaterButton extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onTap;

  const WaterButton({
    super.key,
    required this.image,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(image, width: 60, height: 60),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: '이서윤체',
            ),
          ),
        ],
      ),
    );
  }
}
