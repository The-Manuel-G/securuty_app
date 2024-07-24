import 'package:flutter/material.dart';
import '../models/incident.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';

class IncidentDetailScreen extends StatelessWidget {
  final Incident incident;

  IncidentDetailScreen({required this.incident});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(incident.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              incident.description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Image.file(
              File(incident.photoPath),
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final player = AudioPlayer();
                player.play(DeviceFileSource(incident.audioPath));
              },
              child: Text('Play Audio'),
            ),
          ],
        ),
      ),
    );
  }
}
