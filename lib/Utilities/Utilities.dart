import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

int findcharacter(String text, String key){
  for(int i=0; i<text.length; i++){
    if(text[i]==key){
      return i + 2;
    }
  }
  return 0;
}

