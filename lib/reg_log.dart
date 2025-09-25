import 'package:flutter/material.dart';
import 'training.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF23272A),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          width: 380,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              // Логотип
              CircleAvatar(
                radius: 48,
                backgroundColor: Colors.white12,
                child: const Icon(Icons.book, size: 48, color: Colors.white),
              ),
              const SizedBox(height: 14),
              const Text(
                "VPTLearn",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 18),
              // Табы
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: "Create Account"),
                  Tab(text: "Log In"),
                ],
                indicatorColor: Color(0xFF35CFCB),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white54,
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 370,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Регистрация
                    _buildCreateAccount(),
                    // Вход
                    _buildLogin(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCreateAccount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Create Account",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white54),
        ),
        const SizedBox(height: 4),
        const Text(
          "Let's get started by filling out the form below.",
          style: TextStyle(fontSize: 14, color: Colors.white54),
        ),
        const SizedBox(height: 24),
        _buildInputField(label: "Email"),
        const SizedBox(height: 20),
        _buildInputField(label: "Password", isPassword: true),
        const SizedBox(height: 20),
        _buildInputField(label: "Confirm password", isPassword: true),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1D2531),
             padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              ),
                onPressed: () {
                // Переход на страницу обучения
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LearningTab()),
              );
             },
          child: const Text(
         "Get Started",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        ),
        const SizedBox(height: 20),
        const Center(
          child: Text("Or sign up with", style: TextStyle(color: Colors.white54)),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Icon(Icons.android, color: Colors.white),
            label: const Text("Continue with Google", style: TextStyle(color: Colors.white)),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white38),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Log In",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white70),
        ),
        const SizedBox(height: 24),
        _buildInputField(label: "Email"),
        const SizedBox(height: 20),
        _buildInputField(label: "Password", isPassword: true),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D2531),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    ),
                  onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearningTab()),
                 );
                },
              child: const Text(
              "Log In",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInputField({required String label, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        suffixIcon: isPassword
            ? Icon(Icons.visibility_off, color: Colors.white38)
            : null,
        labelStyle: TextStyle(color: Colors.white54),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
