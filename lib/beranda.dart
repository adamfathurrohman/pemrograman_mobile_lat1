import 'package:flutter/material.dart';
import 'main.dart'; // Pastikan kamu mengimpor halaman LoginPage dari main.dart

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.search), 
            onPressed: () {
              _searchProfile(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications), 
            onPressed: () {
              _showNotifications(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle), 
            onPressed: () {
              _showAccountMenu(context);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile.jpg'), // Gambar profil
                  ),
                  SizedBox(height: 10),
                  Text(
                    'User Name',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Navigasi ke halaman login saat logout
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()), // Ganti dengan halaman login
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 kolom dalam grid
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            _buildCard(
              icon: Icons.health_and_safety,
              title: 'Health',
              color: Colors.redAccent,
            ),
            _buildCard(
              icon: Icons.message,
              title: 'Messages',
              color: Colors.orange,
            ),
            _buildCard(
              icon: Icons.analytics,
              title: 'Reports',
              color: Colors.blue,
            ),
            _buildCard(
              icon: Icons.settings,
              title: 'Settings',
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat Card widget
  Widget _buildCard({IconData? icon, String? title, Color? color}) => Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: InkWell(
      onTap: () {
        // Aksi saat card ditekan
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 50, color: color),
          const SizedBox(height: 10),
          Text(
            title!,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );

  // Fungsi untuk pencarian profil
  void _searchProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Search Profile"),
          content: const Text("Masukkan nama profil yang ingin dicari."),
          actions: <Widget>[
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nama Profil',
                border: OutlineInputBorder(),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cari"),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk menampilkan notifikasi
  void _showNotifications(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Notifikasi"),
          content: const Text("Tidak ada notifikasi baru."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk menampilkan menu akun
  void _showAccountMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'User Profile',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('View Profile'),
                onTap: () {
                  // Aksi untuk melihat profil
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  // Navigasi ke halaman login saat logout
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()), // Ganti dengan halaman login
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
