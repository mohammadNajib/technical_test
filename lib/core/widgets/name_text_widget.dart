import '../../screens/home/bloc/home_bloc.dart';
import '../core_importer.dart';

class NameTextWidget extends StatelessWidget {
  const NameTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is HomeInitial) {
          return const Text('Your name');
        } else if (state is NameTextState) {
          return Text(state.name);
        }
        return const Text('Unhandled state');
      }),
    );
  }
}
