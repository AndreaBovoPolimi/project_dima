import 'package:flutter/material.dart';

class ForecastBackground extends StatelessWidget {

  Color color;

  ForecastBackground(Color color) {
      this.color = color;
  }

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
     return Container (
       height: size.height * 0.3,
       width: size.width,
       child: ClipPath(
        child: Container(
          width: size.width,
          height: 10,
          color: color,
        ),
        clipper: CustomClipPath(),
       )
     );
  }
}


class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
      Path path = Path();
      path.lineTo(0, size.height);
      path.quadraticBezierTo(size.width/4, size.height - 40, size.width/2, size.height-20);
      path.quadraticBezierTo(3/4*size.width, size.height, size.width, size.height-30);
      path.lineTo(size.width, 0);
      return path;
  }
  
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;

}