import 'package:erp_school/api/api_util.dart';
import 'package:erp_school/constants/app_constants.dart';

import '../data/models/request/event_model.dart';  // Add this line  to import the EventModel class  from the EventModel.dart file   in the  request folder  in the models folder  in the data folder  in the lib folder in the library folder in the root directory
class EventService {
  final String baseUrl = '$apiBaseUrl$academicPrefix/events/1/2024/1145';

  Future<bool> saveEvent(Event event) async {
    final url = '$baseUrl/events/save';

    try {
      // Use the postRequest utility
      final response = await ApiUtil.postRequest(url, event.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Response: ${response.body}');
        return true; // Successfully saved the event
      } else {
        print('Error: ${response.body}');
        return false; // Handle error
      }
    } catch (e) {
      print('Exception: $e');
      return false; // Handle exception
    }
  }
}
