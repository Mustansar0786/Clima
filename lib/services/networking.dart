import 'dart:convert';

import 'package:http/http.dart' as http;

class Networking {
  final uri;
  Networking(this.uri);

  Future getdata() async {
    http.Response response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(" ERROR CODE:${response.statusCode}");
    }
  }
}
