import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/incident_provider.dart';

class EmergencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Provider.of<IncidentProvider>(context, listen: false).clearIncidents();
          },
          child: Text('Delete All Incidents'),
        ),
      ),
    );
  }
}
