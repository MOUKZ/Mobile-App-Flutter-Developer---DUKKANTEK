import 'dart:async';
import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;
import 'package:stacked_services/stacked_services.dart';

/// Network Util Class -> A utility class for handling network operations
class NetworkUtil {
  //------------------------------------------------------------- Variables ---------------------------------------------------------------------------
  // JsonDecoder object
  static final JsonDecoder _decoder = new JsonDecoder();
  static String baseUrl = '';
  //------------------------------------------------------------- Methods -----------------------------------------------------------------------------
  /// Get Method -> Future<dynamic>
  /// @param -> @required url -> String
  /// @usage -> Make HTTP-GET request to specified URL and returns the response in JSON format
  static Future<dynamic> get(
          {required String url, Map<String, String>? headers}) =>
      http
          .get(Uri.parse(baseUrl + url),
              headers: headers) // Make HTTP-GET request
          .then((http.Response response) {
        // On response received
        // Get response status code
        final int statusCode = response.statusCode;
        // Check response status code for error condition
        if (statusCode < 200 || statusCode > 400 || json == null) {
          // Error occurred
          if (statusCode == 401) {
            // locator<SharedPreferencesRepository>().logout();
            // locator<NavigationService>().clearStackAndShow(Routes.splashView);
            // throw Exception("Unauthorized");
            return _decoder.convert('{ "status":"false"}');
          }
          BotToast.showText(text: statusCode.toString());
        } else {
          // No error occurred
          // Get response body
          final String res = response.body;
          // Convert response body to JSON object
          return _decoder.convert(res);
        }
      });

  static Future<dynamic> delete(
          {required String url, Map<String, String>? headers}) =>
      http
          .delete(Uri.parse(baseUrl + url),
              headers: headers) // Make HTTP-GET request
          .then((http.Response response) {
        // On response received
        // Get response status code
        final int statusCode = response.statusCode;
        // Check response status code for error condition
        if (statusCode < 200 || statusCode > 400 || json == null) {
          // Error occurred
          if (statusCode == 401) {
            // locator<SharedPreferencesRepository>().logout();
            // locator<NavigationService>().clearStackAndShow(Routes.splashView);
            // throw Exception("Unauthorized");
            return _decoder.convert('{ "status":"false"}');
          }
          BotToast.showText(text: statusCode.toString());
        } else {
          // No error occurred
          // Get response body
          final String res = response.body;
          // Convert response body to JSON object
          return _decoder.convert(res);
        }
      });

  /// Post Method -> Future<dynamic>
  /// @param -> @required url -> String
  ///        -> headers -> Map
  ///        -> body -> dynamic
  ///        -> encoding -> dynamic
  ///  @usage -> Make HTTP-POST request to specified URL and returns the response in JSON format
  static Future<dynamic> post(
          {required String url,
          Map<String, String>? headers,
          body,
          encoding}) =>
      http
          .post(Uri.parse(baseUrl + url),
              body: body,
              headers: headers,
              encoding: encoding) // Make HTTP-POST request
          .then((http.Response response) {
        // On response received
        // Get response status code
        final int statusCode = response.statusCode;

        // Check response status code for error condition
        if (statusCode < 200 || statusCode > 400 || json == null) {
          // Error occurred
          //  throw new Exception("Error while fetching data");
          if (statusCode == 401) {
            // locator<SharedPreferencesRepository>().logout();
            // locator<NavigationService>().clearStackAndShow(Routes.splashView);
            // throw Exception("Unauthorized");

            return _decoder.convert('{ "status":"false"}');
          }
          BotToast.showText(text: statusCode.toString());
        } else {
          // No error occurred
          // Get response body
          final String res = response.body;
          // Convert response body to JSON object
          return _decoder.convert(res);
        }
      });

  static Future<dynamic> postMultipart({
    required String url,
    required Map<String, String> headers,
    required Map<String, String> fields,
    required Map<String, String> files,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl + url));
    var _filesKeyList = files.keys.toList();
    var _filesNameList = files.values.toList();
    for (int i = 0; i < _filesKeyList.length; i++) {
      if (_filesNameList[i] != "") {
        var multipartFile = http.MultipartFile.fromPath(
          _filesKeyList[i],
          _filesNameList[i],
          filename: path.basename(
              _filesNameList[i]), // use the real name if available, or omit
          contentType: MediaType.parse("image/*"),
        );

        request.files.add(await multipartFile);
      }
    }
    request.headers.addAll(headers);
    request.fields.addAll(fields);
    var response = await request.send();
    String jsonResponse;
    try {
      var value = await response.stream.bytesToString();

      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        if (statusCode == 401) {
          // locator<SharedPreferencesRepository>().logout();
          // locator<NavigationService>().clearStackAndShow(Routes.splashView);
          // throw Exception("Unauthorized");
          return _decoder.convert('{ "status":"false"}');
        }
        BotToast.showText(text: statusCode.toString());
      } else {
        jsonResponse = value.toString();
        return _decoder.convert(jsonResponse);
      }
    } catch (error) {
      print(error.toString());
    }
  }

  static String getUrlWithParams(String url, Map<String, String> params) {
    //  ?userId=b900b13a&lat=30.51651&long=50.356
    String strUrl = url;
    var _paramsKeyList = params.keys.toList();
    var _paramsValueList = params.values.toList();
    for (var i = 0; i < params.length; i++) {
      if (i == 0) {
        strUrl += '?' + _paramsKeyList[i] + '=' + _paramsValueList[i];
      } else {
        strUrl += '&' + _paramsKeyList[i] + '=' + _paramsValueList[i];
      }
    }

    return strUrl;
  }

  static Future<dynamic> postMultipartArry({
    required String url,
    required Map<String, String> headers,
    required Map<String, String> fields,
    required Map<String, List<String>?> files,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl + url));
    var _filesKeyList = files.keys.toList();
    var _filesNameList = files.values.toList();
    for (int i = 0; i < _filesKeyList.length; i++) {
      if (_filesNameList[i] != null) {
        for (int j = 0; j < _filesNameList[i]!.length; j++) {
          var multipartFile = http.MultipartFile.fromPath(
            _filesKeyList[i],
            _filesNameList[i]![j],
            filename: path.basename(_filesNameList[i]![
                j]), // use the real name if available, or omit
            // contentType: MediaType.parse("image/*"),
          );

          request.files.add(await multipartFile);
        }
      }
    }
    request.headers.addAll(headers);
    request.fields.addAll(fields);
    var response = await request.send();
    String jsonResponse;
    try {
      var value = await response.stream.bytesToString();

      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        if (statusCode == 401) {
          // locator<SharedPreferencesRepository>().logout();
          // locator<NavigationService>().clearStackAndShow(Routes.splashView);
          // throw Exception("Unauthorized");
          return _decoder.convert('{ "status":"false"}');
        }
        BotToast.showText(text: statusCode.toString());
      } else {
        jsonResponse = value.toString();
        return _decoder.convert(jsonResponse);
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
