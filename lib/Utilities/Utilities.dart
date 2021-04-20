import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

int findcharacter(String text, String key){
  print(text);
  print(text.length);
  for(int i=0; i<text.length; i++){
    print(text[i]);
    if(text[i]==key){
      return i + 2;
    }
  }
  return 0;
}

