import 'package:clean_architecture_flutter/features/movie/presentation/controllers/movie_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}): super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
  
}

class  _HomePageState extends State<HomePage> {
  late final MovieController _controller;

  @override
  void initState(){
    super.initState();
    _controller = GetIt.I.get<MovieController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Text('ola'),
      ),
    );
  }
}

