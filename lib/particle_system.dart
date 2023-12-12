import 'dart:math';

import 'package:flutter/material.dart';

class ParticleSystemCustom extends CustomPainter {
  final int maxNumberOfParticles;
  final double particleRadius;
  final bool isRandomParticleRadius;
  static const max = 300;
  ParticleSystemCustom(
      {required this.isRandomParticleRadius,
      required this.maxNumberOfParticles,
      required this.particleRadius});
  @override
  void paint(Canvas canvas, Size size) {
    final Size(:width, :height) = size;
    final centreOffSet = Offset(width / 2, height / 2);

    Random random = Random();
    for (var i = 0; i < maxNumberOfParticles; i++) {
      var radiusParticle = isRandomParticleRadius
          ? random.nextInt(particleRadius.toInt()).toDouble()
          : particleRadius;
      final widthLimit = width - radiusParticle;
      final HeightLimit = height - radiusParticle;
      var x = random.nextInt(widthLimit.toInt()).toDouble();
      var y = random.nextInt(HeightLimit.toInt()).toDouble();
      var offset = Offset(x, y);
      // var colour=Color.lerp(Colors.blue, Colors.red, 0.5);
      // var color=ColorScheme.light;

      canvas.drawCircle(
          offset, radiusParticle, Paint()..color = Colors.redAccent.shade700);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => true;
}
