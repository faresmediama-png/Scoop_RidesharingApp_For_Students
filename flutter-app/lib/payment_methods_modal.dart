import 'package:flutter/material.dart';
import 'app_colors.dart';

class PaymentMethodsModal extends StatefulWidget {
  const PaymentMethodsModal({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsModal> createState() => _PaymentMethodsModalState();
}

class _PaymentMethodsModalState extends State<PaymentMethodsModal> {
  String selectedMethod = 'Especes';

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
                'Modes de paiement',
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
          InkWell(
            onTap: () {
              setState(() {
                selectedMethod = 'Especes';
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.lightGrayBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.money, color: AppColors.secondaryTeal, size: 24),
                      SizedBox(width: 12),
                      Text(
                        'Espèces',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackText,
                        ),
                      ),
                    ],
                  ),
                  if (selectedMethod == 'Especes')
                    const Icon(Icons.check, color: AppColors.secondaryTeal),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Confirmer',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
