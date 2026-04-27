import 'package:injectable/injectable.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String email, String password, String name);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'test@example.com' && password == 'password') {
      return const UserModel(
        id: '1',
        email: 'test@example.com',
        name: 'Test User',
        token: 'fake-jwt-token',
      );
    } else {
      throw Exception('Invalid credentials');
    }
  }

  @override
  Future<UserModel> register(String email, String password, String name) async {
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      id: '2',
      email: email,
      name: name,
      token: 'fake-jwt-token',
    );
  }
}
