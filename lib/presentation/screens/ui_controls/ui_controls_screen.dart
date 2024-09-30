import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI controls screen'),
      ),
      body: _UiControlsView(),
    );
  }
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsView extends StatefulWidget {
  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloperMode = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantBreakfast = false;
  bool wantLunch = false;
  bool wantDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: Text('Developer mode'),
            subtitle: Text('controles adicionales'),
            value: isDeveloperMode,
            onChanged: (value) {
              return setState(() {
                isDeveloperMode = !isDeveloperMode;
              });
            }),
        SizedBox(
          height: 20,
        ),
        ExpansionTile(
          title: Text('Vehiculo de transport'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              value: Transportation.car,
              groupValue: selectedTransportation,
              title: Text('Car'),
              subtitle: Text('Viajar por carro'),
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.car;
                });
              },
            ),
            RadioListTile(
              value: Transportation.plane,
              groupValue: selectedTransportation,
              title: Text('plane'),
              subtitle: Text('Viajar por avion'),
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.plane;
                });
              },
            ),
            RadioListTile(
              value: Transportation.boat,
              groupValue: selectedTransportation,
              title: Text('boat'),
              subtitle: Text('Viajar por barco'),
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.boat;
                });
              },
            ),
            RadioListTile(
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              title: Text('submarine'),
              subtitle: Text('Viajar por submarino'),
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.submarine;
                });
              },
            )
          ],
        ),
        ExpansionTile(
          title: Text('Vehiculo de transport'),
          subtitle: Text('$selectedTransportation'),
          children: [
            CheckboxListTile(
              title: Text('desayuno'),
              value: wantBreakfast,
              onChanged: (value) {
                setState(() {
                  wantBreakfast = !wantBreakfast;
                });
              },
            ),
            CheckboxListTile(
              title: Text('comida'),
              value: wantLunch,
              onChanged: (value) {
                setState(() {
                  wantLunch = !wantLunch;
                });
              },
            ),
            CheckboxListTile(
              title: Text('cena'),
              value: wantDinner,
              onChanged: (value) {
                setState(() {
                  wantDinner = !wantDinner;
                });
              },
            )
          ],
        ),
      ],
    );
  }
}
