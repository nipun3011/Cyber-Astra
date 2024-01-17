import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AadharSendOTPRequestCall {
  static Future<ApiCallResponse> call({
    String? aadhaarNumber = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Aadhar Send OTP Request',
      apiUrl: 'https://api.emptra.com/aadhaarVerification/requestOtp',
      callType: ApiCallType.POST,
      headers: {
        'clientId':
            '133a90e5e2a107fb8b8c54ffe3d3cb7a:ef817ff9569ee610cd8256ba88601ffa',
        'secretKey':
            'W1i6t6o2OqlSCbcgfhgacsW4Pj6KtuUovsHT0kqeGH8RJfyM8Qc7oZjHRZDu55IsF',
      },
      params: {
        'aadhaarNumber': aadhaarNumber,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? clientId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.data.client_id''',
      ));
}

class AdhaarEnterOTPAndClientIdCall {
  static Future<ApiCallResponse> call({
    String? clientId = '',
    int? otp,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Adhaar Enter OTP and client id',
      apiUrl: 'https://api.emptra.com/aadhaarVerification/submitOtp',
      callType: ApiCallType.POST,
      headers: {
        'secretKey':
            'W1i6t6o2OqlSCbcgfhgacsW4Pj6KtuUovsHT0kqeGH8RJfyM8Qc7oZjHRZDu55IsF',
        'clientId':
            '133a90e5e2a107fb8b8c54ffe3d3cb7a:ef817ff9569ee610cd8256ba88601ffa',
      },
      params: {
        'client_id': clientId,
        'otp': otp,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.data.full_name''',
      ));
  static String? aadharNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.result.data.aadhaar_number''',
      ));
  static String? dob(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.data.dob''',
      ));
  static String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.data.gender''',
      ));
  static dynamic? address(dynamic response) => getJsonField(
        response,
        r'''$.result.data.address''',
      );
  static String? district(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.data.address.dist''',
      ));
  static String? zipcode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.data.zip''',
      ));
  static String? fatherName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.result.data.care_of''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
