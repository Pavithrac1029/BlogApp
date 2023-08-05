import 'package:blogapp/FirstBlogPage/Provider/provider.dart';
import 'package:blogapp/Homepage/Provider/provider.dart';
import 'package:blogapp/Homepage/View/homepage.dart';
import 'package:blogapp/SecondBlogPage/Provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


import 'NativeShare/share.dart';



void main() {
   SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Use MultiProvider to provide multiple ChangeNotifierProviders
      providers: [
        ChangeNotifierProvider(create: (_) => BlogListProvider()),
        ChangeNotifierProvider(create: (_) => SecondBlogSecondListProvider()),
         ChangeNotifierProvider(create: (_) => ThirdBlogThirdListProvider()),
        ChangeNotifierProvider(create: (_) => share()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Scaffold(
          // Wrap BlogListView with Scaffold
          // appBar: AppBar(
          //   title: Text('Your App Title'), // Replace with your desired title
          // ),
          body: BlogListView(),
        ),
      ),
    );
  }
}
