import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipoUno(),
          SizedBox(height: 30.0),
          _cardTipoDos(),
          SizedBox(height: 30.0),
          _cardTipoDos(),
          SizedBox(height: 30.0),
          _cardTipoDos(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  //Card de tipo uno
  Widget _cardTipoUno(){

    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text('Este es un subtitulo de esta tarjeta, lorem impsum lorem lorelrekjaskdas jdka '),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: (){},
              ),            ],
          ),
        ],
      ),
    );
    
  }//Fin de card tipo uno

  //card tipo dos
   Widget _cardTipoDos(){
     final card =  Container(
       child: Column(
         children: <Widget>[
           FadeInImage(
             image: NetworkImage('https://lh3.googleusercontent.com/-H6PacdskbPehw_P3NQvLvIix3PK3gNC82AZXhpFhYm5PVY26CqyHieUp_jifhmYY-FrcezAVQ=w640-h400-e365'),
             placeholder: AssetImage('assets/original.gif'),
             fadeInDuration: Duration( milliseconds: 200 ),
             height: 250.0,
             fit: BoxFit.cover,
           ),
          //  Image(
          //    image: NetworkImage('https://lh3.googleusercontent.com/-H6PacdskbPehw_P3NQvLvIix3PK3gNC82AZXhpFhYm5PVY26CqyHieUp_jifhmYY-FrcezAVQ=w640-h400-e365'),

          //  ),
           Container(
             padding: EdgeInsets.all(10.0),
             child: Text('Texto de prueba'),
           ),
         ],
       ),
     );
    return Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          30.0          
        ),
        child: card,
      ),
    );
   }//Fin card tipo dos


}