import 'package:flutter/material.dart';

class FridgeView extends StatefulWidget {
  const FridgeView({super.key});

  @override
  State<FridgeView> createState() => _FridgeViewState();
}

class _FridgeViewState extends State<FridgeView> {
  int currentIndex = 0;

  final List<String> flowerImages = [
    'assets/images/flower1.png',
    'assets/images/flower2.png',
  ];

  final List<String> flowerNames = [
    '퍼플 데이지',
    '연분홍 코스모스',
  ];

  final List<String> flowerDescriptions = [
    '보랏빛 데이지가 자라고 있어요.\n이 꽃은 조용한 응원을 담고 있어요. 오후 2시,\n가장 따뜻한 시간에 물을 좋아해요.',
    '연분홍 코스모스가 살랑이며 인사해요.\n가을 바람을 닮은 그리움을 품고 있어요. 해질 무렵, 가장 아름답게 피어난답니다.',
  ];

  final List<int> flowerWaterNeeds = [5, 4];

  void moveFlower(int direction) {
    setState(() {
      currentIndex = (currentIndex + direction).clamp(0, flowerImages.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final int needWater = flowerWaterNeeds[currentIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("내 꽃밭"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(height: 120),
          Text(
            '다 자라려면 ${needWater}L의 물이 더 필요해요.',
            style: const TextStyle(fontSize: 16, fontFamily: '이서윤체'),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(needWater, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Image.asset('assets/images/mull.png', width: 24, height: 24),
              );
            }),
          ),
          const SizedBox(height: 80),

          // 이미지 + 화살표 한 줄에 배치 (정렬 그대로 유지)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (currentIndex > 0)
                IconButton(
                  icon: const Icon(Icons.arrow_left, size: 35),
                  onPressed: () => moveFlower(-1),
                )
              else
                const SizedBox(width: 48), // 오른쪽과 균형 맞춤

              Expanded(
                child: Center(
                  child: Image.asset(
                    flowerImages[currentIndex],
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              if (currentIndex < flowerImages.length - 1)
                IconButton(
                  icon: const Icon(Icons.arrow_right, size: 35),
                  onPressed: () => moveFlower(1),
                )
              else
                const SizedBox(width: 48),
            ],
          ),

          const SizedBox(height: 16),

          // 꽃 이름
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3AC),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              flowerNames[currentIndex],
              style: const TextStyle(fontFamily: '이서윤체', fontSize: 14),
            ),
          ),

          const SizedBox(height: 100),

          // 설명 박스
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey),
            ),
            child: Text(
              flowerDescriptions[currentIndex],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: '이서윤체',
                color: Colors.black,
              ),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
