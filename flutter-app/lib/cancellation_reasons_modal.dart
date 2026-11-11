import 'package:flutter/material.dart';
import 'app_colors.dart';

class CancellationReasonsModal extends StatelessWidget {
  const CancellationReasonsModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> reasons = [
      "Je n'ai plus besoin de course",
      "Besoin d'effectuer des modifications de la course",
      "Aucun déplacement du conducteur ou conducteur hors itinéraire",
      "Le conducteur est en retard",
      "Le conducteur demande un prix supplémentaire",
      "Le conducteur a demandé l'annulation",
      "Autre voiture",
      "Problème avec l'appli",
      "Autre raison"
    ];

    return Container(
      padding: const EdgeInsets.all(20),
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
                'Pourquoi souhaitez-vous annuler ?',
                style: TextStyle(
                  fontSize: 18,
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
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: reasons.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // يمكنك معالجة سبب الإلغاء هنا والرجوع للخلف
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Text(
                      reasons[index],
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.blackText,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
