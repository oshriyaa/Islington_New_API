import 'dart:convert';
import 'dart:io';
import 'url.dart';
import '../model/model.dart';
import 'package:http/http.dart' as http;

class IslingtonApiService {
  Future getList() async {
    try {
      Map<String, String> headers = {
        "content-type": "application/json",
        "Authorization": "Bearer ${bearerToken.token}",
      };
      print("Token: ${bearerToken.token}");
      var decodedResponse;
      final response = await http.get(
        Uri.parse("${IslingtonEnv.URL}"),
        headers: headers,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        decodedResponse = json.decode(response.body);
        var decodedResponseList = decodedResponse["list"];
        // decodedResponse = json.decode(response.body).cast<String, dynamic>();
        // final List<ListElement> decodedResponseList = getListElementFromJson(response.body);
        // print(decodedResponse);
        // print(decodedResponseList);

        return decodedResponseList;
      } else {
        throw Exception('Failed to load data');
      }
    } on SocketException catch (_) {
      return Future.error('No Network Found');
    }
  }
}
