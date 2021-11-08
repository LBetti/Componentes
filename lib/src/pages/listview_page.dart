import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros =new List();
  int _ultimoItem = 0;
  bool _isLoading=false;

  @override
  void initState() {
    super.initState();
    _agregar10();


    _scrollController.addListener(() {

      if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent ) {

               fetchData();

      }
    });
  }

@override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
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
    body:Stack(
      children:<Widget>[
    _crearLista(), 
    _crearLoading(), 
      ],
    )
    
    
    
    );
  }

  Widget _crearLista(){

return RefreshIndicator(

  onRefresh: ObtenerPagina1,

  child:   ListView.builder(
  
    controller: _scrollController,
  
    itemCount: _listaNumeros.length,
  
    itemBuilder: (BuildContext context , int index){
  
      
  
      final imagen = _listaNumeros[index];
  
      
  
      return FadeInImage(
  
        placeholder: AssetImage('assets/borussia-dortmund-dortmund.gif'), 
  
        image: NetworkImage('https://picsum.photos/500/300?random=$imagen')
  
        );
  
    },
  
    ),
);

  }


Future<Null>ObtenerPagina1() async{

final duration = new Duration(seconds:2);
new Timer(duration ,(){
_listaNumeros.clear();
_ultimoItem++;
_agregar10();

} );

return Future.delayed(duration);

}

void respuestaHTTP(){

  _isLoading=false;

  _scrollController.animateTo(
    _scrollController.position.pixels+100,
    curve: Curves.fastOutSlowIn,
    duration:Duration(microseconds: 200),
    
    );

  _agregar10();

  }

Future <Null> fetchData() async{

    _isLoading=true;

    setState(() {
      
    });


    final duration = new Duration (seconds:2);
    return new Timer(duration, respuestaHTTP);

  }

  void _agregar10(){

    for (var i = 1; i < 10; i++) {

      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
      
    }

    setState(() {
      
    });
  



  }

  Widget _crearLoading(){

    if (_isLoading) {

      return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,

        children:<Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              CircularProgressIndicator()
            ]
            ),
            SizedBox(height:15.0)
        ],
      );
      
       CircularProgressIndicator();
      
  
    }else{
      return Container();
    }

  }
}