import 'package:search_fliter/data/models/AccountModel.dart';
import 'Network.dart';

class ApiRepo {
  final Network network = Network();

  Future<List<AccountModel>> fetchAccountList() {
    return network.fetchAccountList();
  }
}

class NetworkError extends Error {}