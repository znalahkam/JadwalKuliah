import 'package:flutter/material.dart';
import 'list_view.dart';

class LaucherView extends StatefulWidget {
  static const String routeName = '/launcher';

  const LaucherView({Key? key}) : super(key: key);

  @override
  _LaucherViewState createState() => _LaucherViewState();
}

class _LaucherViewState extends State<LaucherView> {
  @override
  void initState() {
    super.initState();
    // Add a delay for 60 seconds and then navigate to the next screen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.restorablePopAndPushNamed(
          context, MatakuliahListView.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  height: MediaQuery.of(context).size.height / 3,
                ),
                const CircularProgressIndicator()
              ],
            ),
          ],
        ));
  }
}
