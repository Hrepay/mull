import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: DrinkTrackerApp()));
}

// 메인페이지 
class DrinkTrackerApp extends StatelessWidget {
  const DrinkTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 현재까지 마신 음수량 설정
    const int totalDrinkAmount = 1200;
    // 하루 음수 목표량 설정 - 2000ml
    const int goal = 2000;

    // 메인 화면 페이지
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 마셔야하는 ml
                  Image.asset('assets/images/mull.png', width: 20, height: 27),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '물먹은 스펀지님,',
                        style: TextStyle(fontFamily: '이서윤체', fontSize: 20),
                      ),
                      Row(
                        children: [
                          const Text('오늘의 음수량은 ', style: TextStyle(fontFamily: '이서윤체', fontSize: 20)),
                          SizedBox(
                            width: 70,
                            child: Text(
                              '$totalDrinkAmount ml',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontFamily: '이서윤체', fontSize: 20),
                            ),
                          ),
                          const Text(' 입니다.', style: TextStyle(fontFamily: '이서윤체', fontSize: 20)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 60),
              // 동건이 캐릭터 + bar + ml
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(width: 60),
                  Image.asset('assets/images/person.png', height: 280),
                  const SizedBox(width: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset('assets/images/bar.png', height: 260),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 72,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                           // 버튼을 통한 ml 변경 기능 추가 예정
                          child: Text(
                            '$totalDrinkAmount ml',
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 14, fontFamily: '이서윤체'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF7FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(fontSize: 14, fontFamily: '이서윤체', color: Colors.black),
                        children: [
                          // 남은 물 표시 -> 변경 기능 추가 예정
                          const TextSpan(text: '오늘 목표 음수량까지 '),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: SizedBox(
                              width: 50,
                              child: Text(
                                '${goal - totalDrinkAmount}ml',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 14, fontFamily: '이서윤체', color: Colors.black),
                              ),
                            ),
                          ),
                          const TextSpan(text: ' 남았어요.'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FridgeView()),
                  );
                },
                // 내 꽃밭 보러가기 버튼
                child: const Text(
                  '내 꽃밭 보러가기',
                  style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    fontFamily: '이서윤체',
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
          // 각 물병 버튼을 통한 마신 물 양 체크 -> 기능 추가 예정
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _DrinkButton(image: 'assets/images/mull250.png', label: '250ml'),
                _DrinkButton(image: 'assets/images/mull500.png', label: '500ml'),
                _DrinkButton(image: 'assets/images/mull1000.png', label: '1000ml'),
                _DrinkButton(image: 'assets/images/mull2000.png', label: '2000ml'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 하단 물병 이미지 + 물량 라벨
class _DrinkButton extends StatelessWidget {
  final String image;
  final String label;

  const _DrinkButton({
    required this.image,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, width: 60, height: 60),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, fontFamily: '이서윤체')),
      ],
    );
  }
}

// 내 꽃밭 페이지
class FridgeView extends StatelessWidget {
  const FridgeView({super.key});

  @override
  Widget build(BuildContext context) {
    const int totalWater = 8;
    const int waterPerPetal = 8;
    const int petalsLeft = totalWater ~/ waterPerPetal;

    // 내 꽃 종류 -> 슬라이드로 구현 예정
    const List<String> flowerImages = [
      'assets/images/flower1.png',
      'assets/images/flower2.png',
    ];
    // 내 꽃 종류
    const List<String> flowerNames = [
      '퍼플 데이지',
      '튤립',
    ];
    // 꽃 설명
    const List<String> flowerDescriptions = [
      '보랏빛 데이지가 자라고 있어요.\n이 꽃은 조용한 응원을 담고 있어요.오후 2시, 가장 따뜻한 시간에 물을 좋아해요.',
      '튤립은 햇살을 좋아해요. 튤립은 아침 9시에 물주면 좋아요.',
    ];

    const int currentIndex = 0;

    // 내 꽃밭 메인 페이지
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("내 꽃밭"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            // 내 꽃이 자라는데 필요한 물량 체크 - 필요한 물양에 따라 변경 기능 추가 예정
            Text(
              '새로운 잎이 나려면 $totalWater L의 물이 필요해요.',
              style: TextStyle(
                fontFamily: '이서윤체',
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Opacity(
                  opacity: index < petalsLeft ? 1.0 : 0.2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    // 물 이미지로 필요한 물량 체크 - 기능 구현 예정
                    child: Image.asset('assets/images/mull.png', width: 28),
                  ),
                );
              }),
            ),
            const SizedBox(height: 60),
            // 내 꽃밭 이미지
            Image.asset(flowerImages[currentIndex], height: 200),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF5C0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                flowerNames[currentIndex],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: '이서윤체',
                ),
              ),
            ),
            const SizedBox(height: 120),
            // 내 꽃 설명 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                padding: const EdgeInsets.all(12), 
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: Text(
                  flowerDescriptions[currentIndex],
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: '이서윤체',
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
