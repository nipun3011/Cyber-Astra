import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'og9tmac8': {
      'en': 'Welcome to Cyber Astra',
      'hi': 'साइबर हब में आपका स्वागत है',
    },
    'z510chlh': {
      'en': 'DO',
      'hi': 'करना',
    },
    'b3t7y5ln': {
      'en':
          'Use hard-to-guess passwords or passphrases. To make it easy for you to remember but hard for an attacker to guess, create an acronym',
      'hi':
          'अनुमान लगाने में कठिन पासवर्ड या पासफ़्रेज़ का उपयोग करें। आपके लिए याद रखना आसान लेकिन हमलावर के लिए अनुमान लगाना कठिन हो, इसके लिए एक संक्षिप्त शब्द बनाएं',
    },
    '6xjmdsyp': {
      'en': 'DO',
      'hi': 'करना',
    },
    'fg393y2n': {
      'en':
          'Use different passwords for different accounts. If one password gets hacked, your other accounts are not compromised.',
      'hi':
          'अलग-अलग खातों के लिए अलग-अलग पासवर्ड का उपयोग करें। यदि एक पासवर्ड हैक हो जाता है, तो आपके अन्य खातों से समझौता नहीं किया जाता है।',
    },
    'q4pkhcek': {
      'en': 'DON\'T',
      'hi': 'नहीं',
    },
    'k37qrr1x': {
      'en':
          'Post any private or sensitive information, such as credit card numbers, passwords or other private information, on public sites, including social media sites.',
      'hi':
          'कोई भी निजी या संवेदनशील जानकारी, जैसे क्रेडिट कार्ड नंबर, पासवर्ड या अन्य निजी जानकारी, सोशल मीडिया साइटों सहित सार्वजनिक साइटों पर पोस्ट करें।',
    },
    '8sfbff0v': {
      'en': 'DO',
      'hi': 'करना',
    },
    '8bu3mt5w': {
      'en':
          'Lock your computer and mobile phone when not in use. This protects data from unauthorized access and use.',
      'hi':
          'उपयोग में न होने पर अपने कंप्यूटर और मोबाइल फोन को लॉक कर दें। यह डेटा को अनधिकृत पहुंच और उपयोग से बचाता है।',
    },
    '8u5qg87y': {
      'en': 'DON\'T',
      'hi': 'नहीं',
    },
    'araz6xca': {
      'en':
          'Install unauthorized programs on your work computer. Malicious applications often pose as legitimate software.',
      'hi':
          'अपने कार्य कंप्यूटर पर अनधिकृत प्रोग्राम इंस्टॉल करें. दुर्भावनापूर्ण एप्लिकेशन अक्सर वैध सॉफ़्टवेयर के रूप में सामने आते हैं।',
    },
    'nzhuauzf': {
      'en': 'Actions',
      'hi': 'कार्रवाई',
    },
    '3hc3nelp': {
      'en': 'Report an E-FIR',
      'hi': 'ई-एफआईआर रिपोर्ट करें',
    },
    '6kxp1l92': {
      'en': 'Block your bank card',
      'hi': 'अपना बैंक कार्ड ब्लॉक करें',
    },
    'o72c75bp': {
      'en': 'Community Help',
      'hi': 'सामुदायिक सहायता',
    },
    's2usk1w2': {
      'en': 'Emergency Contact',
      'hi': 'आपातकालीन संपर्क',
    },
    'sl03sfco': {
      'en': 'version no. 1.0',
      'hi': 'संस्करण संख्या. 1.0',
    },
    '4dn8lna3': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Helpline
  {
    'a8h7tgkz': {
      'en': 'Block your card to prevent fraud',
      'hi': 'धोखाधड़ी रोकने के लिए अपना कार्ड ब्लॉक करें',
    },
    'sj1dxohd': {
      'en': 'Enter your account number',
      'hi': 'अपना खाता नंबर दर्ज करें',
    },
    'zxha3y1v': {
      'en': 'Bank of Baroda',
      'hi': 'बैंक ऑफ बड़ौदा',
    },
    '4ikv63e7': {
      'en': 'Canara Bank',
      'hi': 'केनरा बैंक',
    },
    'wfermafl': {
      'en': 'Bank of India',
      'hi': 'बैंक ऑफ इंडिया',
    },
    'cy17nzgh': {
      'en': 'Central Bank of India',
      'hi': 'सेंट्रल बैंक ऑफ इंडिया',
    },
    'sfftx4k3': {
      'en': 'Indian Bank',
      'hi': 'इंडियन बैंक',
    },
    'popcwe37': {
      'en': 'Indian Overseas Bank',
      'hi': 'इंडियन ओवरसीज बैंक',
    },
    'l9sw1iar': {
      'en': 'Idfc First Bank Ltd',
      'hi': 'आईडीएफसी फर्स्ट बैंक लिमिटेड',
    },
    'z6vd6k9r': {
      'en': 'Fino Payments Bank',
      'hi': 'फिनो पेमेंट्स बैंक',
    },
    'ecvlydyq': {
      'en': 'Dbs Bank India Limited',
      'hi': 'डीबीएस बैंक इंडिया लिमिटेड',
    },
    'e9lkm2v4': {
      'en': 'Which Bank to Report ?',
      'hi': 'किस बैंक को रिपोर्ट करना है?',
    },
    'di5z7fow': {
      'en': 'Search...',
      'hi': 'खोज...',
    },
    'ci1lawng': {
      'en': 'Block',
      'hi': 'अवरोध पैदा करना',
    },
    'uz8uwvak': {
      'en': 'Beware this step will block your card!',
      'hi': 'सावधान, यह कदम आपका कार्ड ब्लॉक कर देगा!',
    },
    'u2qt3546': {
      'en': 'Help',
      'hi': 'मदद',
    },
  },
  // REPORT
  {
    'd88z2mc6': {
      'en': 'Report',
      'hi': 'प्रतिवेदन',
    },
    'g07osxfg': {
      'en': 'Fill out the form below to report something',
      'hi': 'किसी चीज़ की रिपोर्ट करने के लिए नीचे दिया गया फ़ॉर्म भरें',
    },
    'khfgyntn': {
      'en': 'Mobile',
      'hi': 'गतिमान',
    },
    '1snsoxtk': {
      'en': 'E-Mail',
      'hi': 'ईमेल',
    },
    'v6fk3yzr': {
      'en': 'Credit Card Online Fraud',
      'hi': 'क्रेडिट कार्ड ऑनलाइन धोखाधड़ी',
    },
    'f1srs67s': {
      'en': 'Net Banking',
      'hi': 'नेट बैंकिंग',
    },
    'vmai90na': {
      'en': 'Others',
      'hi': 'अन्य',
    },
    '8f5dvd8p': {
      'en': 'Crime Type',
      'hi': 'अपराध का प्रकार',
    },
    'psybrjf6': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'ki3qxxh1': {
      'en': 'Short Description of what is going on...',
      'hi': 'क्या हो रहा है इसका संक्षिप्त विवरण...',
    },
    'urgi4mqc': {
      'en': 'Bank of Baroda',
      'hi': 'बैंक ऑफ बड़ौदा',
    },
    'gmpmy35e': {
      'en': 'Canara Bank',
      'hi': 'केनरा बैंक',
    },
    '56aaexkm': {
      'en': 'Bank of India',
      'hi': 'बैंक ऑफ इंडिया',
    },
    'q9yrm0es': {
      'en': 'Central Bank of India',
      'hi': 'सेंट्रल बैंक ऑफ इंडिया',
    },
    '3yj4wzmq': {
      'en': 'Indian Bank',
      'hi': 'इंडियन बैंक',
    },
    'shvv0r3l': {
      'en': 'Indian Overseas Bank',
      'hi': 'इंडियन ओवरसीज बैंक',
    },
    'lv66x4xd': {
      'en': 'Idfc First Bank Ltd',
      'hi': 'आईडीएफसी फर्स्ट बैंक लिमिटेड',
    },
    'a9mejv7m': {
      'en': 'Fino Payments Bank',
      'hi': 'फिनो पेमेंट्स बैंक',
    },
    '7r0sr5ae': {
      'en': 'Dbs Bank India Limited',
      'hi': 'डीबीएस बैंक इंडिया लिमिटेड',
    },
    'bc75hf21': {
      'en': 'Which Bank to Report ?',
      'hi': 'किस बैंक को रिपोर्ट करना है?',
    },
    '0uh5o4g1': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'q9mkmwnb': {
      'en': 'Date and Time of Incident',
      'hi': 'घटना की तारीख और समय',
    },
    'jeqpw0j8': {
      'en': 'Jaipur Urban (Jaipur)',
      'hi': 'जयपुर शहरी (जयपुर)',
    },
    'e0b4gif7': {
      'en': 'Jaipur Rural (Jaipur)',
      'hi': 'जयपुर ग्रामीण (जयपुर)',
    },
    'ht2xg71r': {
      'en': 'Kekri (Ajmer)',
      'hi': 'केकड़ी (अजमेर)',
    },
    '9fz4fnt2': {
      'en': 'Sanchore (Jalore)',
      'hi': 'सांचौर (जालौर)',
    },
    'r7kqj1vi': {
      'en': 'Khairthal (Alwar)',
      'hi': 'खैरथल (अलवर)',
    },
    'u32e6bmd': {
      'en': 'Anupgarh (Sriganganagar)',
      'hi': 'अनूपगढ़ (श्रीगंगानगर)',
    },
    'drvfnnwt': {
      'en': 'Gangapur City (Sawai Madhopur)',
      'hi': 'गंगापुर सिटी (सवाई माधोपुर)',
    },
    'uo6k1o3g': {
      'en': 'Neem ka thana (Sikar)',
      'hi': 'नीम का थाना (सीकर)',
    },
    '78q7mcod': {
      'en': 'Phalodi (Jodhpur)',
      'hi': 'फलोदी (जोधपुर)',
    },
    '70zr2zea': {
      'en': 'Dudu (Jaipur)',
      'hi': 'दूदू (जयपुर)',
    },
    'opggbozv': {
      'en': 'Beawar (Ajmer)',
      'hi': 'ब्यावर (अजमेर)',
    },
    'b922kdpn': {
      'en': 'Didwana-Kuchaman (Nagaur)',
      'hi': 'डीडवाना-कुचामन (नागौर)',
    },
    'wi6q817r': {
      'en': 'Salumber (Udaipur)',
      'hi': 'सलूम्बर (उदयपुर)',
    },
    'guhhdqqt': {
      'en': 'Shahpura (Bhilwara)',
      'hi': 'शाहपुरा (भीलवाड़ा)',
    },
    'r9l6eoo5': {
      'en': 'Jodhpur Urban (Jodhpur)',
      'hi': 'जोधपुर शहरी (जोधपुर)',
    },
    'r6mfmxqd': {
      'en': 'Jodhpur Rural (Jodhpur)',
      'hi': 'जोधपुर ग्रामीण (जोधपुर)',
    },
    'z1f2kzs3': {
      'en': 'Balotra (Barmer)',
      'hi': 'बालोतरा (बाड़मेर)',
    },
    '88nnyhx7': {
      'en': 'Deeg (Bharatpur)',
      'hi': 'डीग (भरतपुर)',
    },
    'y2hrgzzd': {
      'en': 'Which District to Inform ?',
      'hi': 'किस जिले को सूचित करें?',
    },
    'piyre6um': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
    },
    'hisx9rwm': {
      'en': 'Upload Image',
      'hi': 'तस्विर अपलोड करना',
    },
    '2omc1dz6': {
      'en': 'Report',
      'hi': 'प्रतिवेदन',
    },
    'x6oc12up': {
      'en': 'Report',
      'hi': 'प्रतिवेदन',
    },
  },
  // PROFILE
  {
    'ur0gsxrh': {
      'en': 'My Targets',
      'hi': 'मेरे लक्ष्य',
    },
    'lz9fx0p9': {
      'en': ' Notifications',
      'hi': 'सूचनाएं',
    },
    'by2tny04': {
      'en': 'Help Center',
      'hi': 'सहायता केंद्र',
    },
    'lvdn5135': {
      'en': 'Settings',
      'hi': 'समायोजन',
    },
    'znl4uxnc': {
      'en': 'Add Number',
      'hi': 'संख्या जोड़ें',
    },
    '0e3kmy5d': {
      'en': 'Language',
      'hi': 'भाषा',
    },
    'apwhgwzl': {
      'en': 'Hindi',
      'hi': 'हिंदी',
    },
    'apuot5j7': {
      'en': 'English',
      'hi': 'अंग्रेज़ी',
    },
    'hn5x0ugr': {
      'en': 'Profile Settings',
      'hi': 'पार्श्वचित्र समायोजन',
    },
    'tclxwxst': {
      'en': 'Edit Profile',
      'hi': 'प्रोफ़ाइल संपादित करें',
    },
    '3lmd0mtg': {
      'en': 'Notification Settings',
      'hi': 'अधिसूचना सेटिंग्स',
    },
    'vmyataxx': {
      'en': 'Log out of account',
      'hi': 'खाते से लॉग आउट करें',
    },
    'cuez1yz7': {
      'en': 'Log Out?',
      'hi': 'लॉग आउट?',
    },
    '0rqeynkj': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // COMMUNITY
  {
    'emi8xl6c': {
      'en': 'Be Safe, Browse Safe!',
      'hi': 'सुरक्षित रहें, सुरक्षित ब्राउज़ करें!',
    },
    'qzl6a4fh': {
      'en': 'Search',
      'hi': 'खोज',
    },
    'ivv52msl': {
      'en': 'Recent Posts',
      'hi': 'हाल के पोस्ट',
    },
    'y5s1kaqu': {
      'en': 'View All',
      'hi': 'सभी को देखें',
    },
    '13to3tft': {
      'en': 'Social',
      'hi': 'सामाजिक',
    },
  },
  // post
  {
    'bhjgnfkv': {
      'en': '3.1k Members',
      'hi': '3.1k सदस्य',
    },
    'pyr22w3w': {
      'en': 'What is in your mind ?',
      'hi': 'आपके मस्तिष्क में क्या चल रहा है ?',
    },
    'j2zwk0ql': {
      'en': '1m ago',
      'hi': '1 मी पहले',
    },
    '0d1w1866': {
      'en': '3',
      'hi': '3',
    },
    'zz5hqqf9': {
      'en': 'likes',
      'hi': 'पसंद है',
    },
    'oo5a15zo': {
      'en': '8',
      'hi': '8',
    },
    'd4orhj5n': {
      'en': 'Comments',
      'hi': 'टिप्पणियाँ',
    },
    'nvwxrokb': {
      'en': 'Aditya',
      'hi': 'आदित्य',
    },
    'qyopd1ad': {
      'en':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'hi':
          'मैं यहां इस अनुभाग के बारे में वास्तव में निश्चित नहीं हूं, मुझे लगता है कि आपको कुछ अच्छा करना चाहिए!',
    },
    'i533tbkd': {
      'en': 'a min ago',
      'hi': 'एक मिनट पहले',
    },
    'mdlh9g0c': {
      'en': 'Sandra Smith',
      'hi': 'सैंड्रा स्मिथ',
    },
    'gdz3flyn': {
      'en':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'hi':
          'मैं यहां इस अनुभाग के बारे में वास्तव में निश्चित नहीं हूं, मुझे लगता है कि आपको कुछ अच्छा करना चाहिए!',
    },
    '0lkh3giu': {
      'en': 'a min ago',
      'hi': 'एक मिनट पहले',
    },
    '0hnexj8p': {
      'en': 'Send Post',
      'hi': 'पोस्ट भेजें',
    },
    'pnnlbhlu': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // viewalert
  {
    'oarhdpb8': {
      'en': 'Alerts For You...',
      'hi': 'आपके लिए अलर्ट...',
    },
    'w5svv3jd': {
      'en': 'Review the details below.',
      'hi': 'नीचे दिए गए विवरण की समीक्षा करें.',
    },
    'lb8m6gqm': {
      'en': 'ID#: ',
      'hi': 'पहचान#:',
    },
    'm1vfggff': {
      'en': 'Back',
      'hi': 'पीछे',
    },
    'jtya44ux': {
      'en': 'ID#: ',
      'hi': 'पहचान#:',
    },
    'yiwqx6kd': {
      'en': '429242424',
      'hi': '429242424',
    },
    '5t35g2qh': {
      'en': 'Product Testing',
      'hi': 'उत्पाद का परीक्षण करना',
    },
    'cwqwxjdd': {
      'en':
          'Conduct comprehensive testing of a new product before its official release. Set up a structured testing plan, define test cases, and assign team members for various testing phases. Document bugs and issues discovered during testing...',
      'hi':
          'किसी नए उत्पाद की आधिकारिक रिलीज़ से पहले उसका व्यापक परीक्षण करें। एक संरचित परीक्षण योजना स्थापित करें, परीक्षण मामलों को परिभाषित करें, और विभिन्न परीक्षण चरणों के लिए टीम के सदस्यों को नियुक्त करें। परीक्षण के दौरान दस्तावेज़ बग और समस्याएँ पाई गईं...',
    },
    '7nf719l0': {
      'en': 'In Progress',
      'hi': 'प्रगति पर है',
    },
    '1ha9vj99': {
      'en': 'ID#: ',
      'hi': 'पहचान#:',
    },
    'lcw0j3ec': {
      'en': '429242424',
      'hi': '429242424',
    },
    'ld0jpg9a': {
      'en': 'Team Training Workshop',
      'hi': 'टीम प्रशिक्षण कार्यशाला',
    },
    'miy908ht': {
      'en':
          'Organize a training workshop for the team to enhance their skills and knowledge on a specific topic. Develop an agenda, source teaching materials, and coordinate logistics. Assign trainers and monitor attendance to ensure a successful...',
      'hi':
          'किसी विशिष्ट विषय पर टीम के कौशल और ज्ञान को बढ़ाने के लिए एक प्रशिक्षण कार्यशाला का आयोजन करें। एक एजेंडा विकसित करें, शिक्षण सामग्री प्राप्त करें और लॉजिस्टिक्स का समन्वय करें। सफल आयोजन सुनिश्चित करने के लिए प्रशिक्षक नियुक्त करें और उपस्थिति की निगरानी करें...',
    },
    'q3p074o8': {
      'en': 'Active',
      'hi': 'सक्रिय',
    },
    '7ph2484a': {
      'en': 'ID#: ',
      'hi': 'पहचान#:',
    },
    'popuzete': {
      'en': '429242424',
      'hi': '429242424',
    },
    'v6mlw3cb': {
      'en': 'Budget Planning',
      'hi': 'बजट योजना',
    },
    '9qk0crxg': {
      'en':
          'Create a detailed budget plan for an upcoming project, considering all relevant expenses, such as labor costs, materials, and external services. Collaborate with the finance team to ensure accuracy and alignment with overall financial...',
      'hi':
          'श्रम लागत, सामग्री और बाहरी सेवाओं जैसे सभी प्रासंगिक खर्चों पर विचार करते हुए, आगामी परियोजना के लिए एक विस्तृत बजट योजना बनाएं। समग्र वित्तीय के साथ सटीकता और संरेखण सुनिश्चित करने के लिए वित्त टीम के साथ सहयोग करें...',
    },
    '4zktw7jd': {
      'en': 'Active',
      'hi': 'सक्रिय',
    },
    'g896za28': {
      'en': 'ID#: ',
      'hi': 'पहचान#:',
    },
    '4wp067lf': {
      'en': '429242424',
      'hi': '429242424',
    },
    'n26a1bol': {
      'en': 'Client Onboarding Process',
      'hi': 'क्लाइंट ऑनबोर्डिंग प्रक्रिया',
    },
    'wgez61dg': {
      'en':
          'Develop an efficient client onboarding process that streamlines the introduction of new clients to the company\'s services. Define clear steps, create necessary templates, and assign responsible team members for each task. Monitor the completion...',
      'hi':
          'एक कुशल क्लाइंट ऑनबोर्डिंग प्रक्रिया विकसित करें जो कंपनी की सेवाओं में नए ग्राहकों के परिचय को सुव्यवस्थित करे। स्पष्ट चरणों को परिभाषित करें, आवश्यक टेम्पलेट बनाएं और प्रत्येक कार्य के लिए जिम्मेदार टीम के सदस्यों को नियुक्त करें। पूर्णता की निगरानी करें...',
    },
    'wa6gni31': {
      'en': 'Active',
      'hi': 'सक्रिय',
    },
    '2pm4vjlm': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Create_acc
  {
    'ny4fq0c0': {
      'en': 'PORTAL 1930',
      'hi': 'पोर्टल 1930',
    },
    'sm2hfbso': {
      'en': 'Please Register',
      'hi': 'कृपया दर्ज करें',
    },
    'toy4c8xs': {
      'en': 'Name',
      'hi': 'नाम',
    },
    'd1nojn7j': {
      'en': 'Email',
      'hi': 'ईमेल',
    },
    '8ggmsufy': {
      'en': 'Password',
      'hi': 'पासवर्ड',
    },
    'zqskq4bf': {
      'en': 'Aadhar No.',
      'hi': 'आधार नंबर',
    },
    'vd6p5052': {
      'en': '',
      'hi': '',
    },
    'kun2e8cc': {
      'en': 'Enter OTP',
      'hi': 'ओटीपी दर्ज करें',
    },
    '0s1j21dl': {
      'en': 'Get OTP',
      'hi': 'ओटीपी प्राप्त करें',
    },
    '4t4it9b3': {
      'en': 'Verify OTP',
      'hi': 'ओटीपी सत्यापित करें',
    },
    'wu7bzmkw': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
    },
    '3r9uz3zo': {
      'en': 'Or create with',
      'hi': 'या साथ बनाएं',
    },
    '8rw3o5nm': {
      'en': 'Continue with Google',
      'hi': 'Google के साथ जारी रखें',
    },
    '9j835jls': {
      'en': 'Continue with Apple',
      'hi': 'एप्पल के साथ जारी रखें',
    },
    'z5lhzm0u': {
      'en': 'Already have an Account? ',
      'hi': 'क्या आपके पास पहले से एक खाता मौजूद है?',
    },
    'iqhsj020': {
      'en': ' Sign In here',
      'hi': 'यहां साइन इन करो',
    },
    'mr2hhjvn': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // login
  {
    'uau342i8': {
      'en': 'PORTAL 1930',
      'hi': 'पोर्टल 1930',
    },
    '1nfe9ckp': {
      'en': 'Welcome Back!',
      'hi': 'वापसी पर स्वागत है!',
    },
    'fqpbdod3': {
      'en': 'Fill out the information below in order to access your account.',
      'hi': 'अपने खाते तक पहुंचने के लिए नीचे दी गई जानकारी भरें।',
    },
    '470m855v': {
      'en': 'Email',
      'hi': 'ईमेल',
    },
    'hxiwln0o': {
      'en': 'Password',
      'hi': 'पासवर्ड',
    },
    '3lyzucal': {
      'en': 'Sign In',
      'hi': 'दाखिल करना',
    },
    '7ze59xhw': {
      'en': 'Or sign in with',
      'hi': 'या इसके साथ साइन इन करें',
    },
    'kvhz0yfv': {
      'en': 'Continue with Google',
      'hi': 'Google के साथ जारी रखें',
    },
    '9nn0juje': {
      'en': 'Continue with Apple',
      'hi': 'एप्पल के साथ जारी रखें',
    },
    'jodk6ft3': {
      'en': 'Don\'t have an account?  ',
      'hi': 'कोई खाता नहीं है?',
    },
    'wkqqzzfx': {
      'en': 'Sign Up here',
      'hi': 'यहां साइन अप करें',
    },
    'b1lvje6w': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // payok
  {
    'c5mvfa4w': {
      'en': 'Thank You',
      'hi': 'धन्यवाद',
    },
    '9sn04shs': {
      'en': 'Ok',
      'hi': 'ठीक है',
    },
  },
  // Miscellaneous
  {
    'rtttlidp': {
      'en': '',
      'hi': '',
    },
    'bxibmcee': {
      'en': '',
      'hi': '',
    },
    'sw33ozdq': {
      'en': 'Access Message',
      'hi': 'संदेश तक पहुंचें',
    },
    'jeg0do5b': {
      'en': '',
      'hi': '',
    },
    'u6qwxs5u': {
      'en': '',
      'hi': '',
    },
    'kweu58iv': {
      'en': '',
      'hi': '',
    },
    '6wu0h8ln': {
      'en': '',
      'hi': '',
    },
    'v6amefe8': {
      'en': '',
      'hi': '',
    },
    '3svyitt4': {
      'en': '',
      'hi': '',
    },
    'fr065evh': {
      'en': '',
      'hi': '',
    },
    'njlpybhk': {
      'en': '',
      'hi': '',
    },
    '1br4by9r': {
      'en': '',
      'hi': '',
    },
    'f0y48pwi': {
      'en': '',
      'hi': '',
    },
    '3hdsu7v4': {
      'en': '',
      'hi': '',
    },
    'foisp534': {
      'en': '',
      'hi': '',
    },
    'wwb5a5ke': {
      'en': '',
      'hi': '',
    },
    'jupbt89x': {
      'en': '',
      'hi': '',
    },
    '27ipufij': {
      'en': '',
      'hi': '',
    },
    'vzvhq33f': {
      'en': '',
      'hi': '',
    },
    'wof5xcdz': {
      'en': '',
      'hi': '',
    },
    'uy3e6bip': {
      'en': '',
      'hi': '',
    },
    'tgcpicgo': {
      'en': '',
      'hi': '',
    },
    'w90uc4sz': {
      'en': '',
      'hi': '',
    },
    'i7nac2eg': {
      'en': '',
      'hi': '',
    },
    'm9wd3j80': {
      'en': '',
      'hi': '',
    },
    '0n4y5mqz': {
      'en': '',
      'hi': '',
    },
    'iuk4qtfz': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
