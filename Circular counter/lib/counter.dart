import 'package:flutter/material.dart';
import 'package:task_three/count.dart';

class Counter extends StatelessWidget{
  const Counter({super.key});

  @override
  Widget build(context){
    return Container(
          color: const Color.fromRGBO(172, 127, 77, 1),
         
          child:Center(
            child:Count(0)
          )
        );
  }


}