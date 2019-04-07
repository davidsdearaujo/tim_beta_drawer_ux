import 'dart:math';

import 'package:custom_drawer/drawer/drawer-widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> _drawerRotationAnim;
  Animation<Offset> _drawerTranslationAnim;
  Animation<double> _drawerScaleAnim;
  Animation<Offset> _scaffoldTranslationAnim;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _drawerRotationAnim = Tween<double>(
      begin: 0.3,
      end: 0,
    ).animate(_controller);

    _drawerTranslationAnim = Tween<Offset>(
      begin: Offset(-100, 0),
      end: Offset(0, 0),
    ).animate(_controller);

    _drawerScaleAnim = Tween<double>(
      begin: 0.9,
      end: 1,
    ).animate(_controller);

    _scaffoldTranslationAnim = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(MediaQuery.of(context).size.width * 0.8, 0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: _controller,
          child: DrawerWidget(),
          builder: (context, child) {
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(-pi * _drawerRotationAnim.value),
              child: Transform.scale(
                scale: _drawerScaleAnim.value,
                child: Transform.translate(
                  offset: _drawerTranslationAnim.value,
                  child: Transform(
                    transform: Matrix4.rotationY(
                      pi * _drawerRotationAnim.value,
                    ),
                    alignment: Alignment.center,
                    child: child,
                  ),
                ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _scaffoldTranslationAnim,
          builder: (context, child) {
            return Transform.translate(
              offset: _scaffoldTranslationAnim.value,
              child: child,
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Scaffold(
              appBar: AppBar(
                title: Text("Tim Beta Drawer"),
                centerTitle: true,
                backgroundColor: Colors.black,
                leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    if (_controller.value == 0)
                      _controller.forward();
                    else
                      _controller.reverse();
                  },
                ),
              ),
              body: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: SizedBox(width: 0, height: 0),
                        trailing: IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {},
                        ),
                        title: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Atualizado",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text("06/04/2019"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.18,
                        ),
                        child: Image.asset("assets/grafico.PNG"),
                      ),
                      Text(
                        "Status da rodada",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
