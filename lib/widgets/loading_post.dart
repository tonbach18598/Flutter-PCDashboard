import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black12,
      child: Center(
        child:SpinKitCubeGrid(
          color: Colors.orange,
          size: 50.0,
        ),
      ),
    );
  }
}