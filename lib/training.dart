import 'package:flutter/material.dart';

// Точка входа приложения
void main() => runApp(const MyApp());

// Основной виджет приложения
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

// Главный экран с навигацией по вкладкам
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Список страниц - можно расширять и заменять
  final List<Widget> _pages = const [
    LearningTab(),
    KnowledgeBasePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Обновляем индекс выбранной вкладки
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],  // Показываем выбранную страницу
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Текущий активный индекс
        onTap: _onItemTapped,         // Обработчик нажатия
        backgroundColor: const Color(0xFF23272A),
        selectedItemColor: const Color.fromARGB(255, 190, 94, 214),
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Обучение',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'База знаний',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}

// Ваша реализация вкладки "Обучение"
class LearningTab extends StatelessWidget {
  const LearningTab({super.key});
  
  final List<Course> courses = const [
    Course(
      title: 'Python для начинающих',
      description: 'Основы Python, синтаксис, переменные.',
      progress: 0.4,
    ),
    Course(
      title: 'JavaScript',
      description: 'Изучение JS с нуля до продвинутого уровня.',
      progress: 0.7,
    ),
    Course(
      title: 'SQL и базы данных',
      description: 'Работа с базами данных, запросы SQL.',
      progress: 0.15,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Обучение'),
        backgroundColor: const Color.fromARGB(255, 124, 37, 164),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                course.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(course.description),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: course.progress,
                    backgroundColor: Colors.grey[300],
                    color: const Color.fromARGB(255, 190, 94, 214),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${(course.progress * 100).toInt()}% завершено',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 190, 94, 214),
                    ),
                  ),
                ],
              ),
              onTap: () {
                // Можно добавить переход на страницу курса
              },
            ),
          );
        },
      ),
    );
  }
}

// Класс курса
class Course {
  final String title;
  final String description;
  final double progress;

  const Course({
    required this.title,
    required this.description,
    required this.progress,
  });
}

// Заглушка для базы знаний
class KnowledgeBasePage extends StatelessWidget {
  const KnowledgeBasePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('База знаний'),
        backgroundColor: const Color.fromARGB(255, 124, 37, 164),
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

// Заглушка для профиля
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        backgroundColor: const Color.fromARGB(255, 124, 37, 164),
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
