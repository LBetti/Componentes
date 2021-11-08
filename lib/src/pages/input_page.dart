import 'package:flutter/material.dart';

class inputPage extends StatefulWidget {
  @override
  _inputPageState createState() => _inputPageState();
}

class _inputPageState extends State<inputPage> {

  String _nombre='';
  String _email='';
  String _fecha='';

String _opcionSeleccionada = 'Medio campo';
List<String> _posiciones=['Medio campo', 'Medio campo ofensivo' , 'Falso nueve' , 'Lateral Izquierdo'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
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
        padding: EdgeInsets.symmetric(horizontal:10.0 , vertical:20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
            Divider(),
            _crearPassword(),
            Divider(),
             _crearFecha(context),
            Divider(),
            _crearDropdown(),
            Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

Widget _crearInput() {

  return TextField(
autofocus: true,
textCapitalization: TextCapitalization.sentences,
decoration: InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(17.0)
  ),
  hintText: 'Nombre de usuario',
  labelText: 'Nombre',
  helperText: 'Solo el nombre',
  suffixIcon: Icon(Icons.accessibility_new_rounded, color: Colors.black),
  icon: Icon(Icons.account_box, color: Colors.black,),
),
onChanged: (valor){
  setState(() {
    _nombre=valor;
  });

},
  );
}

  Widget _crearEmail(){
  return TextField(
    keyboardType: TextInputType.emailAddress,
decoration: InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(17.0)
  ),
  hintText: 'Usuario de Email',
  labelText: 'Email',
  helperText: 'Solo el Email',
  suffixIcon: Icon(Icons.alternate_email_rounded , color: Colors.black),
  icon: Icon(Icons.email, color: Colors.black,),
),
onChanged: (valor){
  setState(() {
    _email=valor;
  });

},
  );
}

Widget _crearFecha(BuildContext context){
return TextField(
  enableInteractiveSelection: false,
  controller: _inputFieldDateController,
decoration: InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(17.0)
  ),
  hintText: 'Fecha de Nacimiento',
  labelText: 'Fecha de Nacimiento',
  suffixIcon: Icon(Icons.calendar_today_rounded , color: Colors.black),
  icon: Icon(Icons.calendar_view_day ,color: Colors.black,),
),
onTap: (){
FocusScope.of(context).requestFocus(new FocusNode());
_selectDate(context);

},
  );

}

_selectDate(BuildContext context)async{

DateTime picked = await showDatePicker(
  context: context, 
  initialDate: new DateTime.now(), 
  firstDate:new DateTime(1930), 
  lastDate: new DateTime(2022),
  locale: Locale('es' , 'ES'),
);

if(picked!=null){
setState(() {
  _fecha=picked.toString();
  _inputFieldDateController.text=_fecha;
});
}
}

List <DropdownMenuItem<String>>getOpcionesDropdown(){

List<DropdownMenuItem<String>> lista = new List();

_posiciones.forEach((posicion) { 

  lista.add(DropdownMenuItem(
    child:Text(posicion),
    value: posicion,
    
    
    ));
});

return lista;

}

Widget _crearDropdown(){

return Row(

children: <Widget>[
  Icon(Icons.circle),
  SizedBox(width: 15.0,),
  DropdownButton(
    value:_opcionSeleccionada,
    items: getOpcionesDropdown(
      
    ), 
    onChanged: (opt){
      setState(() {
        _opcionSeleccionada = opt;
      });
    },
    )],

);

}

Widget _crearPersona(){
  
  return ListTile(
    title:Text ('Su nombre es $_nombre'),
    subtitle: Text('Su email es $_email'),
    trailing: Text(_opcionSeleccionada),
  );
}

Widget _crearPassword(){

return TextField(
obscureText: true,
decoration: InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(17.0)
  ),
  hintText: 'Su contraseña',
  labelText: 'Password',
  helperText: 'Solo la contraseña',
  suffixIcon: Icon(Icons.lock , color: Colors.black),
  icon: Icon(Icons.lock_sharp, color: Colors.black,),
),

  );

}


}