import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'home_map_page.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({Key? key}) : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final TextEditingController _phoneController = TextEditingController();
  final List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());
  bool _isCodeSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.blackText),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                !_isCodeSent ? 'رقم الهاتف' : 'تأكيد الرمز (OTP)',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackText,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                !_isCodeSent
                    ? 'أدخل رقم هاتفك لتلقي رمز التأكيد'
                    : 'أدخل الرمز المكون من 4 أرقام المرسل إلى هاتفك',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.grayText,
                ),
              ),
              const SizedBox(height: 32),

              // المرحلة الأولى: أدخل رقم الهاتف
              if (!_isCodeSent) ...[
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone, color: AppColors.primaryPurple),
                    hintText: '06XX XX XX XX',
                    filled: true,
                    fillColor: AppColors.lightGrayBackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      if (_phoneController.text.isNotEmpty) {
                        setState(() {
                          _isCodeSent = true;
                        });
                      }
                    },
                    child: const Text(
                      'إرسال الرمز',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ]

              // المرحلة الثانية: أدخل رمز الـ OTP
              else ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (index) => SizedBox(
                      width: 55,
                      height: 55,
                      child: TextField(
                        controller: _otpControllers[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: AppColors.lightGrayBackground,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (val) {
                          if (val.isNotEmpty && index < 3) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryTeal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      // بعد التأكيد بنجاح الانتقال للواجهة الرئيسية (الخريطة)
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeMapPage(),
                        ),
                        (route) => false,
                      );
                    },
                    child: const Text(
                      'تأكيد والدخول',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
