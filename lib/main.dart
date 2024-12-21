import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int remainingSeconds = 0;

  @override
  void initState() {
    super.initState();

    // タイマーの終了時刻を設定
    final lastTime = DateTime(2027, 12, 20, 17, 20);
    _calculateRemainingTime(lastTime);

    // 1秒ごとに残り時間を更新
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _calculateRemainingTime(lastTime);
      if (remainingSeconds <= 0) {
        timer.cancel(); // 残り時間が0になったらタイマーを停止
      }
    });
  }

  void _calculateRemainingTime(DateTime lastTime) {
    final now = DateTime.now();
    setState(() {
      remainingSeconds = lastTime.difference(now).inSeconds;
    });
  }

  String _formatRemainingTime(int seconds) {
    if (seconds <= 0) return "00:00:00"; // 残り時間が0の場合

    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final secs = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            '残り時間',
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Text(
            _formatRemainingTime(remainingSeconds),
            style: const TextStyle(
              fontSize: 59,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      backgroundColor: Colors.red,
      ),
    );
  }
}