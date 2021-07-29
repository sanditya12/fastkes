import 'package:dio/dio.dart';
import 'package:fastkes_app/models/pickup_place.dart';
import '../credentials.dart';
import 'package:geolocator/geolocator.dart';

class MapService {
  Future<List<PickupPlace>> getSuggestions(String inputValue) async {
    final String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';

    String request = '$baseURL?input=$inputValue&key=$PLACES_API_KEY';

    final response = await Dio().get(request);

    List list = response.data['predictions'];

    return list.map((prediction) => PickupPlace.fromJSON(prediction)).toList();
  }

  Future<List> getLatLong(String address) async {
    String request =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$PLACES_API_KEY';

    final response = await Dio().get(request);

    print(response.data['results'][0]['geometry']['location']);
    List list = [
      response.data['results'][0]['geometry']['location']['lat'],
      response.data['results'][0]['geometry']['location']['lng'],
    ];

    return list;
  }

  Future<String> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var lat = position.latitude;
    var long = position.longitude;

    String latitude = '$lat';
    String longitude = '$long';

    return '$latitude,$longitude';
  }
}
