import 'package:my_boilerplate/models/places.dart';

import 'package:dio/dio.dart';

class PlacesRepository {
  final String endpoint = 'http://192.168.246.13:8000/api';
  final Dio http = Dio();

  Future<List<Places>> getPlaces() async {
    var response = await http.get('$endpoint/places');
    List data = response.data as List;
    List<Places> places = data.map((e) => Places.fromJson(e)).toList();
    return places;
  }
}
