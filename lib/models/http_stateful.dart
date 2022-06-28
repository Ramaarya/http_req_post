import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpStateFul {
  String? id, name, job, createdAt;

  HttpStateFul({
    this.createdAt,
    this.id,
    this.job,
    this.name,
  });

  static Future<HttpStateFul> connectAPI(String name, String job) async {
    Uri url = Uri.parse('https://reqres.in/api/users');
    var hasilResponse = await http.post(
      url,
      body: {
        "name": name,
        "job": job,
      },
    );

    var data = json.decode(hasilResponse.body);

    return HttpStateFul(
      id: data['id'],
      name: data['name'],
      job: data['job'],
      createdAt: data['createdAt'],
    );
  }
}
