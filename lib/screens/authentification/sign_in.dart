import 'package:flutter/material.dart';
import 'package:mindmates/services/auth.dart';
import 'package:mindmates/shered/constants.dart';
import 'package:mindmates/shered/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final Auth_service _auth = Auth_service();
  String _email = '', _password = '';
  String _error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    if (loading) return Loading();
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              onPressed: () {
                widget.toggleView();
              },
              label: Text('Register'))
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
                  validator: (value) => value.isEmpty ? 'Enter email' : null,
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: inputFieldDeco.copyWith(hintText: "Password"),
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
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);

                      dynamic result =
                          await _auth.signInEmail(_email, _password);

                      if (result == null)
                        setState(() {
                          loading = false;
                          _error = "Couldn't sign you in with these credential";
                        });
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                  child: Text(_error, style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          )),
    );
  }
}
