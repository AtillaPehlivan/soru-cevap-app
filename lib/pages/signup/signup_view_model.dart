import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:sorucevap/pages/signup/signup.dart';
import 'package:sorucevap/service/auth/firebase_auth.dart';

abstract class SignUpViewModel extends State<SignUp> {
  final FocusNode passwordFieldFocusNode = FocusNode();

  ProgressDialog _progressDialog;

  TextEditingController emailFieldController = new TextEditingController();
  TextEditingController passwordFieldController = new TextEditingController();
  TextEditingController rePasswordFieldController = new TextEditingController();
  TextEditingController displayNameFieldController = new TextEditingController();

  final formKey = GlobalKey<FormState>();

  Auth authService;

  @override
  void initState() {
    super.initState();
  }

  void signup(BuildContext context) async {
    authService = Provider.of<Auth>(context, listen: false);

    if (!formKey.currentState.validate()) return null;
    print(emailFieldController.text);

    _progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal, isDismissible: false);
    _progressDialog.style(message: "Kayıt Yapılıyor...", messageTextStyle: normalDialogTextStyle(), progressWidget: CircularProgressIndicator());
    _progressDialog.show();
    bool status = await authService.signUpWithEmailAndPassword(emailFieldController.text, passwordFieldController.text);
    if (!status) {
      _progressDialog.update(
          message: "Girilen Bilgiler Hatalı.",
          messageTextStyle: errorDialogTextStyle(),
          progressWidget: Icon(
            Icons.error,
            color: Colors.red,
          ));
      await Future.delayed(Duration(milliseconds: 1200));
    } else {
      _progressDialog.update(
          message: "Tebrikler Giriş Yapılıyor...",
          messageTextStyle: normalDialogTextStyle(),
          progressWidget: Icon(
            Icons.check_box,
            color: Colors.green,
          ));
      await Future.delayed(Duration(milliseconds: 1200));
      _progressDialog.hide();
      Navigator.of(context).pop();
      print("signup success");
    }
    _progressDialog.hide();
  }

  void loginWithGoogle(BuildContext context) async {
    authService = Provider.of<Auth>(context, listen: false);

    await authService.signInWithGoogle();
  }
}

TextStyle errorDialogTextStyle() {
  return TextStyle(color: Colors.red, fontFamily: "Oswald", fontWeight: FontWeight.w500, fontSize: 15);
}

TextStyle normalDialogTextStyle() {
  return TextStyle(color: Colors.black, fontFamily: "Oswald", fontWeight: FontWeight.w500, fontSize: 15);
}
