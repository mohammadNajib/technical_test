import 'package:flutter/material.dart';

class HomeButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Widget route;

  const HomeButtonWidget({Key? key, required this.text, required this.color, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => route)),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: color, borderRadius: const BorderRadius.all(Radius.circular(6.0))),
          child: Center(child: Text(text, style: const TextStyle(color: Colors.white))),
        ),
      ),
    );
  }
}
