import 'package:flutter/material.dart';
import '../models/incident.dart';

class IncidentCard extends StatelessWidget {
  final Incident incident;
  final Function() onTap;

  IncidentCard({required this.incident, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(incident.title),
        subtitle: Text(incident.description),
        trailing: Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
