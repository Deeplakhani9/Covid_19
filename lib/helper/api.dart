import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/castam.dart';

class API {
  API._();
  static final API api = API._();

  Future<Covid?> fetchCurrency() async {
    String api = "https://api.rootnet.in/covid19-in/stats/latest/";

    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      Map decode = jsonDecode(res.body);

      Covid covid = Covid.fromjson(json: decode);

      return covid;
    }
  }
}
