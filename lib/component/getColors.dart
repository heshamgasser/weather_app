import 'package:flutter/material.dart';

List <Color> stateColors = [];
List <Color> colors (String state){
  if (state == 'Clear' || state == 'Sunny'){


    stateColors = [
      Colors.orange.withOpacity(.8),
      Colors.orange.withOpacity(.7),
      Colors.orange.withOpacity(.6),
      Colors.orange.withOpacity(.5),
      Colors.orange.withOpacity(.4),
    ];
  }else if (state == 'Cloudy' || state == 'Partly cloudy' || state == 'Overcast'){
    stateColors = [
      Colors.grey.withOpacity(.8),
      Colors.grey.withOpacity(.7),
      Colors.grey.withOpacity(.6),
      Colors.grey.withOpacity(.5),
      Colors.grey.withOpacity(.4),
    ];
  }else if(state == 'rainy' || state == 'Rainy' || state == 'Patchy rain possible'){
    stateColors = [
      Colors.purple.withOpacity(.8),
      Colors.purple.withOpacity(.7),
      Colors.purple.withOpacity(.6),
      Colors.purple.withOpacity(.5),
      Colors.purple.withOpacity(.4),
    ];
  }else if(state == 'sonw' || state == 'Snow' || state == 'Patchy snow possible'){
    stateColors = [
      Colors.blueAccent.withOpacity(.8),
      Colors.blueAccent.withOpacity(.7),
      Colors.blueAccent.withOpacity(.6),
      Colors.blueAccent.withOpacity(.5),
      Colors.blueAccent.withOpacity(.4),
    ];
  }
  return stateColors;
}