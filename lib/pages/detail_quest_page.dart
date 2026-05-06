import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:pertemuan4/models/quest_model.dart';

class DetailQuestPage extends StatelessWidget {
  final QuestModel quest;
  const DetailQuestPage({super.key, required this.quest});

  Color _rankColor(String r) {
    switch (r.toUpperCase()) {
      case 'S': return const Color(0xFFFFD700);
      case 'A': return const Color(0xFFFF6B35);
      case 'B': return const Color(0xFF9B59B6);
      case 'C': return const Color(0xFF1E90FF);
      case 'D': return const Color(0xFF2ECC71);
      case 'E': return const Color(0xFF00C6FF);
      default:  return const Color(0xFF95A5A6);
    }
  }

  String _rankLabel(String r) {
    switch (r.toUpperCase()) {
      case 'S': return 'S-RANK • MITOS';
      case 'A': return 'A-RANK • LEGENDA';
      case 'B': return 'B-RANK • EPIK';
      case 'C': return 'C-RANK • LANGKA';
      case 'D': return 'D-RANK • TIDAK UMUM';
      case 'E': return 'E-RANK • BIASA';
      default:  return 'F-RANK • PEMULA';
    }
  }

  String _bahayaLabel(String r) {
    switch (r.toUpperCase()) {
      case 'S': return 'Sangat Berbahaya';
      case 'A': return 'Berbahaya';
      case 'B': return 'Cukup Berbahaya';
      case 'C': return 'Sedang';
      case 'D': return 'Rendah';
      case 'E': return 'Sangat Rendah';
      default:  return 'Aman';
    }
  }

  String _tipeQuest(String r) {
    switch (r.toUpperCase()) {
      case 'S': return 'Raid Besar';
      case 'A': return 'Tim Elite';
      case 'B': return 'Tim Kecil';
      case 'C': return 'Pasangan / Solo';
      default:  return 'Solo';
    }
  }

  String _questObjective(String title) {
    if (title.toLowerCase().contains('slime')) return 'Kalahkan Raja Slime';
    if (title.toLowerCase().contains('artefak')) return 'Temukan artefak yang hilang';
    if (title.toLowerCase().contains('goblin')) return 'Habisi Raja Goblin';
    if (title.toLowerCase().contains('perbatasan')) return 'Jaga garis pertahanan';
    if (title.toLowerCase().contains('dungeon')) return 'Selidiki dungeon terlarang';
    return 'Selesaikan misi';
  }

