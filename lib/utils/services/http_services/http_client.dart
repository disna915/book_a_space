import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:traveller_app/constants/app_strings.dart';

import '../../../main.dart';
import '../local_storage/flutter_secure_storage.dart';
import 'endpoints.dart';
import 'expections.dart';
class MultipartFieldValue {
  final String field;
  final String value;

  MultipartFieldValue({required this.field, required this.value});
}
enum RequestType { delete, get, patch, post, put, postmultipart }
enum FormRequestType {
  raw,
  formData,
}
class NetworkAdapter {
  static final NetworkAdapter shared = NetworkAdapter._privateConstructor();
  NetworkAdapter._privateConstructor();



  Future<dynamic> send({
    EndPoint? endPoint,
    Map<String, dynamic>? params,
    Map<String, String>? fields,
    List<String>? filePaths,
    List<String>? fileKeys,
    List<ReplaceId>? listId,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    var client = http.Client();
    String? accessTokens = await PersistentStorage.read(accessToken);
    print("tokencc"+accessTokens.toString());
    Map<String, String>? headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    if (endPoint?.shouldAddToken == true) {
      headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "version": "v2",
        'Authorization': 'Bearer $accessTokens'
      };
    }

    http.Response response;
    String url = "";
    if (listId != null) {
      url = endPoint!.cleanUrlWith(listId);
    } else {
      url = endPoint!.url;
    }

    if (params != null) {
      log("params is ${params.toString()}");
    }
    if (fields != null) {
      log("multipart fields is ${fields.toString()}");
    }
    if (fileKeys != null) {
      log("fileKeys is ${fileKeys.toString()}");
    }
    if (filePaths != null) {
      log("filePaths is ${filePaths.toString()}");
    }

    log("url is ${url.toString()}");

    try {
      Uri uri;

      uri = Uri.parse(url);

      switch (endPoint.requestType) {
        case RequestType.delete:
          response = await client.delete(
            uri,
            headers: headers,
            body: json.encode(params),
          );
          break;
        case RequestType.get:
          if (params != null) {
            final request = http.Request('GET', uri)
              ..headers.addAll(headers)
              ..body = json.encode(params);
            final streamedResponse = await client.send(request);
            response = await http.Response.fromStream(streamedResponse);
          } else {
            response = await client.get(uri, headers: headers);
          }
          break;
        case RequestType.patch:
          response = await client.patch(uri, headers: headers);
          break;
        case RequestType.post:
          response = await client.post(
            uri,
            headers: headers,
            body: json.encode(params),
          );
          break;
        case RequestType.put:
          response = await client.put(
            uri,
            headers: headers,
            body: json.encode(params),
          );
          break;
        case RequestType.postmultipart:
          var request = http.MultipartRequest(
            'POST',
            Uri.parse(url),
          );
          request.headers.addAll(headers);

          if (fields != null) {
            request.fields.addAll(fields);
          }
          // Add multiple images
          if (filePaths != null) {
            for (int i = 0; i < filePaths.length; i++) {
              request.files.add(await http.MultipartFile.fromPath(
                  fileKeys![i], filePaths[i]));
            }
          }

          var streamedResponse = await request.send();
          response = await http.Response.fromStream(streamedResponse);
      }
    } on SocketException catch (exception) {
      logger.e(exception.message);
      throw FetchDataException('No Internet connection', 1000);
    }
    return checkAndReturnResponse(response);
  }
  dynamic checkAndReturnResponse(http.Response response) {
    String? description; // App specific handling!
    switch (response.statusCode) {
      case 200:
      case 201:

        log(response.body);
        return response.body;
      case 400:
        logger.e(response.body);
        throw BadRequestException(description ?? response.reasonPhrase, 400);
      case 401:
        logger.e(response.body);
        throw NotFoundException(description ?? response.reasonPhrase, 400);

      case 403:
        logger.e(response.body);

        throw UnauthorizedException(description ?? response.reasonPhrase, 401);
      case 404:
        logger.e(response.body);
        throw NotFoundException(description ?? response.reasonPhrase, 404);
      case 500:
        logger.e(response.body);
        throw InternalServerException(
            description ?? response.reasonPhrase, 500);
      default:
        logger.e(response.body);
        throw FetchDataException(
            "Unknown error occurred\n\nerror Code: ${response.statusCode}  error: ${response.reasonPhrase}",
            1001);
    }
  }
}
