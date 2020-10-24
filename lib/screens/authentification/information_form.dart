import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindmates/screens/authentification/sign_in.dart';
import 'package:mindmates/screens/home/appBar.dart';
import 'package:mindmates/screens/wrapper.dart';
import 'package:mindmates/services/auth.dart';
import 'package:mindmates/shered/constants.dart';
import 'package:mindmates/shered/loading.dart';
import 'package:page_transition/page_transition.dart';

// Fill name
class FillName extends StatefulWidget {
  final String email, password;
  FillName(this.email, this.password);

  @override
  _FillNameState createState() => _FillNameState();
}

class _FillNameState extends State<FillName> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  // int _age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0f0f0f),
        elevation: 0.0,
        title: Text('You\'re new? give us your name ?'),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (val) => val.length == 0 ? 'Input your name' : null,
                decoration: inputFieldDeco.copyWith(hintText: "Name"),
                onChanged: (val) {
                  setState(() {
                    _name = val;
                  });
                },
              ),
              RaisedButton(
                child: Text("Next"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FillAge(widget.email, widget.password, _name),
                        ));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Fill age
class FillAge extends StatefulWidget {
  final String email, password, name;
  FillAge(this.email, this.password, this.name);
  @override
  _FillAgeState createState() => _FillAgeState();
}

class _FillAgeState extends State<FillAge> {
  final _formKey = GlobalKey<FormState>();
  String _age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0f0f0f),
        elevation: 0.0,
        title: Text('How old are you ?'),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextField(
                decoration: new InputDecoration(labelText: "Age"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (val) {
                  _age = val;
                },
              ),
              RaisedButton(
                child: Text("Next"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FillSexe(
                              widget.email, widget.password, widget.name, _age),
                        ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Fill sexe
class FillSexe extends StatefulWidget {
  final String email, password, name, age;
  FillSexe(this.email, this.password, this.name, this.age);

  @override
  _FillSexeState createState() => _FillSexeState();
}

class _FillSexeState extends State<FillSexe> {
  final _formKey = GlobalKey<FormState>();
  String _sexe = '', _error = '';
  Auth_service _auth = Auth_service();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    if (loading) return Loading();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0f0f0f),
        elevation: 0.0,
        title: Text('What is your gender ?'),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (val) =>
                    val != "M" && val != "F" ? 'Input your gender (M/F)' : null,
                decoration: inputFieldDeco.copyWith(hintText: "Sexe"),
                onChanged: (val) {
                  _sexe = val;
                },
              ),
              RaisedButton(
                child: Text("Next"),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() => loading = true);

                    dynamic result = await _auth.registerEmail(widget.email,
                        widget.password, widget.name, widget.age, _sexe);

                    setState(() => loading = false);

                    if (result == null) {
                      setState(() {
                        _error = "Couldn't sign you in with these credential";
                      });
                    } else {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    }
                  }
                },
              ),
              SizedBox(
                height: 30,
                child: Text(_error, style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
