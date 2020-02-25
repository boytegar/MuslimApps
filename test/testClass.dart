

import 'package:dio/dio.dart';
import 'package:muslimapps/request/base_request.dart';
import 'dart:core';
main() async {
final dio = Dio();
var client = RestClient(dio);

await client.getDetailListQuran("1","1").then((value) =>
print(value.toString())
);

}