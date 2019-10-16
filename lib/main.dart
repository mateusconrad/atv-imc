import 'package:flutter/material.dart';
import 'mostraConta.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController nomePaciente = TextEditingController();
  TextEditingController idadePaciente = TextEditingController();
  TextEditingController pesoPaciente = TextEditingController();
  TextEditingController alturaPaciente = TextEditingController();

  var focusNome = new FocusNode();
  var focusIdade = new FocusNode();
  var focusPeso = new FocusNode();
  var focusAltura = new FocusNode();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formularios"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              Text("Cálculo IMC"),
              Image.asset("images/download.png"),
              TextFormField(
                //key: formkey,
                focusNode: focusNome,
                autofocus: true,
                textInputAction: TextInputAction.next,
                validator: (valor){
                  if (valor.isEmpty) {
                    FocusScope.of(context).requestFocus(focusNome);
                    return "Informe o nome";
                  } else {
                    return null;
                  }
                },
                controller: nomePaciente,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.accessibility),
                  labelText: "Nome",
                ),
              ),
              TextFormField(
                focusNode: focusIdade,
                autofocus: true,
                validator: (valor){
                  if (valor.isEmpty) {
                    FocusScope.of(context).requestFocus(focusIdade);
                    return "Informe a Idade";
                  } else {
                    return null;
                  }
                },
                controller: idadePaciente,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Idade",
                      suffixIcon: Icon(Icons.cake)
                ),
              ),
              TextFormField(
                focusNode: focusPeso,
                autofocus: true,
                validator: (valor){
                  if (valor.isEmpty) {
                    FocusScope.of(context).requestFocus(focusPeso);
                    return "Informe o Peso";
                  } else {
                    return null;
                  }
                },
                controller: pesoPaciente,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso",
                    suffixIcon: Icon(Icons.filter_center_focus)
                ),
              ),
              TextFormField(
                focusNode: focusAltura,
                autofocus: true,
                validator: (valor){
                  if (valor.isEmpty) {
                    FocusScope.of(context).requestFocus(focusAltura);
                    return "Informe a Altura";
                  } else {
                    return null;
                  }
                },
                controller: alturaPaciente,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura",
                    suffixIcon: Icon(Icons.present_to_all)
                ),
              ),
              RaisedButton(
                child: Text("Calcular"),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  if (formkey.currentState.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MostraConta(
                                    nomePaciente.text, idadePaciente.text,
                                    double.parse(pesoPaciente.text), double
                                    .parse(alturaPaciente.text))));
                  }},
              ),
            ],
          ),
        ),
      ),
    );
  }

}



//pubspec.yml

//assets:      images/   kakaka.jpg