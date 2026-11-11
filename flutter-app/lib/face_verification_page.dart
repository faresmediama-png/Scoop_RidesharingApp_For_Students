import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'app_colors.dart';
import 'track_ride_page.dart';

class FaceVerificationPage extends StatefulWidget {
  const FaceVerificationPage({Key? key}) : super(key: key);

  @override
  State<FaceVerificationPage> createState() => _FaceVerificationPageState();
}

class _FaceVerificationPageState extends State<FaceVerificationPage> {
  File? _selfieImage;
  final ImagePicker _picker = ImagePicker();
  bool _isCapturing = false;

  // التقاط سيلفي أمني حي حصرياً للتأكد من الهوية
  Future<void> _captureLiveSelfie() async {
    setState(() {
      _isCapturing = true;
    });

    try {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front, // الكاميرا الأمامية حصرياً للأمان
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Text(
                'لضمان أمان رحلات vaigo، يرجى التقاط صورة سيلفي حية الآن للتحقق من مطابقة هويتك قبل المتابعة.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.grayText,
                ),
              ),
              const Spacer(),

              // إطار السيلفي الأمني المؤقت
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
                              Icons.camera_front,
                              size: 60,
                              color: AppColors.primaryPurple,
                            ),
                            SizedBox(height: 12),
                            Text(
                              'اضغط لالتقاط سيلفي الأمان',
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

              if (_selfieImage != null)
                TextButton.icon(
                  onPressed: _captureLiveSelfie,
                  icon: const Icon(Icons.refresh, color: AppColors.primaryPurple),
                  label: const Text(
                    'إعادة التقاط السيلفي',
                    style: TextStyle(
                      color: AppColors.primaryPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              const Spacer(),

              // زر المتابعة
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
                          // الانتقال لشاشة تتبع الرحلة
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
