import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

// =====================================================
// WARNA TEMA (sama dengan main.dart & dokter_page.dart)
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

class DoctorDetailPage extends StatefulWidget {
  final String category;

  const DoctorDetailPage({
    super.key,
    required this.category,
  });

  @override
  State<DoctorDetailPage> createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  bool tampilkanPopup = false;
  Uint8List? doctorImage;

  Future<void> pilihGambarDokter() async {
    final picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      doctorImage = await file.readAsBytes();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pinkLight,
      body: Center(
        child: Container(
          width: 260,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.border, width: 1.5),
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
              Column(
                mainAxisSize: MainAxisSize.min,
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

                  // Foto dokter
                  GestureDetector(
                    onTap: pilihGambarDokter,
                    child: Container(
                      height: 110,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.pinkSoft,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.border, width: 1.5),
                        image: doctorImage != null
                            ? DecorationImage(
                          image: MemoryImage(doctorImage!),
                          fit: BoxFit.cover,
                        )
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.pink.withOpacity(0.07),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: doctorImage == null
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
                              size: 24,
                              color: AppColors.pink,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "Tambah foto dokter",
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.pinkMedium,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                          : null,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Nama dokter & favorit
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "dr. Ahmad Hidayat",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: AppColors.darkText,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.pinkSoft,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              widget.category,
                              style: const TextStyle(
                                color: AppColors.pink,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.pinkSoft,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          color: AppColors.pink,
                          size: 18,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  Divider(color: AppColors.border, height: 1),
                  const SizedBox(height: 12),

                  // Jadwal praktik
                  _buildSectionLabel("JADWAL PRAKTIK", Icons.schedule),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 7),
                    decoration: BoxDecoration(
                      color: AppColors.pinkSoft,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.calendar_today,
                            size: 12, color: AppColors.pink),
                        SizedBox(width: 6),
                        Text(
                          "Mon - Fri, 8:00 AM - 5:00 PM",
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.pink,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Biografi
                  _buildSectionLabel("BIOGRAFI SINGKAT", Icons.person_outline),
                  const SizedBox(height: 6),
                  const Text(
                    "Dokter spesialis dengan pengalaman lebih dari 10 tahun.",
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.greyText,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Rating
                  Row(
                    children: [
                      ...List.generate(
                        4,
                            (i) => const Icon(Icons.star,
                            color: Colors.amber, size: 15),
                      ),
                      const Icon(Icons.star_half,
                          color: Colors.amber, size: 15),
                      const SizedBox(width: 6),
                      const Text(
                        "4.5",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkText,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "(128 ulasan)",
                        style: TextStyle(
                          fontSize: 10,
                          color: AppColors.greyText,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // Tombol buat janji
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
                        "Buat Janji Temu",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Popup konfirmasi
              if (tampilkanPopup)
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      color: Colors.black.withOpacity(0.25),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.all(12),
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
                                  Icons.assignment,
                                  color: AppColors.pink,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(height: 14),
                              const Text(
                                "Konfirmasi Janji Temu",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: AppColors.darkText,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Apakah anda yakin ingin membuat janji temu?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.greyText,
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 18),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: AppColors.pink,
                                        side: const BorderSide(
                                            color: AppColors.pink),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
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
                                          borderRadius:
                                          BorderRadius.circular(12),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          tampilkanPopup = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor: AppColors.pink,
                                            content: const Text(
                                              "Janji temu berhasil dibuat",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            behavior:
                                            SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Ya",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
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

  Widget _buildSectionLabel(String label, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 13, color: AppColors.pink),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 11,
            color: AppColors.darkText,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}