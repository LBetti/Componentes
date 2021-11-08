import 'package:flutter/material.dart';

class  HomePageTemp extends StatelessWidget {

  final opciones =['Uno' , 'Dos' , 'Tres', 'Cuatro' , 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),


  body: ListView(
    //children: _crearItems()
    children: _crearItemsCorta()
      ),
    );
  }

  
  List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();

  for (var opt in opciones) {
    
    final tempWidget =ListTile(

    title : Text(opt),

    );

   lista..add (tempWidget)
  ..add(Divider(height: 20, color:Colors.black,));
  }

    return lista;
  }

List<Widget> _crearItemsCorta(){

return opciones.map((item){

return Column(
  children: [
        ListTile(

    title: Text(item + '!'),
    subtitle: Text('BVB'),
    leading: Icon(Icons.arrow_circle_up_sharp),
    trailing: Icon(Icons.arrow_back_outlined),
    onTap: (){},

    ),
    Divider()
  ],
);



}).toList();


}


}