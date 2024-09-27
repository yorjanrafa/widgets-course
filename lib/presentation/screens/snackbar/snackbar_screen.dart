import 'package:a01_widgets/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text('hola mundo'),
      action: SnackBarAction(label: 'close', onPressed: () {}),
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackbar,
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('¿Estas seguro?'),
              content: const Text(
                  'lorem ipsum dolor sit amet consectetu adipsem ipsum dolor sit amet consectetu adipsem ipsum dolor sit amet consectetu adipsem '),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              actions: [
                TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('Cancelar')),
                FilledButton(onPressed: () {}, child: const Text('Aceptar'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars'),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'lorem ispa sdfa asdlfja sdfjasdfj as fahsfo asdlf ')
                  ]);
                },
                child: Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () {
                  openDialog(context);
                },
                child: Text('Mostrar dialogo'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.remove_red_eye_outlined),
          onPressed: () => showCustomSnackbar(context),
          label: Text('mostrar snackbar')),
    );
  }
}
