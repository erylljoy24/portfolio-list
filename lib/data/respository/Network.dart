import 'package:dio/dio.dart';
import 'package:search_fliter/AppCookie.dart';
import 'package:search_fliter/data/models/AccountModel.dart';

class Network {
  final Dio _dio = Dio();
  final String _url = 'https://org07493ee7.crm5.dynamics.com/api/data/v9.2/accounts';

  Future<List<AccountModel>> fetchAccountList() async {
    late Response response;
    try {
      response = await _dio.get(
        _url,
        options: Options(
          headers: {
            "cookie": AppCookie.cookie
          },
        ),
      );
      List list = response.data['value'];
      return list.map((data) => AccountModel.fromJson(data)).toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return [];
    }
  }
}