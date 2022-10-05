import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/blocs/auth_bloc.dart';
import 'package:taxi_app/dialog/loading_dialog.dart';
import 'package:taxi_app/dialog/msg_dialog.dart';
import 'package:taxi_app/screens/auth_screens/login.dart';
import 'package:taxi_app/screens/home_screens/home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passTextEditingController =
      TextEditingController();

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
              Image.asset('ic_car_red.png'),
              const SizedBox(height: 40),
              const Text(
                'Wellcome Aboard!',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff606470),
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Signup with iCab in simple steps',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff606470),
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 40),
              StreamBuilder(
                  stream: _authBloc.nameStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _nameTextEditingController,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        labelText: "Name",
                        prefixIcon: SizedBox(
                          width: 50.0,
                          child: Image.asset('ic_user.png'),
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
                    );
                  }),
              const SizedBox(height: 20),
              StreamBuilder(
                  stream: _authBloc.phoneStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _phoneTextEditingController,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        labelText: "Phone number",
                        prefixIcon: SizedBox(
                          width: 50.0,
                          child: Image.asset('ic_phone.png'),
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
                    );
                  }),
              const SizedBox(height: 20),
              StreamBuilder(
                  stream: _authBloc.emailStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _emailTextEditingController,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        labelText: "Email",
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
                    );
                  }),
              const SizedBox(height: 20),
              Stack(alignment: AlignmentDirectional.centerEnd, children: [
                StreamBuilder(
                    stream: _authBloc.passStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _passTextEditingController,
                        obscureText: !_isShowPass,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          labelText: "Password",
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
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: GestureDetector(
                    onTap: showHidePassword,
                    child: Text(
                      _isShowPass ? 'HIDE' : 'SHOW',
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  signupclick();
                },
                child: const Text(
                  'Signup',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xff3277D8),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)))),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                    text: 'Already a Users? ',
                    style: const TextStyle(fontSize: 16.0, color: Color(0xff606470)),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                        ..onTap=(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login()));
                        },
                        text: 'Login now',
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

  void signupclick() {
    if (_authBloc.isValidate(
        _nameTextEditingController.text,
        _phoneTextEditingController.text,
        _emailTextEditingController.text,
        _passTextEditingController.text)) {
      LoadingDialog.showLoadingDialog(context, 'Loading...');
      _authBloc.signUp(
          _nameTextEditingController.text,
          _phoneTextEditingController.text,
          _emailTextEditingController.text,
          _passTextEditingController.text, () {
        LoadingDialog.hideLoadingDialog(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Home();
        }));
      }, (msg) {
        LoadingDialog.hideLoadingDialog(context);
        MsgDialog.showMsgDialog(context, "Sign-Up", msg);
      });
    }
  }

  showHidePassword() {
    setState(() {
      _isShowPass = !_isShowPass;
    });
  }
}
