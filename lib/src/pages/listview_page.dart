import 'package:flutter/material.dart';



import 'dart:async';


class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _agregarDiez();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _fetchData();
      }
    });
  }

  //Cuando y ano estemos en la pantalla se libera memoria
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  //Cuerpo de la app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
      
      
      
    );
  }

  //Para crear la lista con las imagenes
  Widget _crearLista(){
    return RefreshIndicator(
          onRefresh: obtenerPaginaUno,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _listaNumeros.length,
            itemBuilder: (BuildContext context, int index){
              final imagen = _listaNumeros[index];
              return FadeInImage(
                image: NetworkImage('https://picsum.photos/200/300/?image=${imagen}'),
                placeholder: AssetImage('assets/original.gif'),
                fit: BoxFit.contain,
              );
            },
         ),
    );
  }
  //Future<void>
  Future<Null> obtenerPaginaUno() async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _listaNumeros.clear();
      _ultimoItem++;
      _agregarDiez();
    });
    return Future.delayed(duration);
  }
  //Agregar imagenes: infinite scroll
  void _agregarDiez(){
    for (int i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {
      
    });
    
  }
  //fech data
  Future<Null> _fetchData() async {
    _isLoading = true;

    setState(() {
      
    });
    final duration = new Duration(seconds: 2);
    new Timer(duration,respuestaHTTP);
  }
  void respuestaHTTP(){
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _agregarDiez();
  }

  //Crear un loading
  Widget _crearLoading(){
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0,)
          
        ],
      );
      
    }else{
      return Container();
    }
  }

}