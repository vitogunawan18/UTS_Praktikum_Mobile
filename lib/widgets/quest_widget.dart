import 'package:flutter/material.dart';
import 'package:pertemuan4/models/quest_model.dart';

class QuestWidget extends StatelessWidget {
  final QuestModel quest;
  final VoidCallback onTap;

  const QuestWidget({
    super.key,
    required this.quest,
    required this.onTap,
  });

  /// Warna berdasarkan rank Solo Leveling style
  Color _rankColor(String rank) {
    switch (rank.toUpperCase()) {
      case 'S': return const Color(0xFFFFD700);
      case 'A': return const Color(0xFFFF4500);
      case 'B': return const Color(0xFF9B59B6);
      case 'C': return const Color(0xFF1E90FF);
      case 'D': return const Color(0xFF2ECC71);
      case 'E': return const Color(0xFF00C6FF);
      default:  return const Color(0xFF95A5A6); // F rank
    }
  }

  String _rankLabel(String rank) {
    switch (rank.toUpperCase()) {
      case 'S': return '⚡ S-RANK';
      case 'A': return '🔥 A-RANK';
      case 'B': return '💜 B-RANK';
      case 'C': return '🔵 C-RANK';
      case 'D': return '🟢 D-RANK';
      case 'E': return '🩵 E-RANK';
      default:  return '⬜ F-RANK';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool taken = quest.isTaken;
    final Color rankColor = _rankColor(quest.rank);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1B2A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: taken
                ? Colors.white.withOpacity(0.06)
                : rankColor.withOpacity(0.35),
            width: taken ? 1 : 1.5,
          ),
          boxShadow: taken
              ? []
              : [
                  BoxShadow(
                    color: rankColor.withOpacity(0.12),
                    blurRadius: 20,
                    spreadRadius: 1,
                  ),
                ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Left accent bar
              if (!taken)
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [rankColor.withOpacity(0.8), rankColor.withOpacity(0.2)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                    ),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 14, 14),
                child: Row(
                  children: [
                    // Quest Image
                    Hero(
                      tag: 'quest_image_${quest.id}',
                      child: Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFF060F1E),
                          border: Border.all(
                            color: taken ? Colors.white10 : rankColor.withOpacity(0.3),
                          ),
                          image: DecorationImage(
                            image: AssetImage(quest.image),
                            fit: BoxFit.cover,
                            colorFilter: taken
                                ? const ColorFilter.mode(Colors.black54, BlendMode.darken)
                                : null,
                          ),
                        ),
                        child: taken
                            ? Icon(
                                Icons.check_circle,
                                color: rankColor.withOpacity(0.7),
                                size: 28,
                              )
                            : null,
                      ),
                    ),

                    const SizedBox(width: 14),

                    // Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            quest.title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: taken ? Colors.white30 : Colors.white,
                              decoration: taken ? TextDecoration.lineThrough : null,
                              letterSpacing: 0.3,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: rankColor.withOpacity(taken ? 0.05 : 0.12),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: rankColor.withOpacity(taken ? 0.1 : 0.3),
                              ),
                            ),
                            child: Text(
                              _rankLabel(quest.rank),
                              style: TextStyle(
                                fontSize: 10,
                                color: taken ? rankColor.withOpacity(0.4) : rankColor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Status / Arrow
                    if (taken)
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          'SELESAI',
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.white24,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    else
                      Icon(
                        Icons.chevron_right_rounded,
                        color: rankColor.withOpacity(0.5),
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
