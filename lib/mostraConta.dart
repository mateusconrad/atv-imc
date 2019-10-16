import 'dart:math';

import 'package:flutter/material.dart';

class MostraConta extends StatefulWidget {
  String nomePaciente;
  String idadePaciente;
  double pesoPaciente;
  double alturaPaciente;
  //nao e globalll
  MostraConta(this.nomePaciente, this.idadePaciente, this.pesoPaciente, this.alturaPaciente);

  @override
  _MostraContaState createState() => _MostraContaState();
}

class _MostraContaState extends State<MostraConta> {
  double imc = 0;
  String tipoimc = "";

  @override
  void initState() {
    super.initState();
    calculo();
    tipoIMC();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("RESULTADO IMC")
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text ("IMC = "+  imc.toString()),
            Text ("Nome: "+  widget.nomePaciente ),
            Text ("Idade: "+ widget.idadePaciente ),
            Text ("Peso"+ widget.pesoPaciente.toString()),
            Text ("Altura"+ widget.alturaPaciente.toString()),
            Text ("Nível de IMC:"+ tipoimc),
          ],
        ),
      ),
    );
  }
  void calculo(){
    //peso * alt * altura
  imc = ((widget.pesoPaciente) / pow(widget.alturaPaciente, 2)) ;
  }

  void tipoIMC()  {
    if (imc < 17){
      tipoimc = "Muito abaixo do peso";
    }
    else if((imc>=17) && (imc<18.5)) {
      tipoimc = "Abaixo do peso";
    }
    else if((imc>=18.5) && (imc<25)) {
      tipoimc = "Peso Normal";
    }
    else if((imc>=25) && (imc<30)) {
      tipoimc = "Acima do peso";
    }
    else if((imc>=30) && (imc<35)) {
      tipoimc = "Obesidade I";
    }
    else if((imc>=35) && (imc<40)) {
      tipoimc = "Obesidade II (severa)";
    }
    else if (imc >=40){
      tipoimc = "Obesidade II (mórbida)";
    }


  }

}

