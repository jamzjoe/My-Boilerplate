import 'package:dio/dio.dart';
import 'package:my_boilerplate/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final Dio http = Dio();
  String endpoint = 'http://192.168.246.13:8000/api/';
  String token = '';
  int id = 0;
  final Future<SharedPreferences> _preferences =
      SharedPreferences.getInstance();
  User users = User();

  Future<bool> login(String email, String password) async {
    final SharedPreferences pref = await _preferences;
    var response = await http.post('${endpoint}login',
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
        data: {'email': email, 'password': password});
    token = response.data['token'];
    final decode = response.data['user'];
    users = User.fromJson(decode);
    await pref.setInt('user_id', users.id!);
    await pref.setString('token', token);

    return response.statusCode == 200;
  }

  Future<String> getToken() async {
    return token;
  }

  Future<User> getUser(int id) async {
    var response = await http.get('${endpoint}users/$id');

    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<bool> logout(String myToken) async {
    final SharedPreferences pref = await _preferences;
    await pref.remove('token');
    await pref.remove('user_id');
    var response = await http.post(
      '${endpoint}logout',
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $myToken',
      }),
    );
    return response.statusCode == 200;
  }
}
