import 'dart:convert';
import 'dart:developer';

import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/presentation/screens/email_verification_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest({required String url}) async {
    final response = await get(Uri.parse(url));
    try {
      log(url);
      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        log(response.statusCode.toString());
        log(response.body.toString());
        return NetworkResponse(
            responseData: decodeData,
            isSuccess: true,
            responseCode: response.statusCode);
      } else if (response.statusCode == 401) {
        goToSingInScreen();
        return NetworkResponse(
            isSuccess: false, responseCode: response.statusCode);
      } else {
        return NetworkResponse(
            isSuccess: false, responseCode: response.statusCode);
      }
    } catch (e) {
      log(e.toString());
      return NetworkResponse(
          isSuccess: false, responseCode: -1, errorMessage: e.toString());
    }
  }

  static Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    final response = await post(Uri.parse(url),
        headers: {"accept": "application/json"}, body: body);
    log(response.statusCode.toString());
    log(response.body.toString());
    try {
      log(url);
      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        return NetworkResponse(
            responseData: decodeData,
            isSuccess: true,
            responseCode: response.statusCode);
      } else if (response.statusCode == 401) {
        goToSingInScreen();
        return NetworkResponse(
            isSuccess: false, responseCode: response.statusCode);
      } else {
        return NetworkResponse(
            isSuccess: false, responseCode: response.statusCode);
      }
    } catch (e) {
      log(e.toString());
      return NetworkResponse(
          isSuccess: false, responseCode: -1, errorMessage: e.toString());
    }
  }

  static goToSingInScreen() {
    Get.to(() => const EmailVerificationScreen());
  }
}
