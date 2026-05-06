import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String name;
  final String role;
  final int level;
  final String rank;

  const HeaderWidget({
    super.key,
    required this.name,
    required this.role,
    required this.level,
    required this.rank,
  });

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

  @override
  Widget build(BuildContext context) {
    final Color rc = _rankColor(rank);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1B2A),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF1E90FF).withOpacity(0.25)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1E90FF).withOpacity(0.07),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // ── Avatar ──
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF1E90FF).withOpacity(0.5),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1E90FF).withOpacity(0.2),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(
                    'https://us.feliway.com/cdn/shop/articles/10_fascinating_facts_about_black_cats-3.jpg?v=1712147891',
                  ),
                ),
              ),
              // Level badge
              Positioned(
                bottom: -4,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF0047AB), Color(0xFF1E90FF)],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Lv.$level',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 14),

          // ── Nama, Job, Stats ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  role,
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color(0xFF1E90FF).withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),

                // ── HP | MP | STR ──
                Row(
                  children: [
                    _stat('HP', Icons.favorite, Colors.redAccent),
                    const SizedBox(width: 6),
                    _stat('MP', Icons.auto_awesome, const Color(0xFF1E90FF)),
                    const SizedBox(width: 6),
                    _stat('STR', Icons.fitness_center, Colors.greenAccent),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // ── Rank Badge ──
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: rc.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: rc.withOpacity(0.45)),
              boxShadow: [
                BoxShadow(
                  color: rc.withOpacity(0.2),
                  blurRadius: 16,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  rank.toUpperCase(),
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: rc,
                  ),
                ),
                Text(
                  'RANK',
                  style: TextStyle(
                    fontSize: 7,
                    color: rc.withOpacity(0.7),
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 10, color: color),
          const SizedBox(width: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
