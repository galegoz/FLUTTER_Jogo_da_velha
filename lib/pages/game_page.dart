


import 'package:flutter/material.dart';
import 'package:jogo_velha/constrollers/game_controller.dart';
import 'package:jogo_velha/core/constants.dart';

class GamePage extends StatefulWidget{
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>{
  final _controller = GameController();

  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: _buildAppBar(),
    body: _buildBody(),
    );
  }

  _buildAppBar(){
    return AppBar(
      title: Text(GAME_TITLE),
      centerTitle: true,
    );
  }

  _buildBody(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildBoard(),
          _buildPlayerMode(),
          _buildResetButton(),
        ],
      ),
    );
  }




}