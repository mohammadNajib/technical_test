import 'package:technical_test/screens/animations/bloc/animations_bloc.dart';
import 'package:technical_test/screens/animations/polygons.dart';

import '../../../core/core_importer.dart';

class PolygonWidget extends StatelessWidget {
  final Polygons polygons;

  const PolygonWidget({Key? key, required this.polygons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => BlocProvider.of<AnimationsBloc>(context).add(polygons.event),
      child: Container(
        height: MediaQuery.of(context).size.width / 6,
        width: MediaQuery.of(context).size.width / 6,
        decoration:
            BoxDecoration(color: polygons.color, borderRadius: BorderRadius.all(Radius.circular(polygons.radius))),
      ),
    );
  }
}
