import 'package:authentication_app/view/widgets/languagelist.dart';
import 'package:flutter/material.dart';
class Languagelist extends StatefulWidget {
  const Languagelist({super.key});

  @override
  State<Languagelist> createState() => _LanguagelistState();
}

class _LanguagelistState extends State<Languagelist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
          title:const Text("Change Language ")),
      body:const  Language(),
    );
  }
}
