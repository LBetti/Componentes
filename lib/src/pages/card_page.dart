import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
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

 body: ListView(
   
   children: <Widget> [

     _cardTipo1(),

    SizedBox(height:30),
     
     _cardTipo2(),

     SizedBox(height:30),

      _cardTipo1(),

    SizedBox(height:30),
     
     _cardTipo2(),

     SizedBox(height:30),

     _cardTipo1(),

    SizedBox(height:30),
     
     _cardTipo2(),

     SizedBox(height:30),
     _cardTipo1(),

    SizedBox(height:30),
     
     _cardTipo2(),

     SizedBox(height:30),
     _cardTipo1(),

    SizedBox(height:30),
     
     _cardTipo2(),

     SizedBox(height:30),


 ],

 ),
      );
  }

  Widget _cardTipo1(){
return Center(
    child: Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15.0) ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.photo_album , color: Colors.black,),
            title: Text('Titulazo'),
            subtitle: Text('El término BVB - pronunciado en alemán “be-fao-be” - tiene su origen en el nombre oficial en alemán del Borussia Dortmund, Ballspielverein Borussia 09 e.V Dortmund'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('HEJA BVB'),
                onPressed: () { /* ... */ },
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('NO HEJA :('),
                onPressed: () { /* ... */ },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    ),
    
  );
  }
}

Widget _cardTipo2(){
final card= Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/QPgd.gif'), 
            image: NetworkImage('https://i.ytimg.com/vi/f4ipvQ87lKE/maxresdefault.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
            ),
          
         // Image(
           // image:NetworkImage('https://i.ytimg.com/vi/f4ipvQ87lKE/maxresdefault.jpg') ,
            
            //),

            Container(
              child: Text('On the track of the lost trophy'),
              padding: EdgeInsets.all(10.0),
              )
        ]
      ),
    );
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black,
            blurRadius: 19.9,
            spreadRadius: 2.0,
            offset: Offset(5.0,7.0)
          )
        ],
        color: Colors.yellow[300],
     ),
     child:ClipRRect(
       borderRadius: BorderRadius.circular(35.0),
       child: card,
     ),
    );
  }

