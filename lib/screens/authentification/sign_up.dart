import 'package:flutter/material.dart';
import 'package:mindmates/services/auth.dart';
import 'package:mindmates/shered/constants.dart';
import 'package:mindmates/shered/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final Auth_service _auth = Auth_service();
  String _email = '', _password = '';
  String _error = "";
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown,
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Register'),
              actions: <Widget>[
                FlatButton.icon(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      widget.toggleView();
                    },
                    label: Text('Sign in'))
              ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: inputFieldDeco.copyWith(hintText: "Email"),
                        validator: (value) =>
                            value.isEmpty ? 'Enter email' : null,
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration:
                            inputFieldDeco.copyWith(hintText: "Password"),
                        obscureText: true,
                        validator: (value) =>
                            value.length < 6 ? 'Password too short' : null,
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      RaisedButton(
                        color: Colors.pink,
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => _loading = true);
                            dynamic result =
                                await _auth.registerEmail(_email, _password);
                            if (result == null) {
                              setState(() {
                                _loading = false;
                                _error = "Could not register";
                              });
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: 30,
                        child:
                            Text(_error, style: TextStyle(color: Colors.red)),
                      )
                    ],
                  ),
                )),
          );
  }
}
