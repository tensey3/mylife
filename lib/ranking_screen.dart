import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> rankings = [
    {'rank': 1, 'name': 'ユーザー1', 'score': 1000, 'image': 'https://picsum.photos/seed/1/100'},
    {'rank': 2, 'name': 'ユーザー2', 'score': 950, 'image': 'https://picsum.photos/seed/2/100'},
    {'rank': 3, 'name': 'ユーザー3', 'score': 900, 'image': 'https://picsum.photos/seed/3/100'},
    {'rank': 4, 'name': 'ユーザー4', 'score': 850, 'image': 'https://picsum.photos/seed/4/100'},
    {'rank': 5, 'name': 'ユーザー5', 'score': 800, 'image': 'https://picsum.photos/seed/5/100'},
  ];

  RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ランキング'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildTopThree(rankings[1], Colors.grey[300]!),
                _buildTopThree(rankings[0], Colors.yellow[300]!),
                _buildTopThree(rankings[2], Colors.orange[300]!),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: rankings.length,
              itemBuilder: (context, index) {
                final ranking = rankings[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(ranking['image']),
                  ),
                  title: Text(ranking['name']),
                  subtitle: Text('スコア: ${ranking['score']}'),
                  trailing: Text(
                    '#${ranking['rank']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: index < 3 ? Colors.blue : Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopThree(Map<String, dynamic> user, Color color) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(user['image']),
          ),
        ),
        const SizedBox(height: 8),
        Text(user['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
        Text('${user['score']}'),
      ],
    );
  }
}