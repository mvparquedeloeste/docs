import 'package:flutter/material.dart';

class News {
  final String newsDate;
  final String imageUrl;
  final String title;
  final String subtitle;
  final String newspaperName;

  News({
    required this.newsDate,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.newspaperName,
  });
}

class NewsScreen extends StatelessWidget {
  final List<News> newsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Al detalle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: NewWidget(newToShow: newsList[index]),
            );
          },
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({super.key, required this.newToShow});

  final News newToShow;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 80,
          backgroundColor: Colors.black,
          backgroundImage: NetworkImage(newToShow.imageUrl),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                newToShow.title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                newToShow.subtitle,
                style: const TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              const SizedBox(height: 8.0),
              Text(
                '🗞️ ${newToShow.newspaperName}',
                style: const TextStyle(
                  fontSize: 14.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                '📆 ${newToShow.newsDate}',
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
