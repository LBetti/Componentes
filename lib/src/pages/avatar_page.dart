import 'package:flutter/material.dart';

class  AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AvatarPage'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
                backgroundImage: NetworkImage('https://estaticos.sport.es/resources/jpg/3/3/1606259077033.jpg'),
              ),
          ),

          Container(
            margin: EdgeInsets.only(right:10.0),
            child: CircleAvatar(
              child: Text('BVB'),
              backgroundColor: Colors.black,
            ),
          ),
        ],
     centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Colors.black,
              Colors.yellow,
             ])          
         ),        
     ),      
 ),
     body: 
     Center(
       child:FadeInImage(
         placeholder: AssetImage('assets/borussia-dortmund-dortmund.gif'), 
         image: NetworkImage('https://img.fifa.com/image/upload/t_s2/e6qafccex5ropitysmdy.jpg'),
         fadeInDuration: Duration(milliseconds:200),
         ),
     ), 
    );
  }
}