import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Stream<bool> get onConnectivityChanged;
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;

  NetworkInfoImpl(this._connectivity);

  @override
  Stream<bool> get onConnectivityChanged => _connectivity.onConnectivityChanged
      .map((result) => result != ConnectivityResult.none);

  @override
  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
