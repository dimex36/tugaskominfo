import 'package:dio/dio.dart';

import '../model/login_model.dart';
import '../source/session_source.dart';
import '../utils/api_path.dart';
import '../utils/wrapper.dart';

class AuthService {
  final Dio dio;

  AuthService(this.dio);

  Future<LoginModel> doLogin(Map<String, dynamic> payload) async {
    return await Wrapper<LoginModel>().wrap(
      () async {
        final response = await dio.post(login, data: payload);
        print(response.statusCode);
        final result = LoginModel.fromJson(response.data);
        print(result.toString());
        await SessionSource().saveToken(result.message!);
        return result;
      },
    );
  }
}
