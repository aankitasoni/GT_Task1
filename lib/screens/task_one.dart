import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
            top: 26.3.h,
            left: 10.w,
            child: Container(
              width: 3,
              height: 45.5.h,
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
            top: 73.2.h,
            left: 6.9.w,
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
            top: 73.9.h,
            left: 15.5.w,
            child: Container(
              width: 74.w,
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
            top: 75.h,
            right: 6.5.w,
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


          _buildVerticalLine(top: 27.8.h, left: 7.8.w, width: 3, height: 55),
          _buildVerticalLine(top: 27.8.h, right: 8.w, width: 6, height: 55),
          _buildRotatedLine(
              top: 26.5.h, left: 9.79.w, width: 7, height: 2.h, angle: 0.7127),
          _buildRotatedLine(
              top: 28.5.h, right: 6.1.w, width: 7, height: 2.h, angle: 90 + 0.9927),
          _buildOppositeTrapezium(top: 24.27.h, left: 11.8.w),
          _buildOppositeTrapezium(top: 24.27.h, right: 11.w),
          _buildHorizontalLine(top: 24.68.h, left: 20.1.w, width: 14),
          _buildHorizontalLine(top: 24.68.h, right: 19.3.w, width: 14),

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
          width: 40,
          height: 10,
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
                width: 83.w,
                height: 50.h,
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
