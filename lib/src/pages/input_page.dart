import 'package:flutter/material.dart';



class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';



  List<String> _poderes = ['Volar', 'Rayos X', 'Super aliento', 'Super fuerza'];
  TextEditingController _inputFieldDateControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
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

  Widget _crearInput(){
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;  
        });
      },
    );
  }


  Widget _crearEmail(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.email),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor){
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearPassword(){
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (valor){
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context){
   return TextField(
     enableInteractiveSelection: false,
     controller: _inputFieldDateControler,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    ); 
  }

  _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
      );
      if(picked!=null){
        setState(() {
          _fecha = picked.toString();
          _inputFieldDateControler.text = _fecha;
        });
      }
  }



  Widget _crearDropdown(){
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        Expanded(
            child: DropdownButton(
              value: _opcionSeleccionada,
              items: getOpcionesDropdown(),
              onChanged: (opt){
                setState(() {
                  _opcionSeleccionada = opt;

                });
              },
            ),
        )
      ],
    );
    
    
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(){
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) { 
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
     });
     return lista;
  }

  Widget _crearPersona(){
    return ListTile(
      title: Text('Nombre: ${_nombre}'),
      subtitle: Text('Email: ${_email}'),
      trailing: Text(_opcionSeleccionada),
    );
  }


}