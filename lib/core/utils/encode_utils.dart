import 'package:flutter/services.dart';

String decodeBase64String(String base64Image) {
  String decoded = String.fromCharCodes(decodeBase64(base64Image)!.toList());
  return decoded;
}

Uint8List? decodeBase64(String base64Image) {
  final UriData? data = Uri.parse(base64Image).data;
  return data?.contentAsBytes();
}
