
import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  postSignUpData(String username, String email, String phone, String password) async {
    var response = await crud.postData(AppLink.signUp, {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
