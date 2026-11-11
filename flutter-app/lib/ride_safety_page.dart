import 'package:flutter/material.dart';
import 'app_colors.dart';

class RideSafetyPage extends StatelessWidget {
  const RideSafetyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.whiteBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sécurité de la course',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackText,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: AppColors.blackText),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          // خيار مشاركة الرحلة
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: AppColors.lightGrayBackground,
              child: Icon(Icons.share, color: AppColors.primaryPurple),
            ),
            title: const Text(
              'Partager ma course',
              style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.blackText),
            ),
            subtitle: const Text(
              'Envoyer l\'itinéraire en temps réel à un proche',
              style: TextStyle(fontSize: 12, color: AppColors.grayText),
            ),
            onTap: () {
              // منطق مشاركة الرابط
            },
          ),
          const Divider(height: 24),

          // خيار الاتصال بالطوارئ (190)
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.redAccent,
              child: Icon(Icons.local_police, color: Colors.white),
            ),
            title: const Text(
              'Appeler 190 (Police)',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),
            ),
            subtitle: const Text(
              'En cas d\'urgence immédiate',
              style: TextStyle(fontSize: 12, color: AppColors.grayText),
            ),
            onTap: () {
              // الاتصال برقم الطوارئ
            },
          ),
          const Divider(height: 24),

          // معلومات حول التحقق من السائقين
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Icon(Icons.verified_user, color: Colors.blue, size: 20),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Tous les conducteurs sont vérifiés par leurs documents officiels.',
                    style: TextStyle(fontSize: 13, color: AppColors.grayText),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
