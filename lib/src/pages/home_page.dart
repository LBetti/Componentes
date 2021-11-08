import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar (
        title: Text('Componentes') ,
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
 backgroundColor: Colors.white,
body: _lista(),
    );

  }


  Widget _lista() {

//menuProvider.cargarData().

return FutureBuilder(

  future: menuProvider.cargarData(),
  initialData: [],
  
  builder:(context, AsyncSnapshot<List<dynamic>> snapshot){


return ListView(
      
      children: _listaItems(snapshot.data , context ),
   
   );
  
  },

);


  }

  List <Widget> _listaItems(List<dynamic> data, BuildContext context) {

   
    final List <Widget> opciones = [];

  
    data.forEach((opt) { 

      final WidgetTemp = ListTile(

        title: Text (opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.arrow_right, color: Colors.black),
        tileColor: Colors.white,
        onTap: (){

          
          Navigator.pushNamed(context, opt['ruta']);
          
          //final route = MaterialPageRoute(
            //builder: (context){
            //return AlertPage();
            //}
         // );
          //Navigator.push(context, route);
      
        },
      );

      opciones..add(WidgetTemp)
      ..add(Divider());

    });
  return opciones;

  }
  
}

