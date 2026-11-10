class AppLocalizations {
  final String locale;
  AppLocalizations(this.locale);

  static final Map<String, Map<String, String>> _localizedValues = {
    // ----------------- الفرنسية (Français) -----------------
    'fr': {
      'app_name': 'vaigo',
      'slogan': 'SENTEZ\nL\'ÉQUITÉ',
      'search_hint': 'Où et pour combien ?',
      'route_title': 'Indiquer votre itinéraire',
      'from': 'De',
      'to': 'À',
      'recommended_fare': 'Tarif recommandé',
      'find_drivers': 'Trouver des conducteurs',
      'searching_drivers': 'Recherche de conducteurs',
      'cancel_order': 'Annuler la commande',
      'accept': 'Accepter',
      'refuse': 'Refuser',
      'driver_arriving': 'Le conducteur arrive dans ~1 min',
      'contact_driver': 'Contacter le conducteur',
      'security': 'Sécurité',
      'remarks': 'Vous avez des remarques pour le conducteur ?',
      'course': 'Course',
      'moto': 'Moto',
      'confort': 'Confort',
    },

    // ----------------- العربية الفصحى -----------------
    'ar': {
      'app_name': 'فايجو',
      'slogan': 'اشعر\nبالإنصاف',
      'search_hint': 'إلى أين وبكم؟',
      'route_title': 'حدد وجهتك',
      'from': 'من',
      'to': 'إلى',
      'recommended_fare': 'السعر المقترح',
      'find_drivers': 'البحث عن السائقين',
      'searching_drivers': 'جاري البحث عن السائقين',
      'cancel_order': 'إلغاء الطلب',
      'accept': 'قبول',
      'refuse': 'رفض',
      'driver_arriving': 'السائق سيصل خلال دقيقة تقريباً',
      'contact_driver': 'اتصل بالسائق',
      'security': 'الأمان',
      'remarks': 'هل لديك ملاحظات للسائق؟',
      'course': 'سيارة',
      'moto': 'دراجة نارية',
      'confort': 'مريح',
    },

    // ----------------- الدارجة المغربية -----------------
    'ary': {
      'app_name': 'vaigo',
      'slogan': 'حس\nبالعدل',
      'search_hint': 'فين غادي و شحال تخلص؟',
      'route_title': 'حدد الطريق ديالك',
      'from': 'من',
      'to': 'لـ',
      'recommended_fare': 'الثمن المقترح',
      'find_drivers': 'قلب على السوّاق',
      'searching_drivers': 'جاري البحث على السوّاق',
      'cancel_order': 'إلغاء الطلب',
      'accept': 'قبول',
      'refuse': 'رفض',
      'driver_arriving': 'السائق غادي يوصل فهاديك دقيقة تقريباً',
      'contact_driver': 'عيط للسائق',
      'security': 'الأمان',
      'remarks': 'عندك شي ملاحظة للسائق؟',
      'course': 'طوموبيل',
      'moto': 'ماطور',
      'confort': 'كونفور',
    },

    // ----------------- الإنجليزية (English) -----------------
    'en': {
      'app_name': 'vaigo',
      'slogan': 'FEEL\nTHE FAIRNESS',
      'search_hint': 'Where to & for how much?',
      'route_title': 'Set your route',
      'from': 'From',
      'to': 'To',
      'recommended_fare': 'Recommended fare',
      'find_drivers': 'Find drivers',
      'searching_drivers': 'Searching for drivers',
      'cancel_order': 'Cancel order',
      'accept': 'Accept',
      'refuse': 'Refuse',
      'driver_arriving': 'Driver arriving in ~1 min',
      'contact_driver': 'Contact driver',
      'security': 'Security',
      'remarks': 'Any notes for the driver?',
      'course': 'Ride',
      'moto': 'Moto',
      'confort': 'Comfort',
    },
  };

  String translate(String key) {
    return _localizedValues[locale]?[key] ?? _localizedValues['fr']?[key] ?? key;
  }
}
