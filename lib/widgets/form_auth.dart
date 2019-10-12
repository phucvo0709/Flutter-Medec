import 'package:fl_medec/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthMode { SignUp, Login }

class FormAuth extends StatefulWidget {
  FormAuth({
    Key key,
  }) : super(key: key);
  @override
  _FormAuthState createState() => _FormAuthState();
}

class _FormAuthState extends State<FormAuth> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  bool _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_authMode == AuthMode.Login) {
      //lOGIN
      await Provider.of<AuthProvider>(context, listen: false).signId(
        _authData['email'],
        _authData['password'],
      );
    } else {
      //REGISTER
      await Provider.of<AuthProvider>(context, listen: false).signUp(
        _authData['email'],
        _authData['password'],
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SignUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                style: TextStyle(
                  color: Color(0xFF313450),
                ),
                decoration: InputDecoration(
                  hintText: 'example@gmail.com',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF6E78F7),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF6E78F7),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFF4D4D),
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFF4D4D),
                    ),
                  ),
                ),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return 'Invalid email!';
                  }
                },
                onSaved: (value) {
                  _authData['email'] = value;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                autofocus: false,
                enableInteractiveSelection: false,
                style: TextStyle(
                  color: Color(0xFF313450),
                ),
                decoration: InputDecoration(
                  hintText: 'Password',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF6E78F7),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF6E78F7),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFF4D4D),
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFF4D4D),
                    ),
                  ),
                ),
                obscureText: true,
                controller: _passwordController,
                validator: (value) {
                  if (value.isEmpty || value.length < 5) {
                    return 'Password is too short!';
                  }
                },
                onSaved: (value) {
                  _authData['password'] = value;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              _authMode == AuthMode.SignUp
                  ? TextFormField(
                      autofocus: false,
                      enableInteractiveSelection: false,
                      enabled: _authMode == AuthMode.SignUp,
                      style: TextStyle(
                        color: Color(0xFF313450),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF6E78F7),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF6E78F7),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF4D4D),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF4D4D),
                          ),
                        ),
                      ),
                      obscureText: true,
                      controller: _confirmPasswordController,
                      validator: _authMode == AuthMode.SignUp
                          ? (value) {
                              if (value != _passwordController.text) {
                                return 'Password do not match!';
                              }
                            }
                          : null,
                    )
                  : SizedBox(
                      height: 16.0,
                    ),
              _authMode == AuthMode.SignUp
                  ? SizedBox(
                      height: 32.0,
                    )
                  : SizedBox(),
              if (_isLoading)
                CircularProgressIndicator()
              else
                RaisedButton(
                  child: Text(
                    _authMode == AuthMode.Login ? 'Login' : 'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  onPressed: _submit,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 75.0,
                    vertical: 15.0,
                  ),
                  color: Color.fromRGBO(110, 120, 247, 1),
                  textColor: Color.fromRGBO(236, 236, 236, 1),
                ),
              FlatButton(
                child: Text(
                  '${_authMode == AuthMode.Login ? 'Create new account' : 'You have account?'}',
                ),
                onPressed: _switchAuthMode,
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4.0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                textColor: Color.fromRGBO(110, 120, 247, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
