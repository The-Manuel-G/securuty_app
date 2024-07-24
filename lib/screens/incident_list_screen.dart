import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/incident_provider.dart';
import 'add_incident_screen.dart';
import 'incident_detail_screen.dart';
import 'package:animations/animations.dart';

class IncidentListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incidents'),
        actions: [
          OpenContainer(
            transitionType: ContainerTransitionType.fadeThrough,
            openBuilder: (context, _) => AddIncidentScreen(),
            closedElevation: 0,
            closedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            closedColor: Theme.of(context).colorScheme.secondary,
            closedBuilder: (context, openContainer) => IconButton(
              icon: Icon(Icons.add),
              onPressed: openContainer,
            ),
          ),
        ],
      ),
      body: Consumer<IncidentProvider>(
        builder: (context, incidentProvider, child) {
          return ListView.builder(
            itemCount: incidentProvider.incidents.length,
            itemBuilder: (context, index) {
              final incident = incidentProvider.incidents[index];
              return OpenContainer(
                transitionType: ContainerTransitionType.fadeThrough,
                openBuilder: (context, _) => IncidentDetailScreen(incident: incident),
                closedElevation: 0,
                closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                closedColor: Theme.of(context).cardColor,
                closedBuilder: (context, openContainer) => ListTile(
                  title: Text(incident.title),
                  subtitle: Text(incident.description),
                  onTap: openContainer,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
