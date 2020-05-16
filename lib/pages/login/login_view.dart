import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sorucevap/constants/helper.dart';
import 'package:sorucevap/constants/widgets.dart';
import 'package:sorucevap/pages/login/login_view_model.dart';


class LoginView extends LoginViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Theme.of(context).backgroundColor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    appLogo,
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 60, left: 60),
                      child: Text(
                        "Lorem ipsum dolar sit amet dolar ipsum dolar amet dolar ipsum dolar amet dolar ipsum dolar",
                        style: TextStyle(color: Color(0xff4A4A4A), fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30, left: 30),
                        child: Column(
                          children: <Widget>[
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
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (String password) => {login(context)},
                              focusNode: passwordFieldFocusNode,
                              decoration: customInputDecoration(hintText: "Şifreniz"),
                              textAlign: TextAlign.center,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(flex: 2),
                    Container(
                        height: 50,
                        margin: const EdgeInsets.only(right: 30, left: 30),
                        child: SizedBox(
                          height: 300,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                            padding: EdgeInsets.all(0),
                            onPressed: () => {login(context)},
                            child: Ink(
                              decoration: raisedButtonDecoration(),
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "GİRİŞ YAP",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15),
                                  )),
                            ),
                          ),
                        )),
                    Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("Şifrenizi mi unuttunuz ?", style: TextStyle(color: Colors.grey)),
                      ),
                      onTap: () => {},
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Hesabınız yok mu?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () => {},
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "Hesap Oluştur",
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    ),
                    Spacer()
                  ],
                ),
              ),
            );
          },
        ));
  }
}
