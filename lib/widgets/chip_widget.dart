import 'package:flutter/material.dart';

// Widget ini sudah dipindahkan ke dalam HeaderWidget sebagai _stat()
// File ini tetap ada untuk menjaga kompatibilitas project
class ChipWidget extends StatelessWidget {
  final String label;
  final IconData ikon;
  final Color warna;
  final int nilai;

  const ChipWidget({
    super.key,
    required this.label,
    required this.ikon,
    required this.warna,
    required this.nilai,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: warna.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: warna.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(ikon, size: 14, color: warna),
          const SizedBox(width: 4),
          Text(
            '$label $nilai',
            style: TextStyle(
              fontSize: 11,
              color: warna,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
