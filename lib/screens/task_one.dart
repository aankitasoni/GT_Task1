import 'package:flutter/material.dart';

class TaskOne extends StatelessWidget {
  const TaskOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              CustomPaint(
                painter: CustomClipperBorderPainter(),
                child: ClipPath(
                  clipper: CustomClipperPath(),
                  child: Container(
                    width: 300,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                        color: Colors.grey,
                        width: 2.5,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(-10, 10),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: -20,
                child: Container(
                  width: 26,
                  height: 50,
                  color: Colors.redAccent,
                ),
              ),
              Positioned(
                top: 0,
                left: 15,
                child: Transform(
                  transform: Matrix4.rotationZ(0.7527),
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 7,
                    height: 35,
                    color: Colors.yellow,
                  ),
                ),
              ),
              Positioned(
                top: 24,
                right: -20,
                child: Container(
                  width: 25,
                  height: 50,
                  color: Colors.redAccent,
                ),
              ),
              Positioned(
                top: 2,
                child: ClipPath(
                  clipper: SaveListClipper(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    width: 140,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'SAVE LIST',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double cornerSize = 20.0;

    path.moveTo(0, cornerSize);
    path.lineTo(cornerSize, 0);
    path.lineTo(size.width - cornerSize, 0);
    path.lineTo(size.width, cornerSize);
    path.lineTo(size.width, size.height - cornerSize);
    path.lineTo(size.width - cornerSize, size.height);
    path.lineTo(cornerSize, size.height);
    path.lineTo(0, size.height - cornerSize);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomClipperBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double cornerSize = 20.0;

    var path = Path();
    path.moveTo(0, cornerSize);
    path.lineTo(cornerSize, 0);
    path.lineTo(size.width - cornerSize, 0);
    path.lineTo(size.width, cornerSize);
    path.lineTo(size.width, size.height - cornerSize);
    path.lineTo(size.width - cornerSize, size.height);
    path.lineTo(cornerSize, size.height);
    path.lineTo(0, size.height - cornerSize);
    path.close();

    var shadowPathLeft = Path();
    shadowPathLeft.moveTo(0, size.height - cornerSize);
    shadowPathLeft.lineTo(0, size.height);
    shadowPathLeft.lineTo(cornerSize, size.height);
    shadowPathLeft.lineTo(cornerSize, size.height - cornerSize);
    shadowPathLeft.close();

    var shadowPathRight = Path();
    shadowPathRight.moveTo(size.width, size.height - cornerSize);
    shadowPathRight.lineTo(size.width, size.height);
    shadowPathRight.lineTo(size.width - cornerSize, size.height);
    shadowPathRight.lineTo(size.width - cornerSize, size.height - cornerSize);
    shadowPathRight.close();

    var shadowPaintLeft = Paint()
      ..color = Colors.black.withOpacity(0.7)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

    var shadowPaintRight = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    canvas.drawPath(shadowPathLeft, shadowPaintLeft);
    canvas.drawPath(shadowPathRight, shadowPaintRight);

    var borderPaint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.8;

    var backgroundPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, backgroundPaint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class SaveListClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double cutSize = 20;

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - cutSize, size.height);
    path.lineTo(cutSize, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
