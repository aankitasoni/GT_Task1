import 'package:flutter/material.dart';
import 'package:task1/Components/opposite_trapezium_clipper.dart';
import 'package:task1/Components/save_list_clipper.dart';

class TaskOne extends StatelessWidget {
  const TaskOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 203,
            left: 38,
            child: Container(
              width: 3,
              height: 365,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(-10, 10),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 580,
            left: 25,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(0.8),
              child: Container(
                width: 28,
                height: 3,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(5, 5),
                      blurRadius: 2.5,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 584,
            left: 59,
            child: Container(
              width: 260,
              height: 3,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(-10, 10),
                    blurRadius: 2.5,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 594,
            right: 25,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(-0.8),
              child: Container(
                width: 28,
                height: 2.5,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(5, -7),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildVerticalLine(top: 215, left: 28, width: 3, height: 55),
          _buildOppositeTrapezium(top: 185, left: 45),
          _buildHorizontalLine(top: 190, left: 78, width: 10),
          _buildHorizontalLine(top: 190, right: 78, width: 10),
          _buildOppositeTrapezium(top: 185, right: 45),
          _buildRotatedLine(
              top: 203, left: 35, width: 7, height: 13, angle: 0.7527),
          _buildRotatedLine(
              top: 218, right: 34, width: 7, height: 11, angle: 90 + 0.7527),
          _buildVerticalLine(top: 215, right: 28, width: 6, height: 55),
          _buildCenterBox(),
        ],
      ),
    );
  }

  Widget _buildVerticalLine(
      {required double top,
        double? left,
        double? right,
        required double width,
        required double height}) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: Container(
        width: width,
        height: height,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildHorizontalLine(
      {required double top,
        double? left,
        double? right,
        required double width}) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: Container(
        width: width,
        height: 3,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildRotatedLine(
      {required double top,
        double? left,
        double? right,
        required double width,
        required double height,
        required double angle}) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: Transform(
        transform: Matrix4.rotationZ(angle),
        alignment: Alignment.topLeft,
        child: Container(
          width: width,
          height: height,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildOppositeTrapezium(
      {required double top, double? left, double? right}) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: ClipPath(
        clipper: OppositeTrapeziumClipper(),
        child: Container(
          width: 35,
          height: 7,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildCenterBox() {
    return Center(
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
                    color: Colors.white70,
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
          _buildVerticalLine(top: 23, left: -20, width: 24, height: 55),
          _buildHorizontalLine(top: 0, left: 15, width: 43),
          _buildHorizontalLine(top: 0, right: 15, width: 43),
          _buildVerticalLine(top: 23, right: -20, width: 24, height: 55),
          _buildRotatedLine(
              top: 0, left: 15, width: 7, height: 35, angle: 0.7527),
          _buildRotatedLine(
              top: 0, right: 15, width: 7, height: 35, angle: -0.7527),
          _buildSaveList(),
        ],
      ),
    );
  }

  Widget _buildSaveList() {
    return Positioned(
      top: 2,
      child: ClipPath(
        clipper: SaveListClipper(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
    );
  }
}

class CustomClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double cornerSize = 20.0;
    return Path()
      ..moveTo(0, cornerSize)
      ..lineTo(cornerSize, 0)
      ..lineTo(size.width - cornerSize, 0)
      ..lineTo(size.width, cornerSize)
      ..lineTo(size.width, size.height - cornerSize)
      ..lineTo(size.width - cornerSize, size.height)
      ..lineTo(cornerSize, size.height)
      ..lineTo(0, size.height - cornerSize)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipperBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double cornerSize = 20.0;

    var path = Path()
      ..moveTo(0, cornerSize)
      ..lineTo(cornerSize, 0)
      ..lineTo(size.width - cornerSize, 0)
      ..lineTo(size.width, cornerSize)
      ..lineTo(size.width, size.height - cornerSize)
      ..lineTo(size.width - cornerSize, size.height)
      ..lineTo(cornerSize, size.height)
      ..lineTo(0, size.height - cornerSize)
      ..close();

    var borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.8;

    var backgroundPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, backgroundPaint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
