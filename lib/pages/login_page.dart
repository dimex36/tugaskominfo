import 'package:flutter/material.dart';
import 'package:flutter_stream_listener/flutter_stream_listener.dart';

import '../bloc/login_bloc.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();
  final _password = TextEditingController();

  final bloc = LoginBloc();

  bool obsecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: StreamListener<LoginState>(
              stream: bloc.state, // Stream being subscribed to
              onData: (data) {
                if (data is LoginLoading) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(child: CircularProgressIndicator()),
                              SizedBox(height: 16),
                              Text("Please wait..."),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (data is LoginError) {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(data.message),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (data is LoginSuccess) {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              onError: (error, stackTrace) {
                // Optionally handle errors in the Stream
              },
              onDone: () {
                // Optionally react to when the Stream is closed
              },
              cancelOnError: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: Text("Email"),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Field ini wajib diisi';
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _password,
                    obscureText: obsecurePassword,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsecurePassword = !obsecurePassword;
                          });
                        },
                        icon: Icon(obsecurePassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      label: Text("Password"),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Field ini wajib diisi';
                      }
                    },
                  ),
                  // Expanded(child: Container()),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          bloc.login({
                            'email': _email.text,
                            'password': _password.text
                          });
                        }
                      },
                      child: Text("Login"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
