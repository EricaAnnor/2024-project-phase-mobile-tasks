import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  Future<bool> get isConnected => connectionChecker.hasConnection;
}
