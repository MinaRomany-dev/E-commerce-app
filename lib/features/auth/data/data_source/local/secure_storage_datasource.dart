import 'package:ecommerce2/core/error/exceptions.dart';
import 'package:ecommerce2/features/auth/data/data_source/local/local_datasource.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: LocalauthDatasouce)
class SecureStorageDatasource extends LocalauthDatasouce {
  final FlutterSecureStorage storage;
  SecureStorageDatasource(this.storage);
  static const String _tokenkey = 'token';

  @override
  Future<String?> getToken() async {
    try {
      return await storage.read(key: _tokenkey);
    } catch (e, stack) {
      print('🧨 $stack');
      throw LocalException('Failed to get token');
    }
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      await storage.write(key: _tokenkey, value: token);
    } catch (e, stack) {
      print('🧨 $stack');
      throw LocalException('Failed to save token');
    }
  }

  Future<void> deleteToken() async {
    try {
      await storage.delete(key: _tokenkey);
    } catch (e, stack) {
      print('🧨 $stack');
      throw LocalException('Failed to delete token');
    }
  }
}
