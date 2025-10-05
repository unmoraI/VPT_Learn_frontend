import 'package:flutter/material.dart';
import 'package:test1/home_screen.dart';
import 'package:test1/learning_tab.dart';
import 'theme.dart'; // Импорт класса с цветами

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Навигация снизу',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class KnowledgeBasePage extends StatelessWidget {
  const KnowledgeBasePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('База знаний'),
        backgroundColor: AppColors.secondary,
      ),
      body: const Center(
        child: Text(
          'Раздел База знаний',
          style: TextStyle(fontSize: 24, color: Colors.white70),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        backgroundColor: AppColors.secondary,
      ),
      body: const Center(
        child: Text(
          'Раздел Профиль',
          style: TextStyle(fontSize: 24, color: Colors.white70),
        ),
      ),
    );
  }
}
