import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

import 'dokter_page.dart';

class AppColors {
  static const Color pink = Color(0xFFE91E63);
  static const Color pinkSoft = Color(0xFFFCE4EC);
  static const Color pinkMedium = Color(0xFFF48FB1);
  static const Color pinkLight = Color(0xFFFFF0F5);
  static const Color white = Color(0xFFFFFFFF);
  static const Color greyText = Color(0xFF9E9E9E);
  static const Color darkText = Color(0xFF3D2B3D);
  static const Color available = Color(0xFF66BB6A);
  static const Color full = Color(0xFFEF5350);
  static const Color border = Color(0xFFF8BBD0);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.pink,
          primary: AppColors.pink,
          background: AppColors.pinkLight,
        ),
      ),
      home: const ProfileAwalPage(),
    );
  }
}


class ProfileAwalPage extends StatefulWidget {
  const ProfileAwalPage({super.key});

  @override
  State<ProfileAwalPage> createState() => _ProfileAwalPageState();
}

class _ProfileAwalPageState extends State<ProfileAwalPage> {
  Uint8List? image;

  Future<void> pilihGambar() async {
    final picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      image = await file.readAsBytes();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pinkLight,
      body: Center(
        child: Container(
          width: 270,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.border, width: 1.5),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.pink.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header pink accent bar
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.pink,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                "Welcome to",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.greyText,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "PRAKTIKUM PAB 2023",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.pink,
                  letterSpacing: 0.8,
                ),
              ),

              const SizedBox(height: 20),

