import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/incident_provider.dart';
import 'screens/incident_list_screen.dart';
import 'screens/about_screen.dart';
import 'screens/emergency_screen.dart';
import 'screens/card_game_screen.dart';
import 'widgets/custom_drawer.dart';
import 'package:universal_io/io.dart' as uio;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final incidentProvider = IncidentProvider();
  if (uio.Platform.isAndroid || uio.Platform.isIOS) {
    await incidentProvider.initializeDB();
  }
  runApp(
    ChangeNotifierProvider(
      create: (_) => incidentProvider,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Undercover App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/about': (context) => AboutScreen(),
        '/emergency': (context) => EmergencyScreen(),
        '/card_game': (context) => CardGameScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incidents'),
      ),
      drawer: CustomDrawer(),
      body: IncidentListScreen(),
    );
  }
}
