import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/incident_provider.dart';
import '../models/incident.dart';
import 'package:image_picker/image_picker.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:io';
import 'package:animations/animations.dart';

class AddIncidentScreen extends StatefulWidget {
  @override
  _AddIncidentScreenState createState() => _AddIncidentScreenState();
}

class _AddIncidentScreenState extends State<AddIncidentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _photoPath;
  String? _audioPath;
  AudioPlayer? _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _photoPath = pickedFile.path;
      });
    }
  }

  Future<void> _recordAudio() async {
    // Implement your audio recording logic here.
    // Placeholder for audio recording functionality.
    // Save the path of the recorded audio to _audioPath.

    // For demonstration, we'll just simulate a recorded file.
    String simulatedAudioPath = '/path/to/simulated/audio.m4a';
    setState(() {
      _audioPath = simulatedAudioPath;
    });
  }

  void _saveForm() {
    if (_formKey.currentState!.validate() && _photoPath != null && _audioPath != null) {
      final incident = Incident(
        title: _titleController.text,
        description: _descriptionController.text,
        photoPath: _photoPath!,
        audioPath: _audioPath!,
        date: DateTime.now(),
        officerName: 'John Doe',
        badgeNumber: '123456',
      );
      Provider.of<IncidentProvider>(context, listen: false).addIncident(incident);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Incident')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickImage,
                    icon: Icon(Icons.camera),
                    label: Text('Pick Image'),
                  ),
                  if (_photoPath != null)
                    Image.file(
                      File(_photoPath!),
                      width: 50,
                      height: 50,
                    ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: _recordAudio,
                    icon: Icon(Icons.mic),
                    label: Text('Record Audio'),
                  ),
                  if (_audioPath != null)
                    Icon(Icons.audiotrack, color: Colors.green),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: Text('Save Incident'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
