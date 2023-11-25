import 'dart:async';
import 'package:flutter/material.dart';
import 'package:system_info2/system_info2.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double availableMemoryInMB;
  late Timer memoryUpdateTimer;

  @override
  void initState() {
    super.initState();
    availableMemoryInMB = 0.0;
    memoryUpdateTimer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (mounted) {
        updateMemoryInfo();
      }
    });
  }

  Future<void> updateMemoryInfo() async {
    final freePhysicalMemory = SysInfo.getFreePhysicalMemory();
    setState(() {
      availableMemoryInMB = freePhysicalMemory / (1024 * 1024);
    });
  }

  @override
  void dispose() {
    memoryUpdateTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int totalMemoryInBytes = SysInfo.getTotalPhysicalMemory();
    double totalMemoryInGB =
        (totalMemoryInBytes / (1024 * 1024 * 1024)).ceilToDouble();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 29, 29),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                'Memory: $totalMemoryInGB GB',
                style: const TextStyle(color: Colors.blue, fontSize: 34),
              ),
              Text(
                'Available Memory: ${availableMemoryInMB.toStringAsFixed(0)} MB',
                style: const TextStyle(color: Colors.blue, fontSize: 34),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
