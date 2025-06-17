import 'package:flutter/material.dart';
import '../models/drink_model.dart';
import '../widgets/water_button.dart';
import '../screens/fridge_view.dart';

class DrinkTrackerScreen extends StatefulWidget {
  const DrinkTrackerScreen({super.key});

  @override
  State<DrinkTrackerScreen> createState() => _DrinkTrackerScreenState();
}

class _DrinkTrackerScreenState extends State<DrinkTrackerScreen> {
  final DrinkModel model = DrinkModel();

  @override
  Widget build(BuildContext context) {
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
                          const Text('오늘의 음수량은 ',
                              style: TextStyle(fontFamily: '이서윤체', fontSize: 20)),
                          SizedBox(
                            width: 65,
                            child: Text('${model.total}ml',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontFamily: '이서윤체', fontSize: 20)),
                          ),
                          const Text(' 입니다.',
                              style: TextStyle(fontFamily: '이서윤체', fontSize: 20)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(width: 60),
                  Image.asset('assets/images/person0.png', height: 280),
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
                          child: Text('${model.total}ml',
                              textAlign: TextAlign.left,
                              style: const TextStyle(fontSize: 14, fontFamily: '이서윤체')),
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
                        style: const TextStyle(
                            fontSize: 14, fontFamily: '이서윤체', color: Colors.black),
                        children: [
                          const TextSpan(text: '오늘 목표 음수량까지 '),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: SizedBox(
                              width: 50,
                              child: Text('${model.remaining}ml',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: '이서윤체',
                                      color: Colors.black)),
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
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var entry in [
                  [250, 'mull250.png'],
                  [500, 'mull500.png'],
                  [1000, 'mull1000.png'],
                  [2000, 'mull2000.png'],
                ])
                  WaterButton(
                    image: 'assets/images/${entry[1]}',
                    label: '${entry[0]}ml',
                    onTap: () {
                      setState(() {
                        model.add(entry[0] as int);
                      });
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
