import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'en'];

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
    String? ruText = '',
    String? enText = '',
  }) =>
      [ruText, enText][languageIndex] ?? '';

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
  // GetStartedPage
  {
    'i6s63i1o': {
      'ru': 'ХАБУС',
      'en': 'ХАБУС',
    },
    '9841ez48': {
      'ru': 'Место сосредоточения',
      'en': 'Place of concentration',
    },
    '4ahqd287': {
      'ru': 'Мессенджер, новости, сообщества, личный кабинет и многое другое',
      'en': 'Messenger, news, feed, personal account and much more',
    },
    'ptbg07k3': {
      'ru': 'Продолжить',
      'en': 'Continue',
    },
    'tditehtq': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // RegistrationPage
  {
    'gjtc6yst': {
      'ru': 'ХАБУС',
      'en': 'ХАБУС',
    },
    'ruei3u8r': {
      'ru': '',
      'en': 'Email',
    },
    'i4lxweb9': {
      'ru': 'Email',
      'en': '',
    },
    '2lgtcmej': {
      'ru': '',
      'en': 'Password',
    },
    'xx065rme': {
      'ru': 'Пароль',
      'en': '',
    },
    'q02zncbj': {
      'ru': '',
      'en': 'Confirm password',
    },
    'ue9ygtbo': {
      'ru': 'Подтвердите пароль',
      'en': '',
    },
    'hmv71fw8': {
      'ru': 'Это поле обязательно',
      'en': 'This field is necessary',
    },
    'ew1g5vng': {
      'ru': 'Почта выглядит странно',
      'en': 'Email looks strange',
    },
    '808emnxw': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    '0hdvbipv': {
      'ru': 'Это поле обязательно',
      'en': 'This field is necessary',
    },
    'mviifufh': {
      'ru': 'Минимум 6 символов',
      'en': '6 symbols at least',
    },
    '6ckb4nk2': {
      'ru': 'Слабый пароль',
      'en': 'Weak password',
    },
    '8b88dhf4': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'bkdi370w': {
      'ru': 'Это поле обязательно',
      'en': 'This field is necessary',
    },
    'tad82tst': {
      'ru': 'Минимум 6 символов',
      'en': '6 symbols at least',
    },
    'y2j5jlme': {
      'ru': 'Слабый пароль',
      'en': 'Weak password',
    },
    '0r5erlnf': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'k30wf1xs': {
      'ru': 'Зарегистрироваться',
      'en': 'Register',
    },
    'vn6t8lca': {
      'ru': 'Уже есть аккаунт?',
      'en': 'Already have account?',
    },
    'ss4g70iw': {
      'ru': 'Войти',
      'en': 'Log in',
    },
    'ugonowz9': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // OnboardingPage
  {
    '4k42vbiu': {
      'ru': 'Общайтесь',
      'en': 'Communicate',
    },
    '4y858a2d': {
      'ru': 'Создавайте групповые и обычные чаты',
      'en': 'Create group and one-to-one chats',
    },
    'ql6ausyb': {
      'ru': 'Делитесь',
      'en': 'Share',
    },
    'ncktlp6m': {
      'ru':
          'Создавайте группы и сообщества, выкладывайте истории и размещайте посты',
      'en': 'Create groups and communities, post stories and post posts',
    },
    '04nksib6': {
      'ru': 'Следите',
      'en': 'Monitor',
    },
    '2gptrnlp': {
      'ru':
          'Смотрите расписание, баллы... в общем весь личный кабинет у Вас в кармане!',
      'en': 'Your personal account is in your pocket',
    },
    '2rorad73': {
      'ru': 'Начать',
      'en': 'Get started',
    },
    'fiwakt0n': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // LinkVerificationPage
  {
    'ysqs24q7': {
      'ru': 'ХАБУС',
      'en': 'ХАБУС',
    },
    'dqmava4q': {
      'ru': 'Прекрасно! Осталось немного',
      'en': 'Great! Left a little',
    },
    'j0sw6cig': {
      'ru':
          'Мы отправили Вам ссылку-подтверждение на почту. Было бы славно, если бы Вы на неё нажали',
      'en':
          'We have sent you a confirmation link by email. It would be nice if you clicked on it',
    },
    'sac3xqc3': {
      'ru': 'Войти',
      'en': 'Log in',
    },
    'ffmhy5gq': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // LoginPage
  {
    'l2m497ef': {
      'ru': 'ХАБУС',
      'en': '',
    },
    '7ue39d6j': {
      'ru': 'Email',
      'en': '',
    },
    'ftjkdl9z': {
      'ru': 'Пароль',
      'en': '',
    },
    'trhp94my': {
      'ru': 'Это поле обязательно',
      'en': '',
    },
    'ihzbw1md': {
      'ru': 'Почта выглядит странно',
      'en': '',
    },
    'kfj6sip8': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'z33vbu6a': {
      'ru': 'Это поле обязательно',
      'en': '',
    },
    'hd67wg9d': {
      'ru': 'Минимум 6 символов',
      'en': '',
    },
    'cbl785b6': {
      'ru': 'Слабый пароль',
      'en': '',
    },
    '8ciz5mrw': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    '603ktmif': {
      'ru': 'Войти',
      'en': '',
    },
    'd72d1omd': {
      'ru': 'Забыли пароль?',
      'en': '',
    },
    'c4jfmhbl': {
      'ru': 'Home',
      'en': '',
    },
  },
  // ForgotPassPage
  {
    'rua4rzxc': {
      'ru': 'ХАБУС',
      'en': '',
    },
    'b3525net': {
      'ru': 'Введите почту',
      'en': '',
    },
    '46stux2f': {
      'ru': 'Мы отправим Вам ссылку для восстановления пароля',
      'en': '',
    },
    'digx179s': {
      'ru': 'Email',
      'en': '',
    },
    'l7lrfup9': {
      'ru': 'Это поле обязательно',
      'en': '',
    },
    '4zt7gkxb': {
      'ru': 'Почта выглядит странно',
      'en': '',
    },
    '15n8ma9d': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    '0t8prbiz': {
      'ru': 'Далее',
      'en': '',
    },
    'nabs0ta1': {
      'ru': 'Home',
      'en': '',
    },
  },
  // ForgotPassPageVerification
  {
    'gv9y6p5p': {
      'ru': 'ХАБУС',
      'en': '',
    },
    'a3naeoqn': {
      'ru': 'Ссылка отправлена!',
      'en': '',
    },
    'khbec071': {
      'ru': 'Проверяйте почту, в особенности папку спам',
      'en': '',
    },
    'qw8fc9s8': {
      'ru': 'Войти',
      'en': '',
    },
    'sijbju83': {
      'ru': 'Home',
      'en': '',
    },
  },
  // HomePage
  {
    'j5hehulf': {
      'ru': 'Личный кабинет ВВГУ',
      'en': '',
    },
    'vbufudzh': {
      'ru': 'Мой профиль',
      'en': '',
    },
    'ntgiet22': {
      'ru': 'Главная',
      'en': '',
    },
    'jeoqy9ab': {
      'ru': 'Создать сообщество',
      'en': '',
    },
    '99r94c3x': {
      'ru': 'Создать чат',
      'en': '',
    },
    'gz9zsgc7': {
      'ru': 'Настройки',
      'en': '',
    },
    'te3390pd': {
      'ru': 'Выйти',
      'en': '',
    },
    'ylghcgu4': {
      'ru': 'Версия 1.0beta_build',
      'en': '',
    },
    'yhgd92hs': {
      'ru': 'habus.tech@yandex.ru',
      'en': '',
    },
    't19z9ie9': {
      'ru': 'Главное',
      'en': '',
    },
    'c9hiaj7l': {
      'ru': 'Новости',
      'en': '',
    },
    'n4lwm5yb': {
      'ru': ' ВВГУ',
      'en': '',
    },
    'u35wavjb': {
      'ru': '',
      'en': '',
    },
    'r258pdew': {
      'ru': 'Найти...',
      'en': '',
    },
    'yndbo3sr': {
      'ru': 'Фильтр',
      'en': '',
    },
    '21ires9t': {
      'ru': 'Новые',
      'en': '',
    },
    'fw7z82d6': {
      'ru':
          'Студенты ВВГУ стали финалистами Всероссийского чемпионата «Профессионалы» в компетенции «Промышленный дизайн»',
      'en': '',
    },
    'gqpm9gr1': {
      'ru': 'Fri, 28 Jul 2023 15:19:00 +1000',
      'en': '',
    },
    'imae46rv': {
      'ru': 'Читать',
      'en': '',
    },
    'j7bcwe2k': {
      'ru':
          'Студенты ВВГУ стали финалистами Всероссийского чемпионата «Профессионалы» в компетенции «Промышленный дизайн»',
      'en': '',
    },
    'gk3n3z3w': {
      'ru': 'Fri, 28 Jul 2023 15:19:00 +1000',
      'en': '',
    },
    'dhkd3rf4': {
      'ru': 'Читать',
      'en': '',
    },
    'dbo1fnic': {
      'ru':
          'Студенты ВВГУ стали финалистами Всероссийского чемпионата «Профессионалы» в компетенции «Промышленный дизайн»',
      'en': '',
    },
    'jh9lnlst': {
      'ru': 'Fri, 28 Jul 2023 15:19:00 +1000',
      'en': '',
    },
    'aedn688r': {
      'ru': 'Читать',
      'en': '',
    },
    'ncoekzmc': {
      'ru':
          'Студенты ВВГУ стали финалистами Всероссийского чемпионата «Профессионалы» в компетенции «Промышленный дизайн»',
      'en': '',
    },
    '302vonyc': {
      'ru': 'Fri, 28 Jul 2023 15:19:00 +1000',
      'en': '',
    },
    'nxjxl2jw': {
      'ru': 'Читать',
      'en': '',
    },
    'jblf7y87': {
      'ru': 'Сообщества',
      'en': '',
    },
    'pjoxivuf': {
      'ru': 'Название сообщества',
      'en': '',
    },
    'u2ktxn8o': {
      'ru': '@id',
      'en': '',
    },
    '9xb7fyvi': {
      'ru': ' • ',
      'en': '',
    },
    'yzsvu7dj': {
      'ru': '4 mins ago',
      'en': '',
    },
    'hvj121zj': {
      'ru': 'Текст',
      'en': '',
    },
    'ofputsr8': {
      'ru': '4',
      'en': '',
    },
    'n04ntvn4': {
      'ru': '4',
      'en': '',
    },
    'x5b0dz1u': {
      'ru': 'Новое в',
      'en': '',
    },
    'zskfr57p': {
      'ru': ' сообществах',
      'en': '',
    },
    'v16s9r75': {
      'ru': 'Лента',
      'en': '',
    },
    '1jmn5a5h': {
      'ru': 'Название сообщества',
      'en': '',
    },
    '8dhbciwc': {
      'ru': '@username',
      'en': '',
    },
    '5r7n8wpc': {
      'ru': ' • ',
      'en': '',
    },
    'lt5jzl85': {
      'ru': '4 mins ago',
      'en': '',
    },
    '0hje56nt': {
      'ru':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,',
      'en': '',
    },
    '8627cwlk': {
      'ru': '4',
      'en': '',
    },
    '40od92gy': {
      'ru': '4',
      'en': '',
    },
    'o221adww': {
      'ru': 'Новое в',
      'en': '',
    },
    'mban74u0': {
      'ru': ' ленте',
      'en': '',
    },
    'ysuwpepa': {
      'ru': 'Опросы',
      'en': '',
    },
    'ik6686gb': {
      'ru': 'Новое в',
      'en': '',
    },
    '1apkzap8': {
      'ru': ' опросах',
      'en': '',
    },
    'wdv4c3bf': {
      'ru': '',
      'en': '',
    },
    'z2m5nelb': {
      'ru': 'Найти...',
      'en': '',
    },
    'agxoyi6w': {
      'ru': 'Фильтр',
      'en': '',
    },
    'n8b2cup7': {
      'ru': 'Новые',
      'en': '',
    },
    's65nlvxv': {
      'ru': 'Создать опрос',
      'en': '',
    },
    'w553c4fn': {
      'ru':
          'Студенты ВВГУ стали финалистами Всероссийского чемпионата «Профессионалы» в компетенции «Промышленный дизайн»',
      'en': '',
    },
    '7xj48l97': {
      'ru': 'Fri, 28 Jul 2023 15:19:00 +1000',
      'en': '',
    },
    'kub3955h': {
      'ru': 'Читать',
      'en': '',
    },
    '4pi1xwlk': {
      'ru':
          'Студенты ВВГУ стали финалистами Всероссийского чемпионата «Профессионалы» в компетенции «Промышленный дизайн»',
      'en': '',
    },
    'o1ge22sj': {
      'ru': 'Fri, 28 Jul 2023 15:19:00 +1000',
      'en': '',
    },
    'sbnol3hn': {
      'ru': 'Читать',
      'en': '',
    },
    'a4dc8wpb': {
      'ru':
          'Студенты ВВГУ стали финалистами Всероссийского чемпионата «Профессионалы» в компетенции «Промышленный дизайн»',
      'en': '',
    },
    '59w3au5x': {
      'ru': 'Fri, 28 Jul 2023 15:19:00 +1000',
      'en': '',
    },
    'z9jieszr': {
      'ru': 'Читать',
      'en': '',
    },
    '0fsyrd0j': {
      'ru':
          'Студенты ВВГУ стали финалистами Всероссийского чемпионата «Профессионалы» в компетенции «Промышленный дизайн»',
      'en': '',
    },
    '0pu9o45n': {
      'ru': 'Fri, 28 Jul 2023 15:19:00 +1000',
      'en': '',
    },
    'nxrz5dd9': {
      'ru': 'Читать',
      'en': '',
    },
    'dyw7os9m': {
      'ru': 'ХАБУС',
      'en': '',
    },
    'l32v18n1': {
      'ru': 'Home',
      'en': '',
    },
  },
  // OoopsPage
  {
    'dmlk2csy': {
      'ru': 'Ошибка :(',
      'en': 'Error :(',
    },
    'pb752orf': {
      'ru':
          'К сожалению, данный раздел пока недоступен. Но мы скоро всё исправим!',
      'en':
          'Unfortunately, this section is not yet available. But we\'ll fix it soon!',
    },
    'nlxgw06q': {
      'ru': 'Назад',
      'en': 'Back',
    },
    '4vjjcoco': {
      'ru': 'ХАБУС',
      'en': 'ХАБУС',
    },
    'ylaqp4do': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // InDevelopPage
  {
    'b06wckw7': {
      'ru': 'В разработке',
      'en': 'In developing',
    },
    'x5wuwzdz': {
      'ru':
          'В данный момент это раздел находится в разработке. Следите за обновлениями!',
      'en': 'This section is currently under development. Stay tuned!',
    },
    'kigcq5m1': {
      'ru': 'Назад',
      'en': 'Back',
    },
    'vi54q3ey': {
      'ru': 'ХАБУС',
      'en': 'ХАБУС',
    },
    'tc4803tb': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // InitialUserInfoPage
  {
    'cegy15sf': {
      'ru': 'ХАБУС',
      'en': 'ХАБУС',
    },
    '7iwas8bc': {
      'ru': 'Давайте знакомиться',
      'en': 'Great! Left a little',
    },
    '434y2pch': {
      'ru': '',
      'en': 'Email',
    },
    '660l5474': {
      'ru': 'Введите имя',
      'en': '',
    },
    '64lqgapq': {
      'ru': '',
      'en': 'Email',
    },
    '3v3udrid': {
      'ru': 'Введите фамилию',
      'en': '',
    },
    'drvnfmui': {
      'ru':
          'Указывайте своё настоящее имя и фамилию, чтобы другим пользователям было легче Вас найти',
      'en':
          'We have sent you a confirmation link by email. It would be nice if you clicked on it',
    },
    'nscpox4g': {
      'ru': 'Абитуриент',
      'en': '',
    },
    'pi0wcveu': {
      'ru': 'Студент',
      'en': '',
    },
    'tfz4uzts': {
      'ru': 'Аспирант',
      'en': '',
    },
    '2l7uudx4': {
      'ru': 'Докторант',
      'en': '',
    },
    'nbrl4mk7': {
      'ru': 'Преподаватель',
      'en': '',
    },
    'a7vwshf7': {
      'ru': 'Магистрант',
      'en': '',
    },
    '3wz77wud': {
      'ru': 'Лаборант',
      'en': '',
    },
    'kins1x33': {
      'ru': 'Выберите роль',
      'en': '',
    },
    'kup43co3': {
      'ru': 'Поиск',
      'en': '',
    },
    'nlidvsw7': {
      'ru': 'Верность выбранной Вами роли будет проверена',
      'en':
          'We have sent you a confirmation link by email. It would be nice if you clicked on it',
    },
    'hfzlsc9h': {
      'ru': 'Это поле обязятельно',
      'en': '',
    },
    '4t0cl656': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'a7dc3fey': {
      'ru': 'Это поле обязательно',
      'en': '',
    },
    'aptmsk91': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'qjb0p5xz': {
      'ru': 'Продолжить',
      'en': 'Log in',
    },
    'tznolfui': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // ChangProfileInfoPage
  {
    'zdc2przz': {
      'ru': 'Информация об аккаунте',
      'en': '',
    },
    's2z98gid': {
      'ru': 'Измените основную информацию об аккаунте',
      'en': '',
    },
    '5inglpq7': {
      'ru': 'Имя',
      'en': '',
    },
    '2gn6dad1': {
      'ru': '',
      'en': '',
    },
    '37awu7da': {
      'ru': 'Фамилия',
      'en': '',
    },
    '3ialxtxh': {
      'ru': '',
      'en': '',
    },
    'qxpvdk8k': {
      'ru': 'Кафедра',
      'en': '',
    },
    'uyr1c2k8': {
      'ru': 'IT-колледж (IThub Владивосток) ',
      'en': '',
    },
    'xwuvjlh1': {
      'ru': 'Академический колледж ',
      'en': '',
    },
    'eob7zjrt': {
      'ru': 'Высшая школа кино и телевидения ',
      'en': '',
    },
    'sl5o3hcs': {
      'ru': 'Институт заочного обучения ',
      'en': '',
    },
    'lo6ybbyf': {
      'ru': 'Кафедра гражданско-правовых дисциплин ',
      'en': '',
    },
    'kujh28hf': {
      'ru': 'Кафедра гуманитарных и социально-экономических дисциплин ',
      'en': '',
    },
    'fshwew9p': {
      'ru': 'Кафедра дизайна и технологий ',
      'en': '',
    },
    'ye3wtkcd': {
      'ru': 'Кафедра информационной безопасности ',
      'en': '',
    },
    'ckbw7h0f': {
      'ru': 'Кафедра информационных технологий и систем ',
      'en': '',
    },
    'hacfbfpz': {
      'ru': 'Кафедра маркетинга и торговли ',
      'en': '',
    },
    '141q82r4': {
      'ru': 'Кафедра математики и моделирования ',
      'en': '',
    },
    'ypl77ukh': {
      'ru': 'Кафедра международных отношений и права ',
      'en': '',
    },
    '1mcjm60j': {
      'ru': 'Кафедра межкультурных коммуникаций и переводоведения ',
      'en': '',
    },
    '2u4t36ad': {
      'ru': 'Кафедра русского языка ',
      'en': '',
    },
    'ho2zpekv': {
      'ru': 'Кафедра теории и истории российского и зарубежного права ',
      'en': '',
    },
    'k6pa6otf': {
      'ru': 'Кафедра транспортных процессов и технологий ',
      'en': '',
    },
    'ul69w5tx': {
      'ru': 'Кафедра туризма и гостинично-ресторанного бизнеса ',
      'en': '',
    },
    'prlr7bn1': {
      'ru': 'Кафедра физкультурно-оздоровительной и спортивной работы ',
      'en': '',
    },
    '8ktckca7': {
      'ru': 'Кафедра философии и юридической психологии ',
      'en': '',
    },
    '17m55lta': {
      'ru': 'Кафедра экономики и управления ',
      'en': '',
    },
    'a5j6hrst': {
      'ru': 'Колледж индустрии моды и красоты ',
      'en': '',
    },
    'u5qwe4q5': {
      'ru': 'Колледж сервиса и дизайна  ',
      'en': '',
    },
    'jofkwnz6': {
      'ru': 'Отделение специальностей среднего профессионального образования ',
      'en': '',
    },
    'yb66dvzd': {
      'ru': 'Отделение среднего профессионального образования ',
      'en': '',
    },
    'vbbp3oos': {
      'ru': 'Педагогический институт ',
      'en': '',
    },
    'e8avhhuw': {
      'ru': 'Филиал ФГБОУ ВО \"ВВГУ\" в г. Уссурийске ',
      'en': '',
    },
    '8e2tf3a3': {
      'ru': 'Выберите кафедру',
      'en': '',
    },
    'nkfofutc': {
      'ru': 'Найти...',
      'en': '',
    },
    'vkdo3dkg': {
      'ru': 'Группа',
      'en': '',
    },
    '9kp7m4e2': {
      'ru': 'IT-СИП-22-В1 ',
      'en': '',
    },
    'bx38i0x2': {
      'ru': 'IT-СИП-22-П1 ',
      'en': '',
    },
    'zagu4ql4': {
      'ru': 'IT-СИП-23-В1 ',
      'en': '',
    },
    'x65zq3wk': {
      'ru': 'IT-СИП-23-П1 ',
      'en': '',
    },
    '1nkb87z7': {
      'ru': 'IT-СОИП-22-В1 ',
      'en': '',
    },
    'goe0rvhx': {
      'ru': 'IT-СОИП-22-П1 ',
      'en': '',
    },
    'wedipl5a': {
      'ru': 'IT-СОИП-23-В1 ',
      'en': '',
    },
    '4rembx6s': {
      'ru': 'IT-СОИП-23-П1 ',
      'en': '',
    },
    'o0ewj005': {
      'ru': 'А/БПИ-20-ПЭ1 ',
      'en': '',
    },
    'g7k7jcbi': {
      'ru': 'А/БСС-20-СА1 ',
      'en': '',
    },
    'pza402kk': {
      'ru': 'А/ВБСС-19 ',
      'en': '',
    },
    'ltsi6xiw': {
      'ru': 'А/ЗБМН-19 ',
      'en': '',
    },
    'dg1wjd7m': {
      'ru': 'А/ЗБМН-20 ',
      'en': '',
    },
    'wxxdmgjh': {
      'ru': 'А/ЗБЭМ-20 ',
      'en': '',
    },
    'pi9yql0l': {
      'ru': 'А/ЗБЭУ-19 ',
      'en': '',
    },
    '71n9iw8z': {
      'ru': 'А/ЗКМ(9)-20-01 ',
      'en': '',
    },
    '2qvrnx66': {
      'ru': 'А/ЗСКМ-21 ',
      'en': '',
    },
    'j2ci1pbp': {
      'ru': 'А/ЗСКМ-22-1 ',
      'en': '',
    },
    'punnihxp': {
      'ru': 'А/ЗСОКМ-21 ',
      'en': '',
    },
    'dt3w3ck8': {
      'ru': 'А/ЗСОКМ-22-1 ',
      'en': '',
    },
    'szxw1whh': {
      'ru': 'А/ЗССО-21 ',
      'en': '',
    },
    'xefgxan5': {
      'ru': 'А/ЗССО-22-1 ',
      'en': '',
    },
    'ys7ctxfj': {
      'ru': 'А/ЗСТ(9)-19-01 ',
      'en': '',
    },
    'zlbl45uz': {
      'ru': 'А/ЗСТ-19-01 ',
      'en': '',
    },
    'ihx5ynxl': {
      'ru': 'А/ЗСТ-20-01 ',
      'en': '',
    },
    'm1bzxuk5': {
      'ru': 'А/ЗСЭЗ(9)-19-01 ',
      'en': '',
    },
    '2wyrzzkt': {
      'ru': 'А/ЗСЭЗ-20-01 ',
      'en': '',
    },
    'n556j80h': {
      'ru': 'А/ЗЭБУ(9)-19-01 ',
      'en': '',
    },
    'sjbkkm56': {
      'ru': 'А/ПК(9)-20-01 ',
      'en': '',
    },
    'c4e4os48': {
      'ru': 'А/ПСО(9)-20-01 ',
      'en': '',
    },
    'jkt7iw03': {
      'ru': 'А/РК(9)-20-01 ',
      'en': '',
    },
    'xw03d4ud': {
      'ru': 'А/СОГД-22-1 ',
      'en': '',
    },
    '04d4jnnt': {
      'ru': 'А/СОКМ-22-1 ',
      'en': '',
    },
    'v1n2l1bk': {
      'ru': 'А/СООП-22-1 ',
      'en': '',
    },
    'g13xhdzb': {
      'ru': 'А/СОПД-22-1 ',
      'en': '',
    },
    'vv8tcdku': {
      'ru': 'А/СОПИ-21-1 ',
      'en': '',
    },
    'dut7r94l': {
      'ru': 'А/СОПИ-22-1 ',
      'en': '',
    },
    'y4h8lj1b': {
      'ru': 'А/СОПИ-22-2 ',
      'en': '',
    },
    'yi3xmj12': {
      'ru': 'А/СОПИ-23-1 ',
      'en': '',
    },
    'wipp7qxn': {
      'ru': 'А/СОПН-22-1 ',
      'en': '',
    },
    'za8fs4ki': {
      'ru': 'А/СОРД-21-1 ',
      'en': '',
    },
    'ip386k83': {
      'ru': 'А/СОРД-22-1 ',
      'en': '',
    },
    'j818qyje': {
      'ru': 'А/СОРД-23-1 ',
      'en': '',
    },
    'hsn6997f': {
      'ru': 'А/СОРК-21-1 ',
      'en': '',
    },
    'eks1jllr': {
      'ru': 'А/СОРК-22-1 ',
      'en': '',
    },
    '6hx34fc9': {
      'ru': 'А/СОРК-23-1 ',
      'en': '',
    },
    '67s7w7pg': {
      'ru': 'А/СОСА-22-1 ',
      'en': '',
    },
    'dc0seyio': {
      'ru': 'А/СОСА-23-1 ',
      'en': '',
    },
    'nfbx68rw': {
      'ru': 'А/СОСО-21-1 ',
      'en': '',
    },
    'baoziujk': {
      'ru': 'А/СОСО-22-1 ',
      'en': '',
    },
    'nb6mit3v': {
      'ru': 'А/СОСЭ-21-1 ',
      'en': '',
    },
    'hsj7sl12': {
      'ru': 'А/СОСЭ-22-1 ',
      'en': '',
    },
    'ojqc93uk': {
      'ru': 'А/СОСЭ-22-2 ',
      'en': '',
    },
    'c6ixruv8': {
      'ru': 'А/СОТГ-23-ТУ1 ',
      'en': '',
    },
    'aqq4ddo8': {
      'ru': 'А/СОТУ-22-1 ',
      'en': '',
    },
    'z5z2d96c': {
      'ru': 'А/СОФЗ-22-1 ',
      'en': '',
    },
    'mynzasou': {
      'ru': 'А/СОЭБ-21 ',
      'en': '',
    },
    'yl645euc': {
      'ru': 'А/СПИ-21-1 ',
      'en': '',
    },
    'f7twrsnn': {
      'ru': 'А/СПИ-22-1 ',
      'en': '',
    },
    'eeymv00m': {
      'ru': 'А/СРД-22-1 ',
      'en': '',
    },
    '13zec5qy': {
      'ru': 'А/СРК-21-1 ',
      'en': '',
    },
    '94xcpjfm': {
      'ru': 'А/СРК-22-1 ',
      'en': '',
    },
    'mjrpqueg': {
      'ru': 'А/ССО-21-1 ',
      'en': '',
    },
    '0irwgi8f': {
      'ru': 'А/ССО-22-1 ',
      'en': '',
    },
    '2mygqbhf': {
      'ru': 'А/ССЭ-21-1 ',
      'en': '',
    },
    'fpm61b8r': {
      'ru': 'А/ССЭ-22-1 ',
      'en': '',
    },
    '2atgd5mx': {
      'ru': 'А/СТ(9)-20-01 ',
      'en': '',
    },
    'fvvc2qnv': {
      'ru': 'А/СЭБ-21-1 ',
      'en': '',
    },
    'bktzcuqt': {
      'ru': 'А/СЭБ-22-1 ',
      'en': '',
    },
    '21af41yo': {
      'ru': 'А/СЭЗ(9)-20-01 ',
      'en': '',
    },
    'v11dl0nq': {
      'ru': 'А/ЭБУ(9)-20-01 ',
      'en': '',
    },
    'nl7kbqz3': {
      'ru': 'АМЕН-22-1 ',
      'en': '',
    },
    '67huk6y4': {
      'ru': 'АМЕН-23-1 ',
      'en': '',
    },
    'bdsouhzh': {
      'ru': 'АМНО-22-1 ',
      'en': '',
    },
    '8elt5rmv': {
      'ru': 'АМПО-22-1 ',
      'en': '',
    },
    'p7vefzdl': {
      'ru': 'АМСИ-22-1 ',
      'en': '',
    },
    'hec2u3yo': {
      'ru': 'АПИП-22-1 ',
      'en': '',
    },
    '6eqb7a2e': {
      'ru': 'АПНР-20 ',
      'en': '',
    },
    '5dn9035k': {
      'ru': 'АПНР-21-МОП1 ',
      'en': '',
    },
    'wyj4uxfw': {
      'ru': 'АППН-22-1 ',
      'en': '',
    },
    'l02rk77b': {
      'ru': 'АППН-23-1 ',
      'en': '',
    },
    't3re7n7o': {
      'ru': 'АРОЭ-22-1 ',
      'en': '',
    },
    'fyox77vg': {
      'ru': 'АРОЭ-22-2 ',
      'en': '',
    },
    'vpaesem8': {
      'ru': 'АРОЭ-23-1 ',
      'en': '',
    },
    '7snrk7vp': {
      'ru': 'АСАУ-22-1 ',
      'en': '',
    },
    'g32gdw39': {
      'ru': 'АТИК-22-1 ',
      'en': '',
    },
    'dyffhbjz': {
      'ru': 'АТИП-22-1 ',
      'en': '',
    },
    't6e6w6ds': {
      'ru': 'АТИП-23-1 ',
      'en': '',
    },
    'hms0vavn': {
      'ru': 'АЭИУ-20-ЭУ ',
      'en': '',
    },
    'oc6hq5e6': {
      'ru': 'АЭУН-21-ЭК1 ',
      'en': '',
    },
    '4g3j4qv9': {
      'ru': 'АЮРП-20 ',
      'en': '',
    },
    '982pnswi': {
      'ru': 'АЮРП-21-ТИП1 ',
      'en': '',
    },
    'wem9nctg': {
      'ru': 'БАПС-19-01 ',
      'en': '',
    },
    '3ypeym34': {
      'ru': 'БАПС-20-01 ',
      'en': '',
    },
    'mas2qnc3': {
      'ru': 'ББИ-19-01 ',
      'en': '',
    },
    'tjk0m0ni': {
      'ru': 'ББИ-20-01 ',
      'en': '',
    },
    'gtncs200': {
      'ru': 'ББИ-21-БА1 ',
      'en': '',
    },
    'ulixm5rk': {
      'ru': 'ББИ-22-БА1 ',
      'en': '',
    },
    'oz3yzqz2': {
      'ru': 'ББИ-23-БА1 ',
      'en': '',
    },
    '719bvybi': {
      'ru': 'БГУ-19-01 ',
      'en': '',
    },
    'x4b4nd43': {
      'ru': 'БПМ-21-1 ',
      'en': '',
    },
    '7iczqpc0': {
      'ru': 'БПМ-22-1 ',
      'en': '',
    },
    '8peiryiw': {
      'ru': 'БПМ-20-01 ',
      'en': '',
    },
    'u0j92vgf': {
      'ru': 'Выберите группу',
      'en': '',
    },
    'dkjupltd': {
      'ru': 'Найти...',
      'en': '',
    },
    'lkuu29sv': {
      'ru': 'Это поле не может быть пустым',
      'en': '',
    },
    'nd4inf2j': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'qq3nmmv9': {
      'ru': 'Это поле не может быть пустым',
      'en': '',
    },
    '8p1bejno': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'zzfra36q': {
      'ru': 'Сохранить',
      'en': 'Register',
    },
    'zdi6d13j': {
      'ru': 'ХАБУС',
      'en': 'ХАБУС',
    },
    '7pbxg9u4': {
      'ru': 'Home',
      'en': '',
    },
  },
  // UserStatusRoleChangePage
  {
    'li8lvkea': {
      'ru': 'Изменить статус и роль',
      'en': '',
    },
    'aubu6nea': {
      'ru':
          'Измените свой статус или роль. Например, если Вы перешли на новую ступень обучения',
      'en': '',
    },
    'wq6qah20': {
      'ru': 'Статус',
      'en': '',
    },
    'bir5g1y7': {
      'ru': '',
      'en': '',
    },
    'vd7ef799': {
      'ru': 'Роль',
      'en': '',
    },
    '6yv7is4l': {
      'ru': 'Абитуриент',
      'en': '',
    },
    '97rdttuo': {
      'ru': 'Студент',
      'en': '',
    },
    'z9c64lqb': {
      'ru': 'Магистрант',
      'en': '',
    },
    'ke5oxfm5': {
      'ru': 'Аспирант',
      'en': '',
    },
    '0ps21qm1': {
      'ru': 'Лаборант',
      'en': '',
    },
    'hza00ov0': {
      'ru': 'Докторант',
      'en': '',
    },
    'gsotmjy4': {
      'ru': 'Преподаватель',
      'en': '',
    },
    'b57xtr98': {
      'ru': 'Выберите роль',
      'en': '',
    },
    '151qmadc': {
      'ru': 'Найти...',
      'en': '',
    },
    '6qr19p6q': {
      'ru': 'Ваша роль будет проверена',
      'en': '',
    },
    '2tbo5o2c': {
      'ru': 'Field is required',
      'en': '',
    },
    'egn9bihi': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'j56t6vx4': {
      'ru': 'Сохранить',
      'en': 'Register',
    },
    'rf8yek63': {
      'ru': 'ХАБУС',
      'en': 'ХАБУС',
    },
    'esyau2pe': {
      'ru': 'Home',
      'en': '',
    },
  },
  // GetHelpPage
  {
    'n586r3qw': {
      'ru': 'Связаться с техподдержкой',
      'en': '',
    },
    'xbzaoh20': {
      'ru': 'Расскажите, что случилось - а мы постараемся помочь',
      'en': '',
    },
    'rq8titgd': {
      'ru': 'Опишите проблему',
      'en': '',
    },
    'y5f7l50e': {
      'ru': '',
      'en': '',
    },
    'g80ck5es': {
      'ru': 'Написать...',
      'en': '',
    },
    'we8qtnq4': {
      'ru': 'Поле не может быть пустым',
      'en': '',
    },
    'guwl8mfb': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'bwgfe8eh': {
      'ru': 'Отправить',
      'en': 'Register',
    },
    'dvxyy39m': {
      'ru': 'ХАБУС',
      'en': 'ХАБУС',
    },
    'yu3ykh0z': {
      'ru': 'Home',
      'en': '',
    },
  },
  // SendErrorPage
  {
    'bp3iflu0': {
      'ru': 'Сообщить об ошибке',
      'en': '',
    },
    '440yl1j2': {
      'ru':
          'Сообщите нам об ошибке, с которой Вы столкнулись и в новых обновлениях она будет исправлена... по крайней мере мы постараемся',
      'en': '',
    },
    '2d4aqzpj': {
      'ru': 'Опишите ошибку',
      'en': '',
    },
    'hdgabe4j': {
      'ru': '',
      'en': '',
    },
    'wk1av5qx': {
      'ru': 'Написать...',
      'en': '',
    },
    '6pix6gqm': {
      'ru': 'Поле не может быть пустым',
      'en': '',
    },
    '4zg8zs5o': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'fu807djb': {
      'ru': 'Отправить',
      'en': 'Register',
    },
    'xdbtgu14': {
      'ru': 'ХАБУС',
      'en': 'ХАБУС',
    },
    '2z9aso9d': {
      'ru': 'Home',
      'en': '',
    },
  },
  // SuggestImprovementPage
  {
    'zc3tcmef': {
      'ru': 'Предложить улучшение',
      'en': '',
    },
    '9q36tqf0': {
      'ru':
          'Расскажите нам, что бы Вы хотели видеть в приложении. Мы подумаем как это реализовать',
      'en': '',
    },
    'gfc3dmfe': {
      'ru': 'Опишите предложение',
      'en': '',
    },
    'dinbgzny': {
      'ru': '',
      'en': '',
    },
    'aod06z1m': {
      'ru': 'Написать...',
      'en': '',
    },
    'e5jejdls': {
      'ru': 'Поле не может быть пустым',
      'en': '',
    },
    'sgorekom': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'sf0j26xw': {
      'ru': 'Отправить',
      'en': 'Register',
    },
    '86ohm5y6': {
      'ru': 'ХАБУС',
      'en': 'ХАБУС',
    },
    'gn2doft6': {
      'ru': 'Home',
      'en': '',
    },
  },
  // SettingsPage
  {
    '7kpyqkgy': {
      'ru': 'Личный кабинет ВВГУ',
      'en': '',
    },
    'u53mpc6w': {
      'ru': 'Мой профиль',
      'en': '',
    },
    '95tjuqhb': {
      'ru': 'Главная',
      'en': '',
    },
    'gv7jy0n5': {
      'ru': 'Создать сообщество',
      'en': '',
    },
    '82qz2nyb': {
      'ru': 'Создать чат',
      'en': '',
    },
    'b0vwhkol': {
      'ru': 'Настройки',
      'en': '',
    },
    '1bo0ua8i': {
      'ru': 'Выйти',
      'en': '',
    },
    'rq7s45b8': {
      'ru': 'Версия 1.0beta_build',
      'en': '',
    },
    '5x3j19zu': {
      'ru': 'habus.tech@yandex.ru',
      'en': '',
    },
    'zgufdj5e': {
      'ru': 'Информация о профиле',
      'en': '',
    },
    'pzghgx3i': {
      'ru': 'Изменить',
      'en': 'Change',
    },
    '14j3vntp': {
      'ru': 'Оформление и уведомления',
      'en': '',
    },
    'k9mnu9po': {
      'ru': 'Изменить тему',
      'en': 'Change theme',
    },
    'xpcs6vtk': {
      'ru': 'Уведомления',
      'en': 'Notifications',
    },
    'uwedsw03': {
      'ru': 'Изменить фото профиля',
      'en': '',
    },
    'wphw62fv': {
      'ru': 'Изменить статус или роль',
      'en': '',
    },
    '05stdfdg': {
      'ru': 'Сменить язык',
      'en': '',
    },
    'sswb7zrt': {
      'ru': 'Безопасность и связь',
      'en': '',
    },
    'nnhoklz9': {
      'ru': 'Сменить пароль',
      'en': '',
    },
    'zyn7cc4w': {
      'ru': 'Связаться с поддержкой',
      'en': '',
    },
    '9fkhp7dz': {
      'ru': 'Сообщить об ошибке',
      'en': '',
    },
    '8bv4pv4d': {
      'ru': 'Предложить улучшение',
      'en': '',
    },
    'qkbt13rq': {
      'ru': 'Привязка',
      'en': '',
    },
    'udm88aq9': {
      'ru': 'Привязать ЛК ВВГУ',
      'en': '',
    },
    '8mjwfu04': {
      'ru': 'Выйти',
      'en': '',
    },
    'bksk4t6i': {
      'ru': 'Версия 1.0beta_build',
      'en': '',
    },
    'ggk3m7ae': {
      'ru': 'ХАБУС',
      'en': 'ХАБУС',
    },
    'ab0hcdhe': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // ExitDialog
  {
    'nv82df4q': {
      'ru': 'Подтверждение выхода',
      'en': 'Confirm exit',
    },
    '0xrsncn1': {
      'ru':
          'Вы уверены, что хотите выйти из приложения? Нам будет Вас не хватать :(',
      'en': 'Are you sure you want to exit the app? We will miss you :(',
    },
    'hfjkxgm6': {
      'ru': 'Остаться',
      'en': 'Stay',
    },
    '26sfwjc6': {
      'ru': 'Выйти',
      'en': 'Exit',
    },
  },
  // ThemeChanger
  {
    'sybzx9sh': {
      'ru': 'Выберите тему',
      'en': '',
    },
    '5gbmuwc6': {
      'ru': 'Измените тему приложения, выбрав одну из приведённых ниже',
      'en': '',
    },
    'h89ocx7n': {
      'ru': 'Сила тьмы',
      'en': '',
    },
    'xm5id7eu': {
      'ru': 'Сила света',
      'en': '',
    },
    '3ycu9xr4': {
      'ru': 'Назад',
      'en': '',
    },
    'sa1yvmt5': {
      'ru': 'Сохранить',
      'en': '',
    },
  },
  // LanguageChanger
  {
    'vhviesuz': {
      'ru': 'Выберите язык',
      'en': '',
    },
    '64q48oej': {
      'ru': 'Смените язык приложения, выбрав один из приведённых ниже',
      'en': '',
    },
    'fan4jvnx': {
      'ru': 'Русский',
      'en': '',
    },
    '9ngz6azr': {
      'ru': 'English.',
      'en': '',
    },
    'ws8twq2u': {
      'ru': 'Назад',
      'en': '',
    },
    'wtlf2o4j': {
      'ru': 'Сохранить',
      'en': '',
    },
  },
  // ChangerPhoto
  {
    '5rofu6wc': {
      'ru': 'Выберите фото',
      'en': '',
    },
    'wo2n7czk': {
      'ru': 'Измените фото профиля, выбрав его из своей галереи',
      'en': '',
    },
    'sd3b81u6': {
      'ru': 'Назад',
      'en': '',
    },
    'fhl6db3f': {
      'ru': 'Сохранить',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'bhd2rhr6': {
      'ru': '',
      'en': '',
    },
    '7l6hmvxk': {
      'ru': '',
      'en': '',
    },
    'jbmnbgem': {
      'ru': '',
      'en': '',
    },
    'ysidhfwb': {
      'ru': '',
      'en': '',
    },
    '2owhejz8': {
      'ru': '',
      'en': '',
    },
    'y3aonwlu': {
      'ru': '',
      'en': '',
    },
    'fkuqhrw0': {
      'ru': '',
      'en': '',
    },
    'dwn3972c': {
      'ru': '',
      'en': '',
    },
    'zlnyjdoc': {
      'ru': '',
      'en': '',
    },
    'qisn1hn9': {
      'ru': '',
      'en': '',
    },
    'kv3n4gwm': {
      'ru': '',
      'en': '',
    },
    '7nsgjsxb': {
      'ru': '',
      'en': '',
    },
    'op4tqyne': {
      'ru': '',
      'en': '',
    },
    'rdw9njr2': {
      'ru': '',
      'en': '',
    },
    'ij9bdi55': {
      'ru': '',
      'en': '',
    },
    'ft7ke23z': {
      'ru': '',
      'en': '',
    },
    'iyjutn6g': {
      'ru': '',
      'en': '',
    },
    'l59919lr': {
      'ru': '',
      'en': '',
    },
    'gdv7g3oz': {
      'ru': '',
      'en': '',
    },
    'rtaddy2s': {
      'ru': '',
      'en': '',
    },
    'zq0qf88d': {
      'ru': '',
      'en': '',
    },
    'j8114hsq': {
      'ru': '',
      'en': '',
    },
    '7usmar1x': {
      'ru': '',
      'en': '',
    },
    'j5upnwc8': {
      'ru': '',
      'en': '',
    },
    'vwlwx2em': {
      'ru': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
