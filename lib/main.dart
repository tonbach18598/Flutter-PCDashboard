import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/utilities/routes.dart';
import 'package:oktoast/oktoast.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.generateRoute,
          initialRoute: '/',
      ),
    );
  }
}
