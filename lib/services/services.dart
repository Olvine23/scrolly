import 'package:http/http.dart' as http;
class ApiService {
  static Future<List<Object>> fetchAlbum() async {
    var res = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));

    var list = [res.body, res.statusCode];

    return list;
  }
}