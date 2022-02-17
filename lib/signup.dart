import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _name ;
  String _email;
  String _password;
  String _address;
  String _phoneNumber;
  bool _genderM = false;
  bool _genderF = false;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.purple,
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40.0,30,0,0),
                    child: Text(
                      'Sign Up Here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.green[600],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0,2.0, 20.0, 20),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Name'
                        ),
                        maxLength: 20,
                        validator: (String value){
                          if(value.isEmpty){
                            return 'Name is Required';
                          }
                          return null;
                        },
                        onSaved: (String value){
                          this._name = value;
                        },
                      ),

                      SizedBox(height: 1.0,),

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Email'
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
                      SizedBox(height: 5.0,),
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
                      SizedBox(height: 5.0,),
                        SizedBox(height: 1,),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                        ),
                        maxLength: 11,
                        keyboardType: TextInputType.phone,
                        validator: (String value){
                          if(value.isEmpty){
                            return 'Phone Number is Required';
                          }
                          return null;
                        },
                        onSaved: (String value){
                          this._phoneNumber = value;
                        },
                      ),
                      SizedBox(height: 2,),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Address'
                        ),
                        validator: (String value){
                          if(value.isEmpty){
                            return 'Address is Required';
                          }
                          return null;
                        },
                        onSaved: (String value){
                          this._address = value;
                        },
                      ),
                      SizedBox(height: 20,),
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
                              print(_name);
                              print(_email);
                              print(_password);
                              print(_genderM);
                              print(_genderF);
                              print(_phoneNumber);
                              print(_address);
                              Navigator.of(context).pushNamed('/registered');
                            },
                            child: Center(
                              child: Text(
                                'SIGNUP',
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
