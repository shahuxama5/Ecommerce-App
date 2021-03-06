import 'package:flutter/material.dart';
import 'package:e_commerce_app/theme/colors.dart';

class ProductDetailPage extends StatefulWidget {
  final String id;
  final String name;
  final String code;
  final String img;
  final String price;
  final String promotionPrice;
  final List size;
  final List color;

  const ProductDetailPage(
      {
        Key key,
        this.id,
        this.name,
        this.code,
        this.img,
        this.price,
        this.promotionPrice,
        this.size,
        this.color,
      }
      ) : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int activeSize = 0;
  int activeColor = 0;
  String activeImg = '';
  int qty = 1;
  @override
  void initState() {
    super.initState();
    setState(() {
      activeImg = widget.img;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: getBody(),
      bottomSheet: getBottom(),
    );
  }
  Widget getBottom(){
    var size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: size.width,
      child: FlatButton(
          color: clr1,
          onPressed: (){
            
          },
          child: Text("ADD TO CART",style: TextStyle(
          fontSize: 18,
          color: clr2,
            fontWeight: FontWeight.bold,
      ),)),
    );
  }
  Widget getBody(){
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.green[700]
                    )),
              ),
            ),
            SizedBox(height: 10,),
            Card(
              elevation: 2,
              child: Hero(
                tag: widget.id.toString(),
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(activeImg),fit: BoxFit.cover)
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Name :",style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(width: 20,),
                  Flexible(
                    child: Text(widget.name,style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Colors.green[700],
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Code :",style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(width: 20,),
                  Flexible(
                    child: Text(widget.code,style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Colors.green[700],
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Price :",style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(width: 20,),
                  Flexible(
                      child: Row(children: <Widget>[
                        Text(widget.promotionPrice+" USD",style: TextStyle(
                            fontSize: 16,height: 1.5,
                            color: Colors.green[700],
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(width: 20,),
                        Text(widget.price+" USD",style: TextStyle(
                            fontSize: 20,height: 1.5,
                            color: clr3,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,

                        ),)
                      ],)
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Size :",style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(width: 20,),
                  Flexible(
                      child: Wrap(
                          children: List.generate(widget.size.length, (index){
                            return Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    activeSize = widget.size[index]['id'];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: activeSize == widget.size[index]['id'] ? clr1 : Colors.transparent,

                                      ),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 2,bottom: 12,right: 15,left: 15),
                                    child: Text(widget.size[index]['value'],style: TextStyle(
                                        fontSize: 16,
                                        height: 1.5,
                                        color: Colors.green[700],
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ),
                                ),
                              ),
                            );
                          })
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Color :",style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(width: 20,),
                  Flexible(
                      child: Wrap(
                          children: List.generate(widget.color.length, (index){
                            return Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    activeColor = widget.color[index]['id'];
                                    activeImg = widget.color[index]['value'];
                                  });
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(widget.color[index]['value']),fit: BoxFit.cover),
                                      border: Border.all(
                                        width: 2,
                                        color: activeColor == widget.color[index]['id'] ? clr2 : Colors.transparent,

                                      ),
                                      borderRadius: BorderRadius.circular(5)
                                  ),

                                ),
                              ),
                            );
                          })
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Qty :",style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(width: 20,),
                  Flexible(
                      child: Row(
                        children: <Widget>[
                          InkWell(
                            onTap: (){
                              if(qty > 1){
                                setState(() {
                                  qty = --qty;
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: clr3.withOpacity(0.5)
                                  )
                              ),
                              width: 35,
                              height: 35,
                              child: Icon(Icons.exposure_minus_1,color: clr1.withOpacity(0.5),),
                            ),
                          ),
                          SizedBox(width: 25,),
                          Text(qty.toString(),style: TextStyle(
                              fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(width: 25,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                qty = ++qty;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: clr2.withOpacity(0.5)
                                  )
                              ),
                              width: 35,
                              height: 35,
                              child: Icon(Icons.plus_one,color: clr3.withOpacity(0.5),),
                            ),
                          )
                        ],
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}