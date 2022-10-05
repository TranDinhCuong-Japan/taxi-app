import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/blocs/auth_bloc.dart';
import 'package:taxi_app/dialog/loading_dialog.dart';
import 'package:taxi_app/dialog/msg_dialog.dart';
import 'package:taxi_app/screens/auth_screens/register.dart';
import 'package:taxi_app/screens/home_screens/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  bool _isShowPass = false;

  final AuthBloc _authBloc = AuthBloc();

  @override
  void dispose() {
    _authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 30.0),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Image.asset('ic_car_green.png'),
              const SizedBox(height: 40),
              const Text(
                'Welcome back!',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xff606470),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0),
              ),
              const Text(
                'Login continue using iCab',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xff606470),
                    letterSpacing: 1.0),
              ),
              const SizedBox(height: 40),
              StreamBuilder(
                  stream: _authBloc.emailStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        label: const Text('Email'),
                        prefixIcon: SizedBox(
                          width: 50.0,
                          child: Image.asset('ic_mail.png'),
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffCED0D2),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(6.0),
                            )),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    );
                  }),
              const SizedBox(height: 20),
              Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  StreamBuilder(
                      stream: _authBloc.passStream,
                      builder: (context, snapshot) {
                        return TextField(
                          controller: _passController,
                          obscureText: !_isShowPass,
                          decoration: InputDecoration(
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            label: const Text('Password'),
                            prefixIcon: SizedBox(
                              width: 50.0,
                              child: Image.asset('ic_lock.png'),
                            ),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffCED0D2),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(6.0),
                                )),
                          ),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isShowPass = !_isShowPass;
                          });
                        },
                        child: Text(
                          _isShowPass ? 'HIDE' : 'SHOW',
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                  alignment: AlignmentDirectional.centerEnd,
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(fontSize: 16.0, color: Color(0xff606470)),
                  )),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    _onLoginClick();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xff3277D8),
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(6.0)))),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                    text: 'New user? ',
                    style: const TextStyle(
                        fontSize: 16.0, color: Color(0xff606470)),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Register()));
                          }),
                        text: 'Sign up for a new account',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xff3277D8),
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLoginClick() {
    String _email = _emailController.text;
    String _pass = _passController.text;
    bool isValidateSingIn = _authBloc.isValidateSignIn(_email, _pass);

    if (isValidateSingIn) {
      LoadingDialog.showLoadingDialog(context, 'Loadding...');
      _authBloc.signIn(_email, _pass, () {
        LoadingDialog.hideLoadingDialog(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
      }, (msg) {
        LoadingDialog.hideLoadingDialog(context);
        MsgDialog.showMsgDialog(context, 'Sign-In', msg);
      });
    }
  }
}
