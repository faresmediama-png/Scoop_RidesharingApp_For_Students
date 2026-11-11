import 'package:flutter/material.dart';
import 'app_colors.dart';

class DriverSearchPage extends StatefulWidget {
  const DriverSearchPage({Key? key}) : super(key: key);

  @override
  State<DriverSearchPage> createState() => _DriverSearchPageState();
}

class _DriverSearchPageState extends State<DriverSearchPage> {
  int fare = 11;
  bool autoAccept = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.lightGrayBackground,
            child: const Center(
              child: Text(
                'Map Tracking View',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 16,
            child: CircleAvatar(
              backgroundColor: AppColors.whiteBackground,
              radius: 22,
              child: IconButton(
                icon: const Icon(Icons.close, color: AppColors.blackText),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.whiteBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Recherche de conducteurs',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackText,
                        ),
                      ),
                      Text(
                        '0:58',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: const [
                      Icon(Icons.check_circle, color: Colors.blue, size: 16),
                      SizedBox(width: 6),
                      Text(
                        'Tous les conducteurs sont vérifiés',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.grayText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: 0.7,
                    backgroundColor: Colors.grey[200],
                    color: AppColors.primaryPurple,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.lightGrayBackground,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, color: AppColors.grayText),
                          onPressed: () {
                            setState(() {
                              if (fare > 5) fare--;
                            });
                          },
                        ),
                        Column(
                          children: [
                            Text(
                              '$fare MAD',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackText,
                              ),
                            ),
                            const Text(
                              'Tarif recommandé',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.grayText,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.add, color: AppColors.blackText),
                          onPressed: () {
                            setState(() {
                              fare++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lightGrayBackground,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Confirmer',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.grayText,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Accepter automatiquement le conducteur le plus proche pour $fare MAD',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.blackText,
                          ),
                        ),
                      ),
                      Switch(
                        value: autoAccept,
                        activeColor: AppColors.primaryPurple,
                        onChanged: (value) {
                          setState(() {
                            autoAccept = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
