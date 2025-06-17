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

  String getImageForTotal(int total) {
    if (total >= 2000) {
      return 'assets/images/person2000.png';
    } else if (total >= 1000) {
      return 'assets/images/person1000.png';
    } else if (total >= 500) {
      return 'assets/images/person500.png';
    } else if (total >= 250) {
      return 'assets/images/person250.png';
    } else {
      return 'assets/images/person0.png';
    }
  }

  String getBarImageForTotal(int total) {
    if (total >= 2000) return 'assets/images/bar5.png';
    if (total >= 1500) return 'assets/images/bar4.png';
    if (total >= 1000) return 'assets/images/bar3.png';
    if (total >= 500)  return 'assets/images/bar2.png';
    if (total > 0)     return 'assets/images/bar1.png';
    return 'assets/images/bar1.png'; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 180),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: Image.asset('assets/images/mull.png', width: 20, height: 27),
                  ),                  
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
                  const SizedBox(width: 45),

                  SizedBox(
                    width: 140,
                    height: 230,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        key: ValueKey(getImageForTotal(model.total)),
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.grey),
                        ),
                        child: Image.asset(
                          getImageForTotal(model.total),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                        child: Image.asset(
                          getBarImageForTotal(model.total),
                          key: ValueKey(getBarImageForTotal(model.total)),
                          height: 220,
                        ),
                      ),
                      SizedBox(
                        width: 85,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            '${model.total}ml',
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
                  ],
                ),
              ),               
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      if (model.total >= 2000) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FridgeView()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              '2000ml 이상 마셔야 입장할 수 있어요.',
                              textAlign: TextAlign.center, 
                              style: TextStyle(fontSize: 15),
                            ),
                            backgroundColor: Colors.black,
                            behavior: SnackBarBehavior.floating,
                            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        '내 꽃밭 보러가기',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: '이서윤체',
                          color: model.total >= 2000 ? Colors.blue : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
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
