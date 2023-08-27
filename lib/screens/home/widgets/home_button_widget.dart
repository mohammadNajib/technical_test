import 'package:flutter/material.dart';

import '../home_button.dart';

class HomeButtonWidget extends StatelessWidget {
  final HomeButton button;

  const HomeButtonWidget({Key? key, required this.button}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => button.route)),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: button.color, borderRadius: const BorderRadius.all(Radius.circular(6.0))),
          child: Center(child: Text(button.text, style: const TextStyle(color: Colors.white))),
        ),
      ),
    );
  }
}
