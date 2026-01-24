import 'package:flutter/material.dart';
import 'events_page.dart';
import 'settings.dart';
import 'team.dart';
import 'speaker_page.dart';
import 'venues_page.dart';
import 'profile_page.dart';
import 'security_page.dart';
import 'logout_page.dart';
import 'login_page.dart';
import 'register_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  String _selectedOrganization = 'Switch Organization';

  // List of pages for the BottomNavigationBar (Note: These pages no longer have their own AppBars)
  final List<Widget> _pages = [
    const EventPage(),
    const TeamPage(),
    const SpeakerPage(),
    const VenuesPage(),
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showOrganizationDropdown(BuildContext dialogContext) {
    showDialog(
      context: dialogContext,
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: const Text(
                    'Switch Organization',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedOrganization = 'Switch Organization';
                    });
                    Navigator.of(dialogContext).pop();
                  },
                ),
                ListTile(
                  title: const Text(
                    'Global Connect',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedOrganization = 'Global Connect';
                    });
                    Navigator.of(dialogContext).pop();
                  },
                ),
                ListTile(
                  tileColor: Colors.orange[600],
                  title: const Text(
                    'Create New Organization',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.of(dialogContext).pop();
                    ScaffoldMessenger.of(dialogContext).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Navigating to create new organization...',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Helper function for navigating from the Drawer
  void _navigateToPage(Widget page) {
    Navigator.pop(context); // Close the drawer
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        actions: <Widget>[
          GestureDetector(
            onTap: () => _showOrganizationDropdown(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    _selectedOrganization,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                ],
              ),
            ),
          ),
          PopupMenuButton<String>(
            icon: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue),
            ),
            onSelected: (String result) {
              if (result == 'Profile') {
                _navigateToPage(const ProfilePage());
              } else if (result == 'Security') {
                _navigateToPage(const SecurityPage());
              } else if (result == 'Logout') {
                _navigateToPage(const LogoutPage());
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                enabled: false,
                child: Text(
                  'My Account',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<String>(
                value: 'Profile',
                child: Text('Profile'),
              ),
              const PopupMenuItem<String>(
                value: 'Security',
                child: Text('Security'),
              ),
              const PopupMenuItem<String>(
                value: 'Logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue[900],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue[900]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.orange[600],
                      radius: 30,
                      child: const Icon(
                        Icons.business,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _selectedOrganization,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.dashboard, color: Colors.white),
                title: const Text(
                  'Event\'s Dashboard',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.mic, color: Colors.white),
                title: const Text(
                  'Speaker',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text(
                  'Settings',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  setState(() {
                    _selectedIndex = 4;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.group, color: Colors.white),
                title: const Text(
                  'Team',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.location_city, color: Colors.white),
                title: const Text(
                  'Venues',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
              ),
              // --- Login Link added to the Drawer ---
              const Divider(color: Colors.white54),
              ListTile(
                leading: const Icon(Icons.login, color: Colors.white),
                title: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => _navigateToPage(
                  const LoginPage(),
                ), // Linked to the LoginPage
              ),
              // --- End Login Link ---
            ],
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[900],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              color: _selectedIndex == 0 ? Colors.orange : Colors.white,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
              color: _selectedIndex == 1 ? Colors.orange : Colors.white,
            ),
            label: 'Team',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mic,
              color: _selectedIndex == 2 ? Colors.orange : Colors.white,
            ),
            label: 'Speaker',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_city,
              color: _selectedIndex == 3 ? Colors.orange : Colors.white,
            ),
            label: 'Venues',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: _selectedIndex == 4 ? Colors.orange : Colors.white,
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