  @override
  Widget build(BuildContext context) {
    final Color rc = _rankColor(quest.rank);

    return Scaffold(
      backgroundColor: const Color(0xFF050A18),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          // ── SLIVER APP BAR — foto melebar di atas ──
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            stretch: true,
            backgroundColor: const Color(0xFF050A18),
            elevation: 0,
            // Tombol back custom
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.45),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.15)),
                      ),
                      child: const Icon(
                        Icons.chevron_left_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // ── Foto Quest (Hero animation) ──
                  Hero(
                    tag: 'quest_img_${quest.id}',
                    child: Image.network(
                      quest.image,
                      fit: BoxFit.cover,
                      loadingBuilder: (_, child, progress) {
                        if (progress == null) return child;
                        return Container(
                          color: const Color(0xFF0D1B2A),
                          child: Center(
                            child: CircularProgressIndicator(
                              value: progress.expectedTotalBytes != null
                                  ? progress.cumulativeBytesLoaded /
                                      progress.expectedTotalBytes!
                                  : null,
                              color: rc,
                              strokeWidth: 2.5,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (_, __, ___) => Container(
                        color: const Color(0xFF0D1B2A),
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size: 64,
                            color: rc.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // ── Gradient overlay gelap dari bawah ──
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          const Color(0xFF050A18).withOpacity(0.5),
                          const Color(0xFF050A18),
                        ],
                        stops: const [0.0, 0.65, 1.0],
                      ),
                    ),
                  ),

                  // ── Gradient overlay biru tipis dari rank ──
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          rc.withOpacity(0.08),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),

                  // ── Rank pill badge (tengah-bawah) ──
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.35),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: rc.withOpacity(0.6),
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: rc.withOpacity(0.25),
                                  blurRadius: 16,
                                ),
                              ],
                            ),
                            child: Text(
                              _rankLabel(quest.rank),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: rc,
                                letterSpacing: 1.5,
                              ),
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

          // ── KONTEN DETAIL ──
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ── Judul Quest ──
                  Text(
                    quest.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    quest.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.45),
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 18),

                  // ── Info Cards ──
                  Row(
                    children: [
                      Expanded(
                        child: _infoCard(
                          icon: Icons.warning_amber_rounded,
                          label: 'Tingkat Bahaya',
                          value: _bahayaLabel(quest.rank),
                          color: rc,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _infoCard(
                          icon: Icons.person_outline_rounded,
                          label: 'Tipe Quest',
                          value: _tipeQuest(quest.rank),
                          color: const Color(0xFF1E90FF),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // ── Ringkasan Misi ──
                  _sectionCard(
                    icon: Icons.description_outlined,
                    title: 'Ringkasan Misi',
                    child: Text(
                      quest.description,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.65),
                        height: 1.7,
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // ── Tujuan Quest ──
                  _sectionCard(
                    icon: Icons.gps_fixed_rounded,
                    title: 'Tujuan Quest',
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF060F1E),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.07)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF1E90FF),
                                width: 2,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              _questObjective(quest.title),
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withOpacity(0.75),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0D1B2A),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.1)),
                            ),
                            child: Text(
                              '0/1',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white.withOpacity(0.4),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // ── Hadiah Quest ──
                  _sectionCard(
                    icon: Icons.card_giftcard_rounded,
                    title: 'Hadiah Quest',
                    child: _buildRewardList(quest.reward),
                  ),

                  // Space untuk tombol bawah
                  const SizedBox(height: 110),
                ],
              ),
            ),
          ),
        ],
      ),

      // ── Bottom Button ──
      bottomSheet: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        decoration: BoxDecoration(
          color: const Color(0xFF050A18).withOpacity(0.97),
          border: Border(
            top: BorderSide(color: Colors.white.withOpacity(0.07)),
          ),
        ),
        child: SafeArea(
          top: false,
          child: GestureDetector(
            onTap: quest.isTaken ? null : () => Navigator.pop(context, true),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              margin: const EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                color: quest.isTaken
                    ? const Color(0xFF0D1B2A)
                    : const Color(0xFF1E5FFF),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: quest.isTaken
                      ? Colors.white12
                      : const Color(0xFF1E5FFF),
                ),
                boxShadow: quest.isTaken
                    ? []
                    : [
                        BoxShadow(
                          color: const Color(0xFF1E5FFF).withOpacity(0.4),
                          blurRadius: 18,
                          offset: const Offset(0, 6),
                        ),
                      ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    quest.isTaken
                        ? Icons.check_circle_outline_rounded
                        : Icons.bolt_rounded,
                    color: quest.isTaken ? Colors.white24 : Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    quest.isTaken ? 'QUEST SUDAH DITERIMA' : 'TERIMA QUEST',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: quest.isTaken ? Colors.white24 : Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0A1628),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF1E90FF), size: 18),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF0A1628),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: color),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardList(String reward) {
    final parts = reward.split(', ');
    return Column(
      children: parts.map((part) {
        final bool isCoin = part.contains('Koin');
        final bool isXP = part.contains('XP');

        IconData icon;
        Color color;
        if (isCoin) {
          icon = Icons.monetization_on_rounded;
          color = const Color(0xFFFFD700);
        } else if (isXP) {
          icon = Icons.auto_awesome_rounded;
          color = Colors.amberAccent;
        } else {
          icon = Icons.backpack_outlined;
          color = Colors.purpleAccent;
        }

        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF060F1E),
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(color: Colors.white.withOpacity(0.07)),
          ),
          child: Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 12),
              Text(
                part.trim(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
