

class StateConditionModel {
  static String getImage (String state){
    if (state == 'Clear' || state == 'Sunny'){
      return 'assets/images/clear.png';
    }else if (state == 'Cloudy' || state == 'Partly cloudy' || state == 'Overcast'){
      return 'assets/images/cloudy.png';
    }else if(state == 'rainy' || state == 'Rainy' || state == 'Patchy rain possible'){
      return 'assets/images/rainy.png';
    }else if(state == 'sonw' || state == 'Snow' || state == 'Patchy snow possible'){
      return 'assets/images/snow.png';
    }
    return "";
  }


}