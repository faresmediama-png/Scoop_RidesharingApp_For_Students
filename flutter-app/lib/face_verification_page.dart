import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'app_colors.dart';
import 'track_ride_page.dart'; // الشاشة التي تنتقل إليها بعد التحقق

class FaceVerificationPage extends StatefulWidget {
  const FaceVerificationPage({Key? key}) : super(key: key);

  @override
  State<FaceVerificationPage> createState() => _FaceVerificationPageState();
}

class _FaceVerificationPageState extends State<FaceVerificationPage> {
  File? _selfieImage;
  final ImagePicker _picker = ImagePicker();
  bool _isCapturing = false;

  // دالة لالتقاط الصورة الحية عبر الكاميرا الأمامية حصرياً
  Future<void> _captureLiveSelfie() async {
    setState(() {
      _isCapturing = true;
    });

    try {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front, // الكاميرا الأمامية
        maxWidth: 600,
        imageQuality: 80,
      );

      if (photo != null) {
        setState(() {
          _selfieImage = File(photo.path);
        });
      }
    } catch (e) {
      debugPrint("خطأ في تشغيل الكاميرا: $e");
    } finally {
      setState(() {
        _isCapturing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'التحقق الأمني للوجه',
          style: TextStyle(
            color: AppColors.blackText,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.blackText),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Text(
                'لحماية سلامتك، يرجى التقاط صورة سيلفي حية الآن لمطابقة هويتك مع الحساب قبل انطلاق الرحلة.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.grayText,
                ),
              ),
              const Spacer(),

              // إطار عرض الصورة أو زر الكاميرا
              GestureDetector(
                onTap: _captureLiveSelfie,
                child: Container(
                  width: 230,
                  height: 230,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _selfieImage != null
                          ? AppColors.primaryPurple
                          : AppColors.secondaryTeal,
                      width: 4,
                    ),
                    color: AppColors.lightGrayBackground,
                    image: _selfieImage != null
                        ? DecorationImage(
                            image: FileImage(_selfieImage!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: _selfieImage == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.camera_alt,
                              size: 60,
                              color: AppColors.primaryPurple,
                            ),
                            SizedBox(height: 12),
                            Text(
                              'اضغط لالتقاط السيلفي',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.grayText,
                              ),
                            ),
                          ],
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 24),

              // زر إعادة التقاط الصورة إذا لم تعجب الراكب
              if (_selfieImage != null)
                TextButton.icon(
                  onPressed: _captureLiveSelfie,
                  icon: const Icon(Icons.refresh, color: AppColors.primaryPurple),
                  label: const Text(
                    'إعادة التقاط الصورة',
                    style: TextStyle(
                      color: AppColors.primaryPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              const Spacer(),

              // زر التأكيد والمتابعة (معطل حتى يتم التقاط الصورة)
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selfieImage != null
                        ? AppColors.primaryPurple
                        : Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  onPressed: _selfieImage != null
                      ? () {
                          // الانتقال لشاشة تتبع الرحلة بعد نجاح التحقق
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const TrackRidePage(),
                            ),
                          );
                        }
                      : null,
                  child: const Text(
                    'تأكيد ومتابعة الرحلة',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
