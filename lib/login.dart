import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Login> {
  String _email;
  String _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(30.0,40.0,0,0),
                        child: Text(
                          'The Greyers Online Shoping',
                          style: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0,30.0,0,0),
                  child: Text(
                    'Login Here',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.green[600],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0,10.0, 20.0, 0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Email',
                        ),
                        validator: (String value){
                          if(value.isEmpty){
                            return 'Email is Required';
                          }
                          if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        onSaved: (String value){
                          this._email = value;
                        },
                      ),
                      SizedBox(height: 15.0,),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Password'
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        validator: (String value){
                          if(value.isEmpty){
                            return 'Password is Required';
                          }
                          return null;
                        },
                        onSaved: (String value){
                          this._password = value;
                        },
                      ),
                      SizedBox(height: 15.0,),
                      Container(
                        alignment: Alignment(1,0),
                        padding: EdgeInsets.fromLTRB(20.0, 5.0, 10.0, 0.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed('/forgot_password');
                          },
                          child: Text(
                            'Forget Password',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: (){
                              if(!_formkey.currentState.validate()){
                                return ;
                              }

                              _formkey.currentState.save();
                              print(_email);
                              print(_password);
                              Navigator.of(context).pushNamed('/home_page');
                            },
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Material(
                          elevation: 0,
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushNamed('/facebook');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: ImageIcon(
                                      AssetImage('asset/facebook.png')
                                  ),
                                ),
                                SizedBox(width: 6.0,),
                                Center(
                                  child: Text(
                                    'Login with facebook',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0,
                            ),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: ImageIcon(
                                    AssetImage('asset/arrow_left-512.png')
                                ),
                              ),
                              SizedBox(width: 6.0,),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Center(
                                  child: Text(
                                    'GO BACK',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New to spotify',
                    ),
                    SizedBox(width: 4.0,),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
