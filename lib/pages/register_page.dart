import 'package:flutter/material.dart';
import 'package:pertemuan4/models/user_model.dart';
import 'package:pertemuan4/pages/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscure = true;
  int? _selectedLevel;
  String? _selectedRank;
  String? _selectedRole;

  final List<int> _levels = List.generate(100, (i) => i + 1);
  final List<String> _ranks = ['S', 'A', 'B', 'C', 'D', 'E', 'F'];
  final List<String> _roles = [
    'Mage',
    'Fighter',
    'Assassin',
    'Tank',
    'Healer',
    'Archer',
    'Necromancer',
    'Paladin',
  ];

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_selectedLevel == null || _selectedRank == null || _selectedRole == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Lengkapi semua pilihan karakter'),
            backgroundColor: Color(0xFF1E90FF),
          ),
        );
        return;
      }
      final user = UserModel(
        name: _nameController.text,
        password: _passwordController.text,
        level: _selectedLevel!,
        rank: _selectedRank!,
        role: _selectedRole!,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomePage(user: user)),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  InputDecoration _inputDeco(String hint, IconData icon, {Widget? suffix}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.white.withOpacity(0.35), fontSize: 14),
      prefixIcon: Icon(icon, color: const Color(0xFF1E90FF), size: 18),
      suffixIcon: suffix,
      filled: true,
      fillColor: const Color(0xFF0D1B2A),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.12)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFF1E90FF), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  Widget _sectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF1E90FF), size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _dropdownField<T>({
    required T? value,
    required List<T> items,
    required String hint,
    required IconData icon,
    required void Function(T?) onChanged,
    required String Function(T) label,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0D1B2A),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          hint: Row(
            children: [
              Icon(icon, color: const Color(0xFF1E90FF), size: 18),
              const SizedBox(width: 8),
              Text(
                hint,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.35),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          icon: Icon(Icons.keyboard_arrow_down_rounded,
              color: Colors.white.withOpacity(0.4)),
          dropdownColor: const Color(0xFF0D1B2A),
          isExpanded: true,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Row(
                children: [
                  Icon(icon, color: const Color(0xFF1E90FF), size: 18),
                  const SizedBox(width: 8),
                  Text(label(item)),
                ],
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050A18),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 16),

                // ── Logo ──
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF0D1B2A),
                    border: Border.all(
                      color: const Color(0xFF1E90FF).withOpacity(0.6),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF1E90FF).withOpacity(0.25),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.shield_rounded,
                    color: Color(0xFF1E90FF),
                    size: 34,
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  'SISTEM GUILD HUNTER',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF1E90FF),
                    letterSpacing: 4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Pendaftaran Hunter',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Daftarkan diri dan mulai petualangan',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withOpacity(0.45),
                  ),
                ),

                const SizedBox(height: 28),

                // ── Form Card ──
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF0A1628),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.08),
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── Informasi Dasar ──
                      _sectionHeader('Informasi Dasar', Icons.person_outline_rounded),
                      const SizedBox(height: 14),

                      // Name + Password (2 kolom)
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: _nameController,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                  decoration: _inputDeco(
                                      'Nama Hunter', Icons.person_outline_rounded),
                                  validator: (v) =>
                                      (v == null || v.trim().isEmpty)
                                          ? 'Wajib diisi'
                                          : null,
                                ),
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text(
                                    'Masukkan nama karakter hunter',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white.withOpacity(0.35),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: _obscure,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                  decoration: _inputDeco(
                                    'Password',
                                    Icons.lock_outline_rounded,
                                    suffix: IconButton(
                                      icon: Icon(
                                        _obscure
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                        color: Colors.white30,
                                        size: 18,
                                      ),
                                      onPressed: () =>
                                          setState(() => _obscure = !_obscure),
                                    ),
                                  ),
                                  validator: (v) {
                                    if (v == null || v.isEmpty) return 'Wajib diisi';
                                    if (v.length < 6) return 'Min. 6 karakter';
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text(
                                    'Minimal 6 karakter',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white.withOpacity(0.35),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Divider
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.07),
                      ),

                      const SizedBox(height: 20),

                      // ── Informasi Karakter ──
                      _sectionHeader(
                          'Informasi Karakter', Icons.sports_martial_arts_rounded),
                      const SizedBox(height: 14),

                      // Level + Rank (2 kolom)
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Level',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white.withOpacity(0.6),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                _dropdownField<int>(
                                  value: _selectedLevel,
                                  items: _levels,
                                  hint: 'Pilih level',
                                  icon: Icons.military_tech_outlined,
                                  label: (v) => 'Level $v',
                                  onChanged: (v) =>
                                      setState(() => _selectedLevel = v),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rank',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white.withOpacity(0.6),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                _dropdownField<String>(
                                  value: _selectedRank,
                                  items: _ranks,
                                  hint: 'Pilih rank',
                                  icon: Icons.star_border_rounded,
                                  label: (v) => '$v-Rank',
                                  onChanged: (v) =>
                                      setState(() => _selectedRank = v),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      // Kelas / Job (full width)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kelas / Job',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.6),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 6),
                          _dropdownField<String>(
                            value: _selectedRole,
                            items: _roles,
                            hint: 'Pilih kelas / job',
                            icon: Icons.psychology_outlined,
                            label: (v) => v,
                            onChanged: (v) =>
                                setState(() => _selectedRole = v),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // ── Tombol ──
                      GestureDetector(
                        onTap: _submit,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E5FFF),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF1E5FFF).withOpacity(0.4),
                                blurRadius: 18,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.bolt_rounded,
                                  color: Colors.white, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'MASUK KE GUILD',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.auto_awesome,
                                size: 12, color: Color(0xFF1E90FF)),
                            const SizedBox(width: 6),
                            Text(
                              'Mulai perjalananmu sebagai Hunter',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.35),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                Text(
                  '— SISTEM HUNTER AKTIF —',
                  style: TextStyle(
                    fontSize: 10,
                    color: const Color(0xFF1E90FF).withOpacity(0.3),
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
