import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:loccon/ui/pages/clients/clients_page.dart';
import 'package:loccon/ui/pages/dumpsters/dumpsters_page.dart';
import 'package:loccon/ui/pages/home/home_controller.dart';
import 'package:loccon/ui/pages/home/part/lc_bottom_navigation_bar.dart';
import 'package:loccon/ui/pages/prices/prices_page.dart';
import 'package:loccon/ui/pages/rental/rental_page.dart';
import 'package:loccon/ui/pages/reports/reports_page.dart';
import 'package:loccon/ui/shared/controller_provider.dart';
import 'package:loccon/ui/shared/lc_app_bar.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final _screenOptions = <Widget>[
    const WelcomePage(),
    const ClientsPage(),
    const DumpstersPage(),
    const RentalPage(),
    const PricesPage(),
    const ReportsPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ControllerScope(
      create: (_) => HomeController(
        GetIt.I(),
      ),
      builder: (context, controller) {
        return Scaffold(
          appBar: const LCAppBar(),
          body: _screenOptions.elementAt(_selectedIndex),
          bottomNavigationBar: LCBottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                activeIcon: Icon(Icons.person),
                label: 'Clients',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_home_outlined),
                activeIcon: Icon(Icons.add_home),
                label: 'Dumpsters',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_shipping_outlined),
                activeIcon: Icon(Icons.local_shipping),
                label: 'Dumpster Rental',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money_outlined),
                activeIcon: Icon(Icons.attach_money),
                label: 'Rental Prices',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_outlined),
                activeIcon: Icon(Icons.bar_chart),
                label: 'Reports',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ControllerScope.of<HomeController>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 276,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            'Welcome, ${controller.user.username}!',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
