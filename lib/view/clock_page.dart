import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockPage extends StatelessWidget {
  const ClockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: StreamBuilder<DateTime>(
          stream: getTime(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            final now = snapshot.data!;
            final seconds = now.second;
            final minutes = now.minute;
            final hours = now.hour;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Stack(
                        children: [
                          for (int i = 1; i <= 12; i++)
                            Transform.rotate(
                              angle: (pi / 6) * i,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Transform.rotate(
                                  angle: -(pi / 6) * i,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      '$i',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: [3, 6, 9, 12].contains(i)
                                            ? Colors.red
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Transform.rotate(
                        angle: pi / 6 * (hours % 12) + (pi / 360) * minutes,
                        child: Container(
                          width: 8,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(bottom: 60),
                        ),
                      ),
                      Transform.rotate(
                        angle: pi / 30 * minutes,
                        child: Container(
                          width: 4,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(bottom: 80),
                        ),
                      ),
                      Transform.rotate(
                        angle: pi / 30 * seconds,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 100),
                          width: 2,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Stream<DateTime> getTime() async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    yield DateTime.now();
  }
}
