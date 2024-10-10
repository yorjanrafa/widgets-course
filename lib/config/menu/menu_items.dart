import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subtitle: 'Varios botones',
    link: '/buttons',
    icon: Icons.radio_button_on_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subtitle: 'Varios tarjetas',
    link: '/cards',
    icon: Icons.card_giftcard_sharp,
  ),
  MenuItem(
      title: 'Progress indicator',
      subtitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_outlined),
  MenuItem(
      title: 'Snackbars',
      subtitle: 'Flotantes y otras',
      link: '/snackbars',
      icon: Icons.notifications_outlined),
  MenuItem(
      title: 'Animated container',
      subtitle: 'Stateful widget',
      link: '/animated',
      icon: Icons.animation_outlined),
  MenuItem(
      title: 'UI controls',
      subtitle: 'Controles de interfaz',
      link: '/ui-controls',
      icon: Icons.control_camera_outlined),
  MenuItem(
      title: 'Intro a la app',
      subtitle: 'Intruductorio',
      link: '/tutorial',
      icon: Icons.accessible),
  MenuItem(
    title: 'Infinite scroll y pull',
    subtitle: 'Listas infinitas y pull to refresh ',
    link: '/infinite',
    icon: Icons.refresh_outlined,
  ),
  MenuItem(
    title: 'Counter',
    subtitle: 'Increment clicks counter',
    link: '/counter',
    icon: Icons.add,
  ),
  MenuItem(
    title: 'Theme Changer',
    subtitle: 'Change theme of the app',
    link: '/theme-changer',
    icon: Icons.color_lens_outlined,
  ),
];
