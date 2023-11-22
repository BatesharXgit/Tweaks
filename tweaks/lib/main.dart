import 'package:flutter/material.dart';
import 'package:open_settings/open_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tweaks',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    settings.addAll(details);
    super.initState();
  }

  final List<String> settings = [];

  final List<String> details = [
    'Accessibility',
    'App Settings',
    'Wi Fi',
    'Display',
    'Device Info',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Tweaks',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: 12,
                  (BuildContext context, int index) {
                    final category = settings[index];
                    return GestureDetector(
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            details[index],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                      onTap: () {
                        _navigateToSettings(category);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

void _navigateToSettings(String settings) {
  switch (settings) {
    case 'Accessibility':
      OpenSettings.openAccessibilitySetting();
      break;
    case 'App Settings':
      OpenSettings.openAppSetting();
      break;
    case 'Wi Fi':
      OpenSettings.openWIFISetting();
      break;
    case 'Display':
      OpenSettings.openDisplaySetting();
      break;
    case 'Device Info':
      OpenSettings.openDeviceInfoSetting();
      break;
  }
}
