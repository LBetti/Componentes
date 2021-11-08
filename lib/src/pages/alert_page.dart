import 'package:flutter/material.dart';

class  AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertPage'),
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
   child:RaisedButton(
     child:Text('Alerta') ,
     color: Colors.yellow[300],
     shape: StadiumBorder(),
     onPressed: ()=>_MostrarAlert(context),
    ) ,
   ),
     floatingActionButton: FloatingActionButton(
       backgroundColor: Colors.black,
       child: Icon(Icons.arrow_back),
  onPressed:(){
    Navigator.pop(context);
  }
     ), 
    );
  }
  void _MostrarAlert (BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0)),
            title: Text('Titulo'),
            content:Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Este es el contenido de la alerta'),
                Image(image: NetworkImage('https://www.futbox.com/img/v1/b22/c1e/aa6/5fd/0a5933cf574d81438461_zoom.png'),),
              ],
            ),
            actions: <Widget>[
            FlatButton(
              onPressed: ()=>Navigator.of(context).pop(),
              child:Text('Cancelar'),
               ),
                FlatButton(
              onPressed: ()=>Navigator.of(context).pop(),
              child:Text('Ok'),
               ),
            ]
          );

      }
      
      );

  }
}