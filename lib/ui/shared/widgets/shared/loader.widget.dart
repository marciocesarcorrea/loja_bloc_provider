import 'package:flutter/widgets.dart';
import 'package:loja_bloc_provider/ui/shared/widgets/shared/progress-indicator.widget.dart';

class Loader extends StatelessWidget {
  final object;
  final Function callback;

  Loader({
    @required this.callback,
    @required this.object,
  });

  @override
  Widget build(BuildContext context) {
    if (object == null) {
      return Center(
        child: GenericProgressindicator(),
      );
    }
    if (object.length == 0) {
      return Center(
        child: Text("Nenhum item encontrado"),
      );
    }

    return callback();
  }
}
