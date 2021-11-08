import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  
  double _valorSlider = 100.0;

  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
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

 body:
  Container(
    color: Colors.black,
   padding: EdgeInsets.only(top:50.0),
   child:Column(
     children:<Widget>[
       _crearSlider(),
       _checkBox(),
       Expanded(
         child: _crearImagen()
         ),
     ],
   ),
 ),
    );
  }

  Widget _crearSlider(){

  return Slider(
    inactiveColor: Colors.black,
    activeColor: Colors.yellow,
    label: 'Tamaño de la imagen',
    value: _valorSlider,
    //divisions: 20,
    min: 10.0,
    max: 400.0,
    onChanged:(_bloquearCheck) ? null :(valor){
  _valorSlider = valor;
      setState(() {
        
      });

    },
  );

  }


  Widget _checkBox(){

    //return Checkbox(
      
       
      // );


  return CheckboxListTile(
    title: Text('Bloquear Slider') ,
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck=valor;

        });
      },);

  }



  Widget _crearImagen(){

    return Image(
      image:NetworkImage('https://www.picclickimg.com/d/l400/pict/182981104978_/1-kleiner-Aufkleber-BVB-Herz-Weil.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
      );

  }

}