// https://api.flutter.dev/flutter/material/NavigationBar-class.html
import 'package:flutter/material.dart';
import 'package:neurolog/views/calendar_view.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Figure out the title for the current page based on the tab index
    final String title = switch (_tabIndex) {
      0 => 'Calendar',
      1 => 'Create Entry',
      2 => 'Data',
      _ => '',
    };
    return SafeArea(
      child: Scaffold(
        // Create an app bar
        appBar: AppBar(title: Text(title)),

        // Create the bottom navigation bar to switch tabs
        bottomNavigationBar: NavigationBar(
          // Update the tab index when a navigation button is clicked
          onDestinationSelected: (int index) {
            setState(() {
              _tabIndex = index;
            });
          },
          selectedIndex: _tabIndex,

          // List of button options of the navigation bar
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.calendar_month_rounded),
              label: 'Calendar',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_circle_outline_rounded),
              label: 'Create Entry',
            ),
            NavigationDestination(
              icon: Icon(Icons.data_usage),
              label: 'Statistics',
            ),
          ],
        ),

        // Set the view of the main body based on the current tab index
        body: switch (_tabIndex) {
          0 => CalendarView(),
          1 => Center(child: Text('Create Entry Placeholder')),
          2 => Center(child: Text('Data Visualization Placeholder')),
          _ => Placeholder(),
        },
      ),
    );
  }
}
