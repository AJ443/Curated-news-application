import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page.dart';
import 'news_page.dart'; // Import the headlines page

class ArticlePage extends StatelessWidget {
  final Map article;

  const ArticlePage({super.key, required this.article});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = article['urlToImage'];
    final title = article['title'] ?? 'No Title';
    final description = article['description'] ?? '';
    final content = article['content'] ?? '';
    final url = article['url'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Details'),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageUrl != null && imageUrl != '')
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(imageUrl),
              ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 12),
            Text(content, style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 20),
            if (url != null)
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                  onPressed: () => _launchURL(url),
                  icon: const Icon(Icons.open_in_browser),
                  label: const Text("Read Full Article"),
                ),
              ),
            const SizedBox(height: 30),

            // NEW: Two buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: const Text("Go to Home"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NewsPage(selectedTopics: ['general']),
                      ),
                    );
                  },
                  child: const Text("Top Headlines"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
