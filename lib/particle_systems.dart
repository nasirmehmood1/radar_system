import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_radar_partical_system_with_animation/particle_system.dart';

class ParticleSyatem extends StatefulWidget {
  const ParticleSyatem(
      {super.key,
      this.backgroundColor = Colors.black,
      this.delyInMilliSecond = 10000,
      this.height = 400,
      this.width = 400,
      this.isRandomParticleRadius = true,
      this.maxNumberOfParticles = 200,
      this.particleRadius = 10});
  final int maxNumberOfParticles;
  final double height;
  final double width;
  final int delyInMilliSecond;
  final Color backgroundColor;
  final double particleRadius;
  final bool isRandomParticleRadius;
  @override
  State<ParticleSyatem> createState() => _ParticleSystemState();
}
class _ParticleSystemState extends State<ParticleSyatem>{

  @override
  void initState() {
    super.initState();
    Timer.periodic( Duration(milliseconds: widget.delyInMilliSecond), (timer) {
      setState(() {
      });
     });

  }



  @override
  Widget build(BuildContext context) {
  return Container(
    width: widget.width,height: widget.height,
    color: widget.backgroundColor,
    child: CustomPaint(
      painter: ParticleSystemCustom(isRandomParticleRadius: widget.isRandomParticleRadius, maxNumberOfParticles: widget.maxNumberOfParticles, particleRadius:widget.particleRadius),
    ),

  );
  }

}
