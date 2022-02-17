import 'package:flutter/material.dart';
import 'package:e_commerce_app/constant/data_json.dart';
import 'package:e_commerce_app/pages/product_detail_page.dart';
import 'package:e_commerce_app/theme/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple,
      body: getBody(),
    );
  }
  Widget getBody(){
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 20,
                left: 12,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("The Greyers Online Shopping",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),),
                Row(
                  children: <Widget>[
                    InkWell(
                     child: Icon(
                          Icons.search,
                          color: Colors.green[700]
                      ),
                      onTap: (){

                      },
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){

                      },
                      child: Icon(
                          Icons.shopping_cart,
                          color: Colors.green[700]
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(right: 20,left: 20),
              child: Row(children: List.generate(menuItems.length, (index){
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        activeMenu = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: activeMenu == index ? clr1 : Colors.transparent,width: 2))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(menuItems[index],style: TextStyle(
                            fontSize: 17,
                            color: Colors.green[700],
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),
                  ),
                );
              })
              ),
            ),
          ),
          SizedBox(height: 30,),
          Wrap(
            children: List.generate(dataItems.length, (index){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailPage(id: dataItems[index]['id'].toString(),
                    name: dataItems[index]['name'],
                    code: dataItems[index]['code'],
                    img: dataItems[index]['img'],
                    price: dataItems[index]['price'].toString(),
                    promotionPrice: dataItems[index]['promotionPrice'].toString(),
                    size: dataItems[index]['size'],
                    color: dataItems[index]['color'],
                  )));
                },
                child: Card(
                  color: Colors.purple,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Hero(
                          tag: dataItems[index]['id'].toString(),
                          child: Container(
                            width: (size.width-16)/2,
                            height: (size.width-16)/2,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(dataItems[index]['img']),fit: BoxFit.cover)
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(dataItems[index]['code'],style: TextStyle(
                              fontSize: 16,
                              color: Colors.green[700],
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(dataItems[index]['price'].toString()+" USD",style: TextStyle(
                              fontSize: 15,
                              color: Colors.green[700],
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        SizedBox(height: 10,),
                      ],
                    )
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}