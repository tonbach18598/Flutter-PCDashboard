import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.grey[300],
      child: Center(
        child:SpinKitSquareCircle(
          color: Colors.orange,
          size: 50.0,
        ),
      ),
    );
  }
}