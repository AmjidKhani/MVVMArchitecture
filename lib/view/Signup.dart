import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../utils/routes/RoutesName.dart';
import '../utils/util.dart';
import '../viewmodel/auth_view_model.dart';

class SignUPView extends StatefulWidget {
  const SignUPView({Key? key}) : super(key: key);

  @override
  State<SignUPView> createState() => _SignUPViewState();
}

class _SignUPViewState extends State<SignUPView> {
  @override
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  ValueNotifier<bool> _obsecurepassword = ValueNotifier<bool>(true);
  FocusNode email = FocusNode();
  FocusNode pass = FocusNode();

  @override
  void dispose() {
    emailC.dispose();
    passC.dispose();

    email.dispose();
    pass.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authviewmodel = Provider.of<AuthModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Signup"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailC,
                focusNode: email,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    label: Text('Enter Email'),
                    hintText: 'Enter Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                onFieldSubmitted: (v) {
                  Utils.focustonext(context, email, pass);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ValueListenableBuilder(
                  valueListenable: _obsecurepassword,
                  builder: (BuildContext context, value, Widget? child) {
                    return TextFormField(
                      controller: passC,
                      focusNode: pass,
                      obscureText: _obsecurepassword.value,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.key),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                _obsecurepassword.value =
                                    !_obsecurepassword.value;
                              },
                              child: _obsecurepassword.value
                                  ? Icon(Icons.visibility_off_sharp)
                                  : Icon(Icons.visibility)),
                          label: Text('Enter Password'),
                          hintText: 'Enter Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    );
                  },
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: RoundButton(
                loading: authviewmodel.gettingsignuploadingg,
                onTap: () {
                  if (emailC.text.isEmpty) {
                    Utils.flushBarErrorMessage("Please Enter Email", context);
                  } else if (passC.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        "Please Enter Password", context);
                  } else if (passC.text.length < 5) {
                    Utils.flushBarErrorMessage(
                        "Password must be grater than 6 digit", context);
                  } else {
                    Map data = {
                      'email': emailC.text.toString(),
                      'password': passC.text.toString()
                    };
                    authviewmodel.SignupApi(data, context);

                    print("Api hit");
                  }
                },
                title: 'SignUp',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have An Account? ",
                    style: TextStyle(
                      fontSize: 15,
                    )),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.login);
                    },
                    child: Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
