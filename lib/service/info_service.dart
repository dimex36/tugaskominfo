import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model/info_model.dart';
import '../utils/api_path.dart';
import '../utils/wrapper.dart';
class InfoService {
  final Dio dio;

  InfoService(this.dio);

Future<List<InfoModel>> getInfo() async {
    return await Wrapper<InfoModel>().wrap(
      () async {
        final response = await dio.get(info);
        final result = (response.data as List).map((e) => InfoModel.fromJson(e)).toList();
        return result;
      },
    );
}
}
