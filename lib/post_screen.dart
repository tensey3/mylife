// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新しい投稿'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _imagePath == null
                ? const Center(child: Text('画像が選択されていません'))
                : Image.asset(_imagePath!, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton.icon(
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('カメラ'),
                  onPressed: () {
                    setState(() {
                      _imagePath = 'assets/dummy_photo.jpg';
                    });
                  },
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.photo_library),
                  label: const Text('ギャラリー'),
                  onPressed: () {
                  },
                ),
              ],
            ),
          ),
          if (_imagePath != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(icon: const Icon(Icons.crop), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.filter), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.brightness_6), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.color_lens), onPressed: () {}),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _imagePath == null ? null : () {
                null;
                Navigator.pop(context);
              },
              child: const Text('投稿'),
            ),
          ),
        ],
      ),
    );
  }
}