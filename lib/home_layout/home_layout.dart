import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/home_provider.dart';
import 'package:weather_app/screens/weather_screen/weather_screen.dart';
import 'package:weather_app/screens/widget/search_widget.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'Home Screen';

  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) {
        var homeProvider = Provider.of<HomeProvider>(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
            appBar: AppBar(
              titleSpacing: 20,
              title: Text(
                'Weather App',
                style: GoogleFonts.permanentMarker(),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    AwesomeDialog(
                      dismissOnTouchOutside: false,
                      context: context,
                      dialogType: DialogType.QUESTION,
                      animType: AnimType.SCALE,
                      // title: 'Dialog Title',
                      body: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'City Name',
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SearchTextFormField(
                                  controller: searchController, hint: 'City Name'),
                            ],
                          ),
                        ),
                      ),
                      btnOk: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                           homeProvider.getCityName(searchController.text);
                           searchController.clear();
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Search'),
                      ),
                      btnCancelOnPress: () {},
                    ).show();
                  },
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
              ],
            ),
            body: homeProvider.cityName == null ?  Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'There is No Weather 😞 ',
                          style: GoogleFonts.dancingScript(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Start Searching Now 🔍',
                          style: GoogleFonts.dancingScript(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ) :
            WeatherScreen(homeProvider.cityName!),
        ) ;
      },

    );
  }
}
