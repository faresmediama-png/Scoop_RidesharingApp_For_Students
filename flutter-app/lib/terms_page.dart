import 'package:flutter/material.dart';
import 'app_colors.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.blackText),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Conditions & Confidentialité',
          style: TextStyle(
            color: AppColors.blackText,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: const [
              Text(
                'Conditions d\'utilisation',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryPurple,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Bienvenue sur vaigo. En utilisant notre application, vous acceptez de respecter et d\'être lié par les conditions suivantes. Veuillez les lire attentivement.',
                style: TextStyle(fontSize: 14, color: AppColors.grayText, height: 1.5),
              ),
              SizedBox(height: 24),
              Text(
                'Politique de confidentialité',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryPurple,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Nous accordons une grande importance à la protection de vos données personnelles. Cette politique décrit comment nous collectons, utilisons et protégeons vos informations lorsque vous effectuez des courses via notre plateforme.',
                style: TextStyle(fontSize: 14, color: AppColors.grayText, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
