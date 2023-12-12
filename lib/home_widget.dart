import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_radar_partical_system_with_animation/particle_systems.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeWidget();
  }
}

class _HomeWidget extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 8))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });

    _animation = Tween<double>(begin: 0.0, end: 4.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInCirc));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _controllerStart() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: _controllerStart,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 20,
              top: 5,
              child: RotationTransition(
                filterQuality: FilterQuality.high,
                turns: Tween<double>(begin: 0.0, end: 1)
                    .animate(_animationController),
                child: Container(
                  height: height,
                  width: width,
                  alignment: AlignmentDirectional.center,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: SweepGradient(
                          center: Alignment.center,
                          colors: [Colors.black, Colors.green, Colors.black],
                          stops: <double>[.2, .25, .20])),
                ),
              ),
            ),
            Positioned(
                left: 460,
                top: 120,
                child: Container(
                  child: const ParticleSyatem(
                      backgroundColor: Colors.transparent,
                      // delyInMilliSecond: 10000,
                      height: 400,
                      width: 400,
                      particleRadius: 15,
                      maxNumberOfParticles: 2),
                )),
          ],
        ),
        floatingActionButton: FloatingActionButton.large(
            onPressed: _controllerStart,
            backgroundColor: Colors.red,

            child: const Icon(Icons.search_sharp,color: Colors.white,size: 65,)),
      ),
    );
  }
}
