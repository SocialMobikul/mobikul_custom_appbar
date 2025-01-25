import 'package:flutter/material.dart';
import 'package:mobikul_custom_app_bar/mobikul_custom_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobikul Custome App Bar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CarouselDemo(),
    );
  }
}

class CarouselDemo extends StatelessWidget {
  const CarouselDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MobikulCustomAppBar(
          "Mobikul Custom App Bar",
          context,
          Theme.of(context).textTheme.bodyLarge,
          isHomeEnable: true,
          isElevated: false,
          isAppLogoForDarkmode: true,
          appBarBackgroundColor: Colors.green,
          appLogoUrl: "imageURL1",
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
          showAppLogo: true,
        ),
        body: Center(child: Text("Mobikul Custom App Bar")));
  }
}
