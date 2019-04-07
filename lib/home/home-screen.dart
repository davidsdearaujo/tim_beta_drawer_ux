import 'dart:math';

import 'package:custom_drawer/drawer/drawer-widget.dart';
import 'package:flutter/material.dart';

import '../drawer/drawer-animation-mixin.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with DrawerAnimationMixin, SingleTickerProviderStateMixin {
  @override
  void didChangeDependencies() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: controller,
          child: DrawerWidget(),
          builder: (context, child) {
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(-pi * drawerRotationAnim.value),
              child: Transform.scale(
                scale: drawerScaleAnim.value,
                child: Transform.translate(
                  offset: drawerTranslationAnim.value,
                  child: Transform(
                    transform: Matrix4.rotationY(
                      pi * drawerRotationAnim.value,
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
          animation: scaffoldTranslationAnim,
          builder: (context, child) {
            return Transform.translate(
              offset: scaffoldTranslationAnim.value,
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
                    if (controller.value == 0)
                      controller.forward();
                    else
                      controller.reverse();
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
