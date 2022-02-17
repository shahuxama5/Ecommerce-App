import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget buildSeparators(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 10)),
        Text(
          name,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ],
    );
  }

  Widget buildTile(String name, String path, String imgPath) {
    return ListTile(
      leading: Image.asset(
        imgPath,
        scale: 1.2,
      ),
      title: Text(name),
      onTap: () {
        if ( path != '/login' && path != '/signup' && path != '/home_page' )
          Navigator.pop(context);
        else
          Navigator.pushNamed(context, path);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text(
            "Categories",
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[

            Expanded(
              flex: 2,
              child: UserAccountsDrawerHeader(
                accountName: Text("Usama Mehmood Shah",
                  style: TextStyle(
                    fontSize:20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                    fontStyle: FontStyle.italic,
                  ),
                ),
                accountEmail: Text("usamamehmood62000@gmail.com",
                  style: TextStyle(
                    fontSize:17.0,
                    color: Colors.grey[500],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.purple,
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("asset/logo.png"),
                  radius: 50,

                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    buildTile(
                      "Shopping",
                      "/home_page",
                      'asset/sofa.png',
                    ),
                    buildSeparators("Registeration"),
                    buildTile(
                      "Login",
                      "/login",
                      'asset/login.png',
                    ),
                    buildTile(
                      "SignUp",
                      "/signup",
                      'asset/registeration_ico.png',
                    ),
                    Divider(),
                    buildSeparators("Help Center"),
                    buildTile(
                      "Feedback",
                      "/feedback",
                      'asset/feedback.png',
                    ),
                    buildTile(
                      "How to order",
                      "/feedback",
                      'asset/info.png',
                    ),
                    buildTile(
                      "Shipping",
                      "/feedback",
                      'asset/shipping.png',
                    ),
                    buildTile(
                      "Questions and Assistance",
                      "/feedback",
                      'asset/assistance.png',
                    ),
                    buildTile(
                      "About payment",
                      "/feedback",
                      'asset/visa.png',
                    ),
                    Divider(),
                    buildSeparators("Public Policy"),
                    buildTile(
                      "Privacy Policy",
                      "/feedback",
                      'asset/policy.png',
                    ),
                    buildTile(
                      "Terms and Conditions",
                      "/feedback",
                      'asset/terms.png',
                    ),
                    buildTile(
                      "Return Policy",
                      "/feedback",
                      'asset/refund.png',
                    ),
                  ],
                ))
          ],
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(30.0,20.0,0,0),
              child: Text(
                'Welcome to ',
                style: TextStyle(
                  fontSize:30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[500],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30.0,20.0,0,0),
              child: Text(
                'The Greyers Online Shoping',
                style: TextStyle(
                  fontSize:45.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[500],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
      Container(
          padding: EdgeInsets.fromLTRB(30.0,40.0,20,0),
        child: Text(
            "Very valuable items that will surly stun anyone who look at it, Give it a try. The sure thing is that you won't regret it.",
          style: TextStyle(
            fontSize:20.0,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
          ],
        ),
      ),
    );
  }


}