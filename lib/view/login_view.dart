import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reqres_api_integration/res/components/round_buttom.dart';
import 'package:reqres_api_integration/utils/routes/routes_name.dart';
import 'package:reqres_api_integration/utils/utils.dart';
import 'package:reqres_api_integration/view/home_screen.dart';
import 'package:reqres_api_integration/view_model/auth_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obsecurePasword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePasword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthViewMode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("LogIn"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.alternate_email)),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
              ValueListenableBuilder(
                valueListenable: _obsecurePasword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        hintText: 'password',
                        labelText: 'password',
                        prefixIcon: Icon(Icons.alternate_email),
                        suffixIcon: InkWell(
                            onTap: () {
                              _obsecurePasword.value = !_obsecurePasword.value;
                            },
                            child: Icon(_obsecurePasword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility))),
                  );
                },
              ),
              SizedBox(
                height: height * 0.85,
              ),
              RoundButton(
                  title: 'Login',
                  loading: AuthViewMode.loading,
                  onPress: (() {
                    if (_emailController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Please enter your email', context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Please Enter your password', context);
                    } else if (_passwordController.text.length < 6) {
                      Utils.flushBarErrorMessage(
                          'Please enter 6 digit password', context);
                    } else {
                      Map data = {
                        'email': _emailController.text.toString(),
                        'password': _passwordController.text.toString()
                      };
                      AuthViewMode.registerApi(data, context);
                      print('api hint');
                      // AuthViewMode.();
                    }
                  })),
              // RoundButton(title: 'Red', onPress:(() {

              // }) ),
              // RoundButton(title: 'sign Up', onPress:(() {

              // }) ),
            ],
          ),
        ),
      ),
      // body: Center(
      //     child: InkWell(
      //         onTap: () {

      //           // Utils.toastMessage("NO INTERNET CONNECTION");
      //           Utils.flushBarErrorMessage("no no no", context);

      //         },
      //         child: Text("click")))
    );
  }
}
