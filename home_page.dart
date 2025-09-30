import 'package:flutter/material.dart';
import 'news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> interests = [
    {'label': 'Technology', 'icon': Icons.memory},
    {'label': 'Politics', 'icon': Icons.gavel},
    {'label': 'Business', 'icon': Icons.business_center},
    {'label': 'Science', 'icon': Icons.science},
    {'label': 'Sports', 'icon': Icons.sports_soccer},
    {'label': 'Entertainment', 'icon': Icons.movie},
    {'label': 'Travel', 'icon': Icons.flight_takeoff},
    {'label': 'Education', 'icon': Icons.school},
    {'label': 'Lifestyle', 'icon': Icons.style},
    {'label': 'Health', 'icon': Icons.health_and_safety},
    {'label': 'Other', 'icon': Icons.category},
  ];

  final Set<String> selectedTopics = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.flash_on, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'NewsFlash',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Choose your interests',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView(
                children: interests.map((interest) {
                  final isSelected = selectedTopics.contains(interest['label']);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: FilterChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            interest['icon'],
                            size: 20,
                            color: isSelected ? Colors.white : Colors.black54,
                          ),
                          const SizedBox(width: 6),
                          Text(interest['label']),
                        ],
                      ),
                      selected: isSelected,
                      selectedColor: Colors.cyan,
                      checkmarkColor: Colors.white,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                      backgroundColor: Colors.grey[200],
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            selectedTopics.add(interest['label']);
                          } else {
                            selectedTopics.remove(interest['label']);
                          }
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.arrow_forward),
                label: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                onPressed: selectedTopics.isEmpty
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => NewsPage(
                              selectedTopics: selectedTopics.toList(),
                            ),
                          ),
                        );
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
