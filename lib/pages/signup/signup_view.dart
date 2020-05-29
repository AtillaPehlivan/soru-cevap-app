import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sorucevap/constants/helper.dart';
import 'package:sorucevap/constants/widgets.dart';

import 'signup_view_model.dart';

class SignUpView extends SignUpViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                appLogo,
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: Text(
                    "Lorem ipsum dolar sit amet dolar ipsum dolar amet dolar ipsum dolar amet dolar ipsum dolar",
                    style: TextStyle(color: Color(0xff4A4A4A), fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30, left: 30),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: displayNameFieldController,
                          validator: (val) {
                            return val.isEmpty ? "Kullanıcı Adı Giriniz" : null;
                          },
                          style: TextStyle(fontSize: 13),
                          decoration: customInputDecoration(hintText: "Kullanıcı Adınız"),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          validator: (value) {
                            return validateEmail(value) ? null : "Geçerli email giriniz";
                          },
                          controller: emailFieldController,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (String email) => {FocusScope.of(context).requestFocus(passwordFieldFocusNode)},
                          style: TextStyle(fontSize: 13),
                          decoration: customInputDecoration(hintText: "E-Posta Adresiniz"),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: passwordFieldController,
                          validator: (val) {
                            return val.isEmpty ? "Şifre Boş bırakılamaz" : null;
                          },
                          style: TextStyle(fontSize: 13),
                          decoration: customInputDecoration(hintText: "Şifreniz"),
                          textAlign: TextAlign.center,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: rePasswordFieldController,
                          validator: (val) {
                            if (val.toString() != passwordFieldController.text.toString()) {
                              return "Şifreler Uyuşmuyor.";
                            } else if (val.isEmpty) {
                              return "Boş bırakılamaz";
                            }

                            return null;
                          },
                          style: TextStyle(fontSize: 13),
                          decoration: customInputDecoration(hintText: "Şifreniz"),
                          textAlign: TextAlign.center,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    height: 50,
                    margin: const EdgeInsets.only(right: 30, left: 30),
                    child: SizedBox(
                      height: 300,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                        padding: EdgeInsets.all(0),
                        onPressed: () => {signup(context)},
                        child: Ink(
                          decoration: raisedButtonDecoration(),
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "KAYIT OL",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15),
                              )),
                        ),
                      ),
                    )),
                SizedBox(height: 20),
                Container(
                    height: 50,
                    margin: const EdgeInsets.only(right: 30, left: 30),
                    child: SizedBox(
                      height: 300,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                        padding: EdgeInsets.all(0),
                        onPressed: () => {loginWithGoogle(context)},
                        child: Ink(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), color: Colors.white),
                          child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  SizedBox(width: 20),
                                  SvgPicture.asset(
                                    "assets/svg/google_icon.svg",
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      "Google ile giriş yap",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    )),
                SizedBox(height: 20),
                InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("Şifrenizi mi unuttunuz ?", style: TextStyle(color: Colors.grey)),
                  ),
                  onTap: () => {},
                ),
              ],
            ),
          ),
        ));
  }
}
