import 'package:flutter/material.dart';

class Registered extends StatefulWidget {
  @override
  _RegisteredState createState() => _RegisteredState();
}

class _RegisteredState extends State<Registered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5,30,0,5),
                child: Text('Your Account Has Been Registered...',
                  style: TextStyle(
                    color: Colors.green[500],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Image(image: AssetImage('asset/accreg.jpg')),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(5,10,0,5),
                child: Text('Now you can login into our Page',
                  style: TextStyle(
                    color: Colors.green[500],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Row(
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
                            fontWeight: FontWeight.bold,
                          fontSize: 17
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

        ),
      ),
    );
  }
}
