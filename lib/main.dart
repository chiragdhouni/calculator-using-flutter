import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';



void main() {
  runApp(MaterialApp(
    home: App(),
  )
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var button_color=Colors.black;
var text_color=Colors.white;
var input_text="";
var output_text="";
var hide_input=false;
var input_size=45.0;
var output_size=35.0;

  onbuttonclick(value){
  if(value=="AC"){
    input_text="";
    output_text="";
  }
  else if (value=="<"){
    if(input_text.isNotEmpty){
      input_text=input_text.substring(0,input_text.length-1);
    }
    
  }
  else if(value=="="){
    if(input_text.isNotEmpty){
      var user_input=input_text.replaceAll("X","*");
      Parser p=Parser();
      Expression expression=p.parse(user_input);
      ContextModel cm=ContextModel();
      var finalvalue=expression.evaluate(EvaluationType.REAL,cm);
      output_text=finalvalue.toString();
      if(output_text.endsWith(".0")){
          output_text=output_text.substring(0,output_text.length-2);
     }
      input_text=output_text;
      hide_input=true;
      output_size=45.0;

    }
    
  }
  else{
 
    input_text=input_text+value;
       hide_input=false;
    output_size=35.0;
  }
  
  
 setState(() {});
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      body: Container(
        child: Column(
          

          children: [
            Expanded(
              
              child: Container(color: Colors.black,
              width: double.infinity,
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
              
              children: [
                 Text(hide_input? "" : input_text,style: TextStyle(fontSize: input_size,color: Colors.white),)
                ,
                SizedBox(height: 20,),
                 Text(output_text,style: TextStyle(fontSize: output_size,color: Colors.white),)
              ],
              ),
              )
            ),
            SizedBox(height: 10),

            Container(color: Colors.black,
              child: Row(children: [
                button("AC"),
                button("<"),
                button(""),
                button("/")
              ],
              ),
            ),
            
            Container(color: Colors.black,
              child: Row(children: [
                button("7"),
                button("8"),
                button("9"),
                button("X")
              ],
              ),
            ),           
            Container(color:Colors.black,
              child: Row(children: [
                button("4"),
                button("5"),
                button("6"),
                button("-")
              ],
              ),
            ),
            
            Container(color:Colors.black,
              child: Row(children: [
                button("1"),
                button("2"),
                button("3"),
                button("+")
              ],
              ),
            ),
            
            Container(color:Colors.black,
              child: Row(children: [
                button("/"),
                button("0"),
                button("."),
                button("=")
              ],
              ),
            ),



            
          ],
        ),
      ),
    );
  }
 
 Widget button(text){
  return Expanded(child: 
              Container(
                padding: EdgeInsets.all(8),
                child: 
                ElevatedButton(onPressed: ()=>{onbuttonclick(text) }, child: Text(text,style: TextStyle(fontSize: 15,
                fontWeight: FontWeight.bold,
                color: text_color),
                ),
                style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20),backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(5)
                ),
                ),
                ),
                ),
              ),
              );
 }
}