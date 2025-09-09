import 'package:flutter/material.dart';
import '../data/surah_data.dart';

class SurahList extends StatelessWidget {
  const SurahList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: arabicAuranSuras.length,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context, index) {
        final arabic = arabicAuranSuras[index];
        final english = englishQuranSurahs[index];
        final aya = AyaNumber[index];

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFFE2BE7F),
            child: Text(
              (index + 1).toString(),
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          title: Text(
            arabic,
            textDirection: TextDirection.rtl,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Janna LT'),
          ),
          subtitle: Row(
            children: [
              Text(english, style: const TextStyle(fontSize: 13, color: Colors.grey)),
              const SizedBox(width: 8),
              Text('• ${aya} آية', style: const TextStyle(fontSize: 13, color: Colors.grey)),
            ],
          ),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Open ${arabic} — ${english}')),
            );
          },
        );
      },
    );
  }
}