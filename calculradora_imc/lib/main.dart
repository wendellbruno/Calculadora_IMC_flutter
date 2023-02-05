import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CalculadoraIMC(),
  ));
}


class CalculadoraIMC extends StatefulWidget {
  const CalculadoraIMC({super.key});
  

  @override
  State<CalculadoraIMC> createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {

  final TextEditingController campoPeso = TextEditingController();
  final TextEditingController campoAltura = TextEditingController();
  String resultado = "";
   
   void _calcularIMC(){
     

      setState(() {
      double peso = double.parse(campoPeso.text);
      double altura = double.parse(campoAltura.text) / 100;
      double imc = peso / (altura * altura);
      
      if(imc <= 18.5){
          this.resultado = 'MAGREZA (${imc.toStringAsFixed(2)})';
      }else if(imc > 18.5 || imc < 24.9){
          this.resultado = 'NORMAL (${imc.toStringAsFixed(2)})';
      }else if(imc >= 25 || imc <= 29.9){
          this.resultado = 'SOBREPESO (${imc.toStringAsFixed(2)})';
      }else if(imc >= 30 || imc <= 39.9){
          this.resultado = 'OBESIDADE (${imc.toStringAsFixed(2)})';
      }else if(imc >= 40){
          this.resultado = 'OBESIDADE GRAVE (${imc.toStringAsFixed(2)})';
      }
      });
   }

   GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

   void reset(){
    setState(() {
      campoPeso.clear();
      campoAltura.clear();
    });
   }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CalculadoraIMC') ,
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 5,
        actions: [
          IconButton(
            onPressed: reset,
             icon: const Icon(Icons.refresh),
             )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _fromKey,
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  [
          const Icon(
            Icons.person_outlined,
            size: 120,
            color: Colors.green,
            ),
            TextFormField(
              validator: (value){
                if(value!.isEmpty){
                  return "Insira seu peso";
                }
              },
              controller: campoPeso,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Peso em (kg)",
                labelStyle: TextStyle(
                  color: Colors.green
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  
                ),
              ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                ),
            ),
            const SizedBox(height: 10,),
             TextFormField(
                validator: (value){
                if(value!.isEmpty){
                  return "Insira sua altura";
                }
              },
              controller: campoAltura,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Altura em (cm)",
                labelStyle: TextStyle(
                  color: Colors.green
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  
                ),
              ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                ),
            ),
           const SizedBox(height: 10,),
           SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: (){
                if(_fromKey.currentState!.validate()){
                  _calcularIMC();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const 
              Text('Calcular',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),),
              ),
           ),
            Text(
            resultado,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 25
            ),
            )
        ],
      ),)
      )
      
    );
  }
}