              // NIM badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.pinkSoft,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "1462300196",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.pink,
                    fontSize: 13,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Avatar
              GestureDetector(
                onTap: pilihGambar,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [AppColors.pink, AppColors.pinkMedium],
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 48,
                        backgroundColor: AppColors.pinkSoft,
                        backgroundImage: image != null ? MemoryImage(image!) : null,
                        child: image == null
                            ? const Icon(Icons.person, size: 45, color: AppColors.pinkMedium)
                            : null,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.pink,
                        ),
                        child: const Icon(Icons.camera_alt, size: 14, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                "Putriani Sari Rejeki Jae",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: AppColors.darkText,
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.pink,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 2,
                    shadowColor: AppColors.pink.withOpacity(0.4),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  },
                  child: const Text(
                    "Masuk",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// MAIN PAGE

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const CategoryPage(),
    const NoKamarPage(),
    const ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pinkLight,
      body: Center(
        child: Container(
          width: 290,
          height: 590,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.border, width: 1.5),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.pink.withOpacity(0.10),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(child: pages[selectedIndex]),

              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border(
                    top: BorderSide(color: AppColors.border, width: 1),
                  ),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(24),
                  ),
                ),
                child: BottomNavigationBar(
                  currentIndex: selectedIndex,
                  selectedItemColor: AppColors.pink,
                  unselectedItemColor: AppColors.greyText,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  selectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  ),
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      activeIcon: Icon(Icons.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.meeting_room_outlined),
                      activeIcon: Icon(Icons.meeting_room),
                      label: "No Kamar",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline),
                      activeIcon: Icon(Icons.person),
                      label: "Profil",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class NoKamarPage extends StatelessWidget {
  const NoKamarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> kamar = [
      {"nama": "Mawar 01", "kelas": "VIP", "tersedia": true},
      {"nama": "Mawar 02", "kelas": "VIP", "tersedia": false},
      {"nama": "Melati 01", "kelas": "Kelas 1", "tersedia": true},
      {"nama": "Melati 02", "kelas": "Kelas 1", "tersedia": true},
      {"nama": "Anggrek 01", "kelas": "Kelas 2", "tersedia": false},
      {"nama": "Anggrek 02", "kelas": "Kelas 2", "tersedia": true},
      {"nama": "Tulip 01", "kelas": "VIP", "tersedia": true},
      {"nama": "Tulip 02", "kelas": "VIP", "tersedia": false},
      {"nama": "Kenanga 01", "kelas": "Kelas 3", "tersedia": true},
      {"nama": "Kenanga 02", "kelas": "Kelas 3", "tersedia": true},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          decoration: const BoxDecoration(
            color: AppColors.pinkSoft,
            borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
          ),
          child: const Text(
            "No. Kamar",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.pink,
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: kamar.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.78,
              ),
              itemBuilder: (context, index) {
                final data = kamar[index];
                final bool tersedia = data["tersedia"] as bool;
                final Color statusColor = tersedia ? AppColors.available : AppColors.full;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailKamarPage(
                          nama: data["nama"],
                          kelas: data["kelas"],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: AppColors.border, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.pink.withOpacity(0.06),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: AppColors.pinkSoft,
                          child: const Icon(
                            Icons.bed,
                            color: AppColors.pink,
                            size: 26,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          data["nama"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: AppColors.darkText,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          data["kelas"],
                          style: const TextStyle(
                            color: AppColors.greyText,
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: statusColor.withOpacity(0.3), width: 1),
                          ),
                          child: Text(
                            tersedia ? "TERSEDIA" : "PENUH",
                            style: TextStyle(
                              color: statusColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}


class DetailKamarPage extends StatefulWidget {
  final String nama;
  final String kelas;

  const DetailKamarPage({
    super.key,
    required this.nama,
    required this.kelas,
  });

  @override
  State<DetailKamarPage> createState() => _DetailKamarPageState();
}

class _DetailKamarPageState extends State<DetailKamarPage> {
  bool tampilkanPopup = false;

  Widget _fasilitasRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.darkText,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              color: AppColors.pinkSoft,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.pink,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pinkLight,
      body: Center(
        child: Container(
          width: 260,
          height: 500,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.border, width: 1.5),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.pink.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.pinkSoft,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: AppColors.pink,
                          size: 18,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Room card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.pinkSoft, Color(0xFFFFF0F5)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.pink.withOpacity(0.15),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.bed,
                              color: AppColors.pink,
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            widget.nama,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.darkText,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.pink.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              widget.kelas,
                              style: const TextStyle(
                                color: AppColors.pink,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),
                    const Text(
                      "Fasilitas",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: AppColors.darkText,
                      ),
                    ),

                    const SizedBox(height: 4),

                    _fasilitasRow("AC & TV", "Tersedia"),
                    Divider(color: AppColors.border, height: 1),
                    _fasilitasRow("Monitoring Medis", "24 Jam"),
                    Divider(color: AppColors.border, height: 1),
                    _fasilitasRow("Status", "Kosong"),

                    const Spacer(),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.pink,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 2,
                          shadowColor: AppColors.pink.withOpacity(0.4),
                        ),
                        onPressed: () {
                          setState(() {
                            tampilkanPopup = true;
                          });
                        },
                        child: const Text(
                          "Booking",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Popup Konfirmasi
              if (tampilkanPopup)
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      color: Colors.black.withOpacity(0.25),
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.pink.withOpacity(0.15),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(14),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.pinkSoft,
                                ),
                                child: const Icon(
                                  Icons.bookmark_added,
                                  color: AppColors.pink,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(height: 14),
                              const Text(
                                "Konfirmasi Booking",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.darkText,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Apakah anda yakin ingin booking ${widget.nama}?",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: AppColors.greyText,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: AppColors.pink,
                                        side: const BorderSide(color: AppColors.pink),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          tampilkanPopup = false;
                                        });
                                      },
                                      child: const Text("Batal"),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.pink,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          tampilkanPopup = false;
                                        });
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            backgroundColor: AppColors.pink,
                                            content: Text(
                                              "${widget.nama} berhasil dibooking",
                                              style: const TextStyle(color: Colors.white),
                                            ),
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Ya",
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  Uint8List? image;

  Future<void> pilihGambar() async {
    final picker = ImagePicker();

    final XFile? file =
    await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      image = await file.readAsBytes();
      setState(() {});
    }
  }

  Widget itemProfile(IconData icon, String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.pinkMedium,
            size: 22,
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.darkText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: 140,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFEAF1FF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(120),
                    bottomRight: Radius.circular(120),
                  ),
                ),

                child: const Padding(
                  padding: EdgeInsets.only(top: 25),

                  child: Text(
                    "Profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkText,
                    ),
                  ),
                ),
              ),


              Positioned(
                bottom: -40,
                child: GestureDetector(
                  onTap: pilihGambar,

                  child: Container(
                    padding: const EdgeInsets.all(4),

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                        ),
                      ],
                    ),

                    child: CircleAvatar(
                      radius: 38,
                      backgroundColor: Colors.white,
                      backgroundImage:
                      image != null ? MemoryImage(image!) : null,

                      child: image == null
                          ? const Icon(
                        Icons.person_outline,
                        size: 45,
                        color: AppColors.pinkMedium,
                      )
                          : null,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 55),

          // ================= ISI PROFILE =================

          itemProfile(Icons.person_outline, "PAB 2025"),

          itemProfile(Icons.link, "1462300196"),

          itemProfile(Icons.email_outlined, "putrijae@gmail.com"),

          itemProfile(Icons.location_on_outlined, "Surabaya"),

          itemProfile(Icons.camera_alt_outlined, "pab2026"),

          const SizedBox(height: 20),

          // ================= DEKORASI BAWAH =================

          Container(
            height: 70,
            width: double.infinity,

            decoration: const BoxDecoration(
              color: Color(0xFFEAF1FF),

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(120),
                topRight: Radius.circular(120),
              ),
            ),
          ),
        ],
      ),
    );
  }
}