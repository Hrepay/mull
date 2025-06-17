import 'package:flutter/material.dart';

class FridgeView extends StatefulWidget {
  const FridgeView({super.key});

  @override
  State<FridgeView> createState() => _FridgeViewState();
}

class _FridgeViewState extends State<FridgeView> {
  int totalWater = 10; // L
  final int waterPerPetal = 2;

  final List<String> flowerImages = [
    'assets/images/flower1.png',
    'assets/images/flower2.png',
  ];

  final List<String> flowerDescriptions = [
    '데이지가 자라고 있어요. 데이지의 꽃말은 영원한 사랑이에요. 데이지는 오후 2시에 물먹는 걸 좋아해요.',
    '튤립은 햇살을 좋아해요. 튤립은 아침 9시에 물주면 좋아요.',
  ];

  int currentIndex = 0;

  void waterPlant() {
    if (totalWater >= waterPerPetal) {
      setState(() {
        totalWater -= waterPerPetal;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int petalsLeft = totalWater ~/ waterPerPetal;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("내텃밭")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.white,
              child: Text('새로운 잎이 나려면 $totalWater L의 물이 필요해요.'),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Opacity(
                  opacity: index < petalsLeft ? 1.0 : 0.2,
                  child: Image.asset('assets/images/petal.png', width: 32),
                );
              }),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onHorizontalDragEnd: (details) {
                setState(() {
                  if (details.primaryVelocity! < 0 && currentIndex < flowerImages.length - 1) {
                    currentIndex++;
                  } else if (details.primaryVelocity! > 0 && currentIndex > 0) {
                    currentIndex--;
                  }
                });
              },
              child: Column(
                children: [
                  Image.asset(flowerImages[currentIndex], height: 320),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.pink.shade50,
              child: Text(
                flowerDescriptions[currentIndex],
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: waterPlant,
              child: const Text("물 주기"),
            ),
          ],
        ),
      ),
    );
  }
}
