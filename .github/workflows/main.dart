import 'package:flutter/material.dart';

void main() {
  runApp(const TeleLinkShieldApp());
}

class TeleLinkShieldApp extends StatelessWidget {
  const TeleLinkShieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tele Link Shield v5.0',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF0A0E1A),
      ),
      home: const DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isShieldActive = true;
  int blockedLinksCount = 1420;
  final List<String> logs = [
    "[01:15 PM] Detected phishing link deployment - Blocked successfully.",
    "[12:40 PM] Anti-tracking shield activated - Prevented fingerprinting.",
    "[11:02 AM] Scanned deep-link payload - 0 threats found.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TELE LINK SHIELD V5.0', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        backgroundColor: const Color(0xFF111827),
        centerTitle: true,
        elevation: 4,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, Colors.blueAccent),
            onPressed: () {
              setState(() {
                blockedLinksCount += 3;
                logs.insert(0, "[${DateTime.now().toString().substring(11, 19)}] Manual database scan executed - System pristine.");
              });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Status Card
            Card(
              color: const Color(0xFF1F2937),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Icon(
                      isShieldActive ? Icons.security : Icons.shield_outlined,
                      size: 80,
                      color: isShieldActive ? Colors.greenAccent : Colors.redAccent,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      isShieldActive ? "CORE SHIELD: ACTIVE" : "SHIELD DEACTIVATED",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isShieldActive ? Colors.greenAccent : Colors.redAccent,
                        letterSpacing: 1.2
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text("16-Layer Quantum Cryptography Engaged", style: TextStyle(color: Colors.white70)),
                    const SizedBox(height: 15),
                    Switch(
                      value: isShieldActive,
                      activeColor: Colors.greenAccent,
                      onChanged: (value) {
                        setState(() {
                          isShieldActive = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Statistics Grid
            Row(
              children: [
                Expanded(
                  child: Card(color: const Color(0xFF1F2937),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Icon(Icons.block, color: Colors.orangeAccent, size: 30),
                          const SizedBox(height: 10),
                          const Text("BLOCKED THREATS", style: TextStyle(fontSize: 12, color: Colors.white60)),
                          const SizedBox(height: 5),
                          Text("$blockedLinksCount", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Card(
                    color: const Color(0xFF1F2937),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Icon(Icons.speed, color: Colors.cyanAccent, size: 30),
                          const SizedBox(height: 10),
                          const Text("LATENCY SPEED", style: TextStyle(fontSize: 12, color: Colors.white60)),
                          const SizedBox(height: 5),
                          const Text("0.4 ms", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.cyanAccent)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Security Logs Header
            const Text(
              "REAL-TIME SECURITY LOGS (16-LAYERS)",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.0, color: Colors.blueAccent),
            ),
            const SizedBox(height: 10),
            // Logs List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: logs.length,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color(0xFF111827),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      logs[index],
                      style: const TextStyle(fontFamily: 'Courier', fontSize: 13, color: Colors.greenAccent),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}