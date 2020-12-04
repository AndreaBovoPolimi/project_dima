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
       height: size.height * 0.09,
       width: size.width,
       color:this.color,
     );
  }
}


class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/2, size.height - 100, size.width , size.height );
    path.lineTo(size.width, 0);

    return path;
  }
  
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;

}