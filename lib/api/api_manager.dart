import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:logistics_app/services/db_storage.dart';

class ApiManager {
  DbStorage dbStorage = DbStorage();

  getRequest(var url) async {
    var token = dbStorage.getToken();
    print(url);
    print(token);
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(url));
    request.body = '''''';
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return response;
  }

  // post request
  postRequest(var url, Object? value) async {
    print(url);
    print(value);
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(url));
    request.body = json.encode(value);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return response;
  }

  // post request
  postRequestWithToken(var url, Object? value) async {
    var token = dbStorage.getToken();
    print(url);
    print(value);
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var request = http.Request('POST', Uri.parse(url));
    request.body = json.encode(value);
    request.headers.addAll(headers);
    

    http.StreamedResponse response = await request.send();

    return response;
  }

  // multipart  request
  multiPartRequest(var url, String type, Uint8List signatureBytes) async {
    var token = dbStorage.getToken();
    print(url);
    print(token);

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.fields.addAll({
      'signType': type
    });

    request.files.add(http.MultipartFile.fromBytes(
      'file', signatureBytes,
      filename: 'file.png',
    ));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return response;
  }
}
