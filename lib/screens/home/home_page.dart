import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/screens/home/bloc/home_bloc.dart';
import 'package:technical_test/screens/splash_screen.dart';
import 'package:technical_test/widgets/name_text_widget.dart';

import 'home_button_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('Home', style: TextStyle(color: Colors.white, fontSize: 25)),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Enter your name', hintStyle: TextStyle(color: Colors.grey)),
                    controller: controller,
                    onChanged: (text) => BlocProvider.of<HomeBloc>(context).add(ChangeNameEvent(name: text)),
                  ),
                ),
                const NameTextWidget(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: InkWell(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete, color: Colors.red),
                        Text('Clear text', style: TextStyle(color: Colors.red))
                      ],
                    ),
                    onTap: () {
                      controller.clear();
                      BlocProvider.of<HomeBloc>(context).add(const ClearNameEvent());
                    },
                  ),
                ),
                const HomeButtonWidget(color: Colors.blue, text: 'Go to page 1', route: SplashScreen()),
                const HomeButtonWidget(color: Colors.cyan, text: 'Go to page 2', route: SplashScreen()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
