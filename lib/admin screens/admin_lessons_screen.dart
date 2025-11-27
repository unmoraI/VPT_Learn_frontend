// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/theme.dart';

class AdminLessonsScreen extends StatefulWidget {
  final int courseId;

  const AdminLessonsScreen({super.key, required this.courseId});

  @override
  _AdminLessonsScreenState createState() => _AdminLessonsScreenState();
}

class _AdminLessonsScreenState extends State<AdminLessonsScreen> {
  final supabase = Supabase.instance.client;
  List<String> lessons = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchLessons();
  }

  Future<void> fetchLessons() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final data = await supabase
          .from('lessons')
          .select('title')
          .eq('course_id', widget.courseId)
          .order('lesson_id', ascending: true) as List<dynamic>;
      setState(() {
        lessons = data.map((e) => e['title'] as String).toList();
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка при загрузке уроков'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список уроков'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: fetchLessons,
            tooltip: 'Обновить',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : lessons.isEmpty
              ? Center(
                  child: Text(
                    'Уроки не найдены',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: lessons.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: ListTile( 
                        title: Text(
                          lessons[index],
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        onTap: () {
                          
                        },
                      ),
                    );
                  },
                ),
    );
  }
}
