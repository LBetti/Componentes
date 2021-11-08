import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

double _width=50.0;
double _height= 50.0;
Color _color = Colors.yellow;
BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('AnimatedContainer'),
     centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Colors.black,
              Colors.yellow
             ])          
         ),        
     ),      
 ),
      body: Center(
        child:AnimatedContainer(
          duration: Duration(seconds:1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius:_borderRadius,
            color: _color,
            ),
        ) ,
        ),
        floatingActionButton: FloatingActionButton(
          child:Icon(Icons.model_training_outlined) ,
          onPressed: _cambiarForma,
          ),
    );
  }
  void _cambiarForma(){

    final random=Random();

    _width=random.nextInt(200).toDouble();
    _height=random.nextInt(200).toDouble();
    _color=Color.fromRGBO(
      random.nextInt(200),
      random.nextInt(200),
      random.nextInt(200),
      1
    );

    _borderRadius =BorderRadius.circular(random.nextInt(100).toDouble());

    setState(() {
      
    });
  }
}