import 'package:flutter/material.dart';
import 'package:pertemuan4/models/quest_model.dart';
import 'package:pertemuan4/models/user_model.dart';
import 'package:pertemuan4/pages/detail_quest_page.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;

  final List<QuestModel> _quests = [
    QuestModel(
      id: '1',
      title: 'Musnahkan Raja Slime',
      rank: 'F',
      reward: '100 Koin Emas, 50 XP',
      image: 'https://cdn.pixabay.com/photo/2026/02/06/14/56/pixellabs-alien-10107963_1280.png',
      description:
          'Slime raksasa muncul di pinggiran desa dan mulai menyerap benda-benda di sekitarnya. Kalahkan sebelum semakin besar!',
    ),
    QuestModel(
      id: '2',
      title: 'Temukan Artefak yang Hilang',
      rank: 'E',
      reward: '200 Koin Emas',
      image: 'https://cdn.pixabay.com/photo/2020/02/15/03/16/not-dead-4849850_1280.jpg?w=600&q=80r',
      description:
          'Sebuah artefak kuno milik guild telah dicuri oleh perampok misterius. Lacak dan kembalikan artefak tersebut.',
    ),
    QuestModel(
      id: '3',
      title: 'Basmi Goblin di Gua Kegelapan',
      rank: 'C',
      reward: '500 Koin Emas, 300 XP, Pedang Langka',
      image: 'https://cdn.pixabay.com/photo/2026/05/03/15/18/15-18-58-104_1280.png',
      description:
          'Suku goblin bersatu di bawah pemimpin baru yang kuat. Masuki gua mereka dan habisi sang Raja Goblin.',
    ),
    QuestModel(
      id: '4',
      title: 'Jaga Perbatasan Kerajaan',
      rank: 'B',
      reward: '1.000 Koin Emas, 500 XP, Baju Zirah Biru',
      image: 'https://cdn.pixabay.com/photo/2023/03/24/20/00/ai-generated-7874720_1280.jpg',
      description:
          'Pasukan monster dari dungeon S-Rank mulai menerobos perbatasan utara. Pertahankan garis pertahanan selama 3 hari!',
    ),
    QuestModel(
      id: '5',
      title: 'Selidiki Dungeon Terlarang',
      rank: 'A',
      reward: '5.000 Koin Emas, 2.000 XP, Cincin Mana',
      image: 'https://cdn.pixabay.com/photo/2023/03/23/23/11/fantasy-7873005_1280.jpg',
      description:
          'Dungeon terlarang muncul di pusat kota. Hunter yang masuk belum ada yang kembali. Selidiki dan temukan kebenarannya.',
    ),
  ];

  Color _rankColor(String r) {
    switch (r.toUpperCase()) {
      case 'S':
        return const Color(0xFFFFD700);
      case 'A':
        return const Color(0xFFFF6B35);
      case 'B':
        return const Color(0xFF9B59B6);
      case 'C':
        return const Color(0xFF1E90FF);
      case 'D':
        return const Color(0xFF2ECC71);
      case 'E':
        return const Color(0xFF00C6FF);
      default:
        return const Color(0xFF95A5A6);
    }
  }

  Color _rankBgColor(String r) {
    switch (r.toUpperCase()) {
      case 'S':
        return const Color(0xFFFFD700);
      case 'A':
        return const Color(0xFFFF6B35);
      case 'B':
        return const Color(0xFF9B59B6);
      case 'C':
        return const Color(0xFF1E90FF);
      case 'D':
        return const Color(0xFF2ECC71);
      case 'E':
        return const Color(0xFF00C6FF);
      default:
        return const Color(0xFF95A5A6);
    }
  }

  IconData _questIcon(String rank) {
    switch (rank.toUpperCase()) {
      case 'S':
        return Icons.flash_on_rounded;
      case 'A':
        return Icons.local_fire_department_rounded;
      case 'B':
        return Icons.sports_martial_arts_rounded;
      case 'C':
        return Icons.sports_kabaddi_rounded;
      case 'E':
        return Icons.gps_fixed_rounded;
      default:
        return Icons.emoji_events_rounded;
    }
  }

  List<QuestModel> get _filteredQuests {
    switch (_selectedTab) {
      case 1:
        return _quests.where((q) => !q.isTaken).toList();
      case 2:
        return _quests.where((q) => q.isTaken).toList();
      default:
        return _quests;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050A18),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopSection(),
          _buildTabBar(),
          Expanded(child: _buildQuestList()),
        ],
      ),
    );
  }

  // ── TOP SECTION ──────────────────────────────────────────────────────────
  Widget _buildTopSection() {
    final Color rc = _rankColor(widget.user.rank);
    final int doneCount = _quests.where((q) => q.isTaken).length;

    return Container(
      color: const Color(0xFF050A18),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Greeting Row ──
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Datang,',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.45),
                          ),
                        ),
                        Text(
                          widget.user.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 3),
                          height: 2,
                          width: 30,
                          color: const Color(0xFF1E90FF),
                        ),
                      ],
                    ),
                  ),
                  // Quest count badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D1B2A),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF1E90FF).withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.bolt_rounded,
                            color: Color(0xFF1E90FF), size: 14),
                        const SizedBox(width: 5),
                        Text(
                          '$doneCount/${_quests.length} Selesai',
                          style: const TextStyle(
                            color: Color(0xFF1E90FF),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // ── CHARACTER CARD ──
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF0A1628),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.09),
                  ),
                ),
                child: Row(
                  children: [
                    // Avatar
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: rc.withOpacity(0.5), width: 2.5),
                        boxShadow: [
                          BoxShadow(
                            color: rc.withOpacity(0.2),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1679343550998-107ca3786edd?q=80&w=875&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Name + badges
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 3),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E90FF),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'LV. ${widget.user.level}',
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 3),
                              decoration: BoxDecoration(
                                color: rc,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '${widget.user.rank.toUpperCase()}-RANK',
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.user.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          widget.user.role,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.45),
                          ),
                        ),
                      ],
                    ),

                    // Vertical Divider
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      width: 1,
                      height: 60,
                      color: Colors.white.withOpacity(0.08),
                    ),

                    // Stats
                    Expanded(
                      child: Column(
                        children: [
                          _statRow('HP', Colors.redAccent, '❤️'),
                          const SizedBox(height: 8),
                          _statRow('MP', const Color(0xFF1E90FF), '💧'),
                          const SizedBox(height: 8),
                          _statRow('STR', Colors.greenAccent, '💚'),
                        ],
                      ),
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

  Widget _statRow(String label, Color color, String emoji) {
    return Row(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 12)),
        const SizedBox(width: 5),
        SizedBox(
          width: 28,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: 1.0,
              backgroundColor: Colors.white.withOpacity(0.07),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 7,
            ),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          '100/100',
          style: TextStyle(
            fontSize: 10,
            color: Colors.white.withOpacity(0.4),
          ),
        ),
      ],
    );
  }

  // ── TAB BAR ──────────────────────────────────────────────────────────────
  Widget _buildTabBar() {
    final tabs = ['Semua', 'Aktif', 'Selesai'];
    return Container(
      color: const Color(0xFF050A18),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Row(
        children: List.generate(tabs.length, (i) {
          final bool selected = _selectedTab == i;
          return GestureDetector(
            onTap: () => setState(() => _selectedTab = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
              decoration: BoxDecoration(
                color: selected
                    ? const Color(0xFF1E5FFF)
                    : const Color(0xFF0D1B2A),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: selected
                      ? const Color(0xFF1E5FFF)
                      : Colors.white.withOpacity(0.1),
                ),
              ),
              child: Text(
                tabs[i],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: selected ? Colors.white : Colors.white38,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // ── QUEST LIST ────────────────────────────────────────────────────────────
  Widget _buildQuestList() {
    final list = _filteredQuests;

    if (list.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inbox_outlined,
                size: 56, color: Colors.white.withOpacity(0.15)),
            const SizedBox(height: 12),
            Text(
              'Tidak ada quest',
              style: TextStyle(color: Colors.white.withOpacity(0.3)),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final quest = list[index];
        return _buildQuestCard(quest);
      },
    );
  }

  // ── QUEST CARD ────────────────────────────────────────────────────────────
  Widget _buildQuestCard(QuestModel quest) {
    final bool taken = quest.isTaken;
    final Color rc = _rankColor(quest.rank);

    // Parse reward parts
    final parts = quest.reward.split(', ');

    return GestureDetector(
      onTap: () async {
        final result = await Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, animation, __) => FadeTransition(
              opacity: animation,
              child: DetailQuestPage(quest: quest),
            ),
            transitionDuration: const Duration(milliseconds: 400),
          ),
        );
        if (result == true) setState(() => quest.isTaken = true);
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF0A1628),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: taken
                ? Colors.white.withOpacity(0.06)
                : const Color(0xFF1E90FF).withOpacity(0.3),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quest Image Thumbnail with Hero
            Hero(
              tag: 'quest_img_${quest.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: ColorFiltered(
                  colorFilter: taken
                      ? const ColorFilter.mode(Colors.black54, BlendMode.darken)
                      : const ColorFilter.mode(
                          Colors.transparent, BlendMode.multiply),
                  child: Image.network(
                    quest.image,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                    loadingBuilder: (_, child, progress) => progress == null
                        ? child
                        : Container(
                            width: 56,
                            height: 56,
                            color: const Color(0xFF0D1B2A),
                            child: Center(
                              child: SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: rc.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                    errorBuilder: (_, __, ___) => Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: rc.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: rc.withOpacity(0.4)),
                      ),
                      child: Icon(
                        _questIcon(quest.rank),
                        color: taken ? Colors.white12 : rc,
                        size: 26,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Title + Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quest.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: taken ? Colors.white30 : Colors.white,
                      decoration: taken ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    quest.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white.withOpacity(taken ? 0.2 : 0.4),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Rank + Rewards row
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      // Rank badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: taken
                              ? Colors.white.withOpacity(0.05)
                              : rc.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: taken
                                ? Colors.white.withOpacity(0.08)
                                : rc.withOpacity(0.5),
                          ),
                        ),
                        child: Text(
                          '${quest.rank}-RANK',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            color: taken ? Colors.white24 : rc,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),

                      // Reward chips
                      ...parts.map((part) => _rewardChip(part, taken)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 6),

            // Chevron
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: taken
                  ? const Icon(Icons.check_circle_rounded,
                      color: Colors.white12, size: 18)
                  : Icon(Icons.chevron_right_rounded,
                      color: Colors.white.withOpacity(0.3), size: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rewardChip(String text, bool taken) {
    final bool isXP = text.contains('XP');
    final bool isCoin = text.contains('Koin');
    final bool isItem =
        !isXP && !isCoin && text.trim().isNotEmpty;

    IconData icon;
    Color color;
    if (isXP) {
      icon = Icons.auto_awesome_rounded;
      color = Colors.amber;
    } else if (isCoin) {
      icon = Icons.monetization_on_rounded;
      color = const Color(0xFFFFD700);
    } else {
      icon = Icons.backpack_outlined;
      color = Colors.purpleAccent;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon,
            size: 12, color: taken ? Colors.white12 : color),
        const SizedBox(width: 3),
        Text(
          text.trim(),
          style: TextStyle(
            fontSize: 10,
            color: Colors.white.withOpacity(taken ? 0.15 : 0.5),
          ),
        ),
      ],
    );
  }
}
