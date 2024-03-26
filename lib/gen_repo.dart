import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as https;
import 'package:urlshortner/models/failed_model.dart';
import 'package:urlshortner/models/success_model.dart';

class GenerateUrlRepo {
  Future<Either<FailedResponse, SuccessResponse>> hitRepocode(
      String userdata) async {
    String url = 'http://localhost:8000/url';
    final sendData = {"url": userdata.toString()};
    final response = await https.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8', // Add this header
      },
      body: jsonEncode(sendData),
    );
    log(sendData.toString());

    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final decodedData = jsonDecode(response.body);
        final successResponse = SuccessResponse.fromJson(decodedData);
        return Right(successResponse);
      } else {
        log(response.body);
        final decodedData = jsonDecode(response.body);

        final failedResponse = FailedResponse.fromJson(decodedData);
        return Left(failedResponse);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
