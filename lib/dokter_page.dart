import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

import 'dokter_detail_page.dart';

// =====================================================
// WARNA TEMA (sama dengan main.dart)
// =====================================================
class AppColors {
  static const Color pink = Color(0xFFE91E63);
  static const Color pinkSoft = Color(0xFFFCE4EC);
  static const Color pinkMedium = Color(0xFFF48FB1);
  static const Color pinkLight = Color(0xFFFFF0F5);
  static const Color white = Color(0xFFFFFFFF);
  static const Color greyText = Color(0xFF9E9E9E);
  static const Color darkText = Color(0xFF3D2B3D);
  static const Color border = Color(0xFFF8BBD0);
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Uint8List? hospitalImage;

  Future<void> pilihGambarRS() async {
    final picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      hospitalImage = await file.readAsBytes();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header bar pink soft
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            decoration: const BoxDecoration(
              color: AppColors.pinkSoft,
              borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
            ),
            child: const Text(
              "Home",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.pink,
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),

                  // Banner foto RS
                  GestureDetector(
                    onTap: pilihGambarRS,
                    child: Container(
                      height: 130,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.pinkSoft,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: AppColors.border, width: 1.5),
                        image: hospitalImage != null
                            ? DecorationImage(
                          image: MemoryImage(hospitalImage!),
                          fit: BoxFit.cover,
                        )
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.pink.withOpacity(0.08),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: hospitalImage == null
                          ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.pink.withOpacity(0.15),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.add_a_photo,
                              size: 28,
                              color: AppColors.pink,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Tambah foto rumah sakit",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.pinkMedium,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                          : null,
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Label
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 18,
                        decoration: BoxDecoration(
                          color: AppColors.pink,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Kategori Dokter",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.darkText,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Expanded(
                    child: ListView(
                      children: [
                        _buildMenuButton(context, Icons.local_hospital, "Dokter Umum"),
                        _buildMenuButton(context, Icons.healing, "Dokter Gigi"),
                        _buildMenuButton(context, Icons.child_care, "Dokter Anak"),
                        _buildMenuButton(context, Icons.pets, "Dokter Hewan"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoctorDetailPage(category: title),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border, width: 1),
            boxShadow: [
              BoxShadow(
                color: AppColors.pink.withOpacity(0.06),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon circle pink
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.pinkSoft,
                ),
                child: Icon(icon, color: AppColors.pink, size: 20),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkText,
                  ),
                ),
              ),

              // Arrow pink
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.pinkSoft,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: AppColors.pink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}