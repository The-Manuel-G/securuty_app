import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'database_service.dart';
import '../models/incident.dart';

class SyncService {
  final DatabaseService _dbService = DatabaseService();
  final Dio _dio = Dio();

  Future<void> syncIncidents() async {
    final incidents = await _dbService.getIncidents();
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult != ConnectivityResult.none) {
      for (var incident in incidents) {
        try {
          await _dio.post(
            'https://your-api-endpoint.com/incidents',
            data: incident.toMap(),
          );
          await _dbService.deleteIncident(incident.id!);
        } catch (e) {
          // Handle error, notify user if needed
        }
      }
    } else {
      // Notify user of no internet connection
    }
  }
}
