import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  
  // بيانات تجريبية للراكب (يمكن ربطها بقاعدة البيانات لاحقاً)
  final String _userName = "يوسف الإدريسي";
  final String _userPhone = "+212 600 000000";

  // دالة لاختيار صورة البروفيل من الاستديو أو الكاميرا بحرية
  Future<void> _pickProfileImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 600,
        imageQuality: 80,
      );

      if (image != null) {
        setState(() {
          _profileImage = File(image.path);
        });
      }
    } catch (e) {
      debugPrint("خطأ في اختيار الصورة: $e");
    }
  }

  // نافذة منبثقة صغيرة باش الراكب يختار واش يجيب الصورة من الاستديو ولا يصورها
  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'تغيير صورة البروفيل',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackText,
                ),
              ),
              const SizedBox(height: 15),
              ListTile(
                leading: const Icon(Icons.photo_library, color: AppColors.primaryPurple),
                title: const Text('اختيار من معرض الصور (الاستديو)'),
                onTap: () {
                  Navigator.pop(context);
                  _pickProfileImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, color: AppColors.primaryPurple),
                title: const Text('التقاط صورة جديدة بالكاميرا'),
                onTap: () {
                  Navigator.pop(context);
                  _pickProfileImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'الملف الشخصي',
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
              const SizedBox(height: 20),
              
              // دائرة صورة البروفيل مع زر التعديل
              Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryPurple,
                        width: 3,
                      ),
                      color: AppColors.lightGrayBackground,
                      image: _profileImage != null
                          ? DecorationImage(
                              image: FileImage(_profileImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: _profileImage == null
                        ? const Icon(
                            Icons.person,
                            size: 70,
                            color: AppColors.grayText,
                          )
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: _showImageSourceDialog,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryPurple,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // اسم الراكب
              Text(
                _userName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackText,
                ),
              ),
              const SizedBox(height: 6),

              // رقم الهاتف
              Text(
                _userPhone,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.grayText,
                ),
              ),
              const SizedBox(height: 40),

              // خيارات الملف الشخصي الإضافية
              _buildProfileOption(
                icon: Icons.security,
                title: 'الأمان والتحقق بالوجه',
                subtitle: 'إعدادات حماية الحساب والرحلات',
                onTap: () {
                  // يمكن توجيهه لصفحة معلومات الأمان
                },
              ),
              _buildProfileOption(
                icon: Icons.history,
                title: 'سجل الرحلات',
                subtitle: 'الاطلاع على رحلاتك السابقة في vaigo',
                onTap: () {
                  // الانتقال لسجل الرحلات
                },
              ),
              _buildProfileOption(
                icon: Icons.support_agent,
                title: 'الدعم المباشر ومساعدة',
                subtitle: 'تواصل معنا في حالة طارئة',
                onTap: () {
                  // الانتقال لصفحة المساعدة
                },
              ),

              const Spacer(),

              // زر حفظ التغييرات (إن وجد)
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تم حفظ تعديلات الملف الشخصي بنجاح')),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'حفظ التغييرات',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  // ودجت لتصميم عناصر القائمة في الملف الشخصي
  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: AppColors.lightGrayBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primaryPurple.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primaryPurple),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: AppColors.blackText,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: AppColors.grayText),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.grayText),
        onTap: onTap,
      ),
    );
  }
}
