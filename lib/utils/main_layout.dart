import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wecare/screens/home_page.dart';
import 'package:wecare/screens/appointment_page.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
// In Flutter, PageController is a class that is used
// to control a PageView widget. A PageView widget displays
// a scrollable list of pages, and the PageController is responsible
// for managing the position of the currently visible page.

  int currentPage = 0;
  final PageController _page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _page,
        onPageChanged: ((value) {
          setState(() {
            //update page index when switch page
            currentPage = value;
          });
        }),
        children: const <Widget>[
          HomePage(),
          AppointmentPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (page) {
          setState(() {
            currentPage = page;
            _page.animateToPage(
              page,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.houseChimneyMedical),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.calendarCheck),
            label: 'Appointment',
          ),
        ],
      ),
    );
  }
}
