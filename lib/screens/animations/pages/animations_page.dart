import 'package:technical_test/screens/animations/widgets/polygon_widget.dart';
import 'package:technical_test/screens/animations/polygons.dart';

import '../../../core/core_importer.dart';
import '../bloc/animations_bloc.dart';

class AnimationsPage extends StatefulWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  AnimationsPageState createState() => AnimationsPageState();
}

class AnimationsPageState extends State<AnimationsPage> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> radiusAnimation;
  late AnimationController colorController;
  late Animation colorAnimation;
  double currentRadius = 0.0;
  Color currentColor = Colors.blue;

  double radius = 0;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    radiusAnimation = Tween<double>(begin: 0.0, end: currentRadius).animate(controller);
    controller.addListener(() => setState(() {}));

    colorController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    colorAnimation = ColorTween(begin: Colors.blue, end: currentColor).animate(controller);
    colorController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AnimationsBloc>()..add(const AnimateToSharpSquareEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text('Animations', style: TextStyle(color: Colors.white, fontSize: 25)),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back), color: Colors.white, onPressed: () => Navigator.pop(context)),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 25), child: NameTextWidget()),
              BlocConsumer<AnimationsBloc, AnimationsState>(
                builder: (context, state) {
                  return Container(
                    height: MediaQuery.of(context).size.width * 0.8,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: colorAnimation.value,
                        borderRadius: BorderRadius.all(Radius.circular(radiusAnimation.value * 5))),
                  );
                },
                listener: (BuildContext context, AnimationsState state) {
                  setState(() {
                    currentRadius = state.polygons.radius;
                    radiusAnimation =
                        Tween<double>(begin: radiusAnimation.value, end: currentRadius).animate(controller);
                    currentColor = state.polygons.color;
                    colorAnimation =
                        ColorTween(begin: colorAnimation.value, end: currentColor).animate(colorController);
                    colorController.forward(from: 0);
                    controller.forward(from: 0);
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PolygonWidget(polygons: Polygons.sharpSquare),
                    PolygonWidget(polygons: Polygons.softSquare),
                    PolygonWidget(polygons: Polygons.circle)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
