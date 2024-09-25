import 'package:a01_widgets/config/theme/menu/menu_items.dart';
import 'package:a01_widgets/presentation/screens/buttons/buttons_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('widgets practice'),
      ),
      drawer: Drawer(),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(
        menuItem.icon,
        color: colors.primary,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
      ),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      onTap: () {
        Navigator.pushNamed(context, menuItem.link);
        /* Navigator.of(ontext).push(
          MaterialPageRoute(
            builder: (context) => const ButtonsScreen(),
          ),
        ); */
      },
    );
  }
}
