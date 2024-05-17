import 'package:calculator/button_values.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String number1 ="";
  String number2 ="";
  String operand ="";

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // output
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "$number1$operand$number2".isEmpty
                      ? "0"
                      : "$number1$operand$number2", 
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
          
            //buttons
            Wrap(
              children: Btn.buttonValues
                .map(
                  (value) => SizedBox(
                    width: value == Btn.n0
                      ? screenSize.width/2 
                      : (screenSize.width/4),
                    height: screenSize.height/5,
                    child: buildButton(value)
                  )
                )
                .toList(),
            )
          ],),
      ),
    );
  }

  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: getBtnColor(value),
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white24
          ),
          borderRadius: BorderRadius.circular(100)
        ),
        child: InkWell(
          onTap: ()  => onBtnTap(value),
          child: Center(
            child: Text(
              value, 
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
              )
            )
          ),
        ),
      ),
    );
  }
  // ######

  void onBtnTap(String value) {
    if(value!=Btn.dot&&int.tryParse(value)==null){
      if(operand.isNotEmpty&&number2.isNotEmpty){

      }
      operand = value;
    }
    setState(() {
      number1 += value;
      number2 += value;
      operand += value;
    });
  }

  // ######
  Color getBtnColor(value) {
    return [Btn.del,Btn.clr].contains(value)
      ? Colors.blueGrey
      : [
          Btn.per,
          Btn.multiply,
          Btn.add,
          Btn.subtract,
          Btn.divide,
          Btn.calculate
        ].contains(value)
          ? Colors.orange
          : Colors.black87;
  }
}