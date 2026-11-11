import 'package:flutter/material.dart';
import 'app_colors.dart';

class RideOptionsModal extends StatefulWidget {
  const RideOptionsModal({Key? key}) : super(key: key);

  @override
  State<RideOptionsModal> createState() => _RideOptionsModalState();
}

class _RideOptionsModalState extends State<RideOptionsModal> {
  bool moreThanFourPassengers = false;
  final TextEditingController commentController = TextEditingController();

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
                'Options',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.blackText),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: AppColors.blackText),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Plus de 4 passagers',
                style: TextStyle(fontSize: 16, color: AppColors.blackText),
              ),
              Switch(
                value: moreThanFourPassengers,
                activeColor: AppColors.primaryPurple,
                onChanged: (val) {
                  setState(() {
                    moreThanFourPassengers = val;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: commentController,
            decoration: InputDecoration(
              hintText: 'Commentaires',
              filled: true,
              fillColor: AppColors.lightGrayBackground,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryTeal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Fermer',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
