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
      'en': 'HABUS',
    },
    '9841ez48': {
      'ru': 'Место сосредоточения',
      'en': 'Place of concentration',
    },
    '4ahqd287': {
      'ru': 'Мессенджер, новости, сообщества, личный кабинет и многое другое',
      'en': 'Messenger, news, communities, personal account and much more',
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
      'en': 'HABUS',
    },
    'ruei3u8r': {
      'ru': '',
      'en': 'Email',
    },
    'i4lxweb9': {
      'ru': 'Email',
      'en': 'Email',
    },
    '2lgtcmej': {
      'ru': '',
      'en': 'Password',
    },
    'xx065rme': {
      'ru': 'Пароль',
      'en': 'Password',
    },
    'q02zncbj': {
      'ru': '',
      'en': 'Confirm password',
    },
    'ue9ygtbo': {
      'ru': 'Подтвердите пароль',
      'en': 'Confirm the password',
    },
    'hmv71fw8': {
      'ru': 'Это поле обязательно',
      'en': 'This field is required',
    },
    'ew1g5vng': {
      'ru': 'Почта выглядит странно',
      'en': 'Mail looks weird',
    },
    '808emnxw': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '0hdvbipv': {
      'ru': 'Это поле обязательно',
      'en': 'This field is required',
    },
    'mviifufh': {
      'ru': 'Минимум 6 символов',
      'en': 'Minimum 6 characters',
    },
    '6ckb4nk2': {
      'ru': 'Слабый пароль',
      'en': 'Weak password',
    },
    '8b88dhf4': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'bkdi370w': {
      'ru': 'Это поле обязательно',
      'en': 'This field is required',
    },
    'tad82tst': {
      'ru': 'Минимум 6 символов',
      'en': 'Minimum 6 characters',
    },
    'y2j5jlme': {
      'ru': 'Слабый пароль',
      'en': 'Weak password',
    },
    '0r5erlnf': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'k30wf1xs': {
      'ru': 'Зарегистрироваться',
      'en': 'Register',
    },
    'vn6t8lca': {
      'ru': 'Уже есть аккаунт?',
      'en': 'Already have an account?',
    },
    'ss4g70iw': {
      'ru': 'Войти',
      'en': 'To come in',
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
      'en': 'Chat',
    },
    '4y858a2d': {
      'ru': 'Создавайте групповые и обычные чаты',
      'en': 'Create group and regular chats',
    },
    'ql6ausyb': {
      'ru': 'Делитесь',
      'en': 'Share',
    },
    'ncktlp6m': {
      'ru':
          'Создавайте группы и сообщества, выкладывайте истории и размещайте посты',
      'en': 'Create groups and communities, share stories and post',
    },
    '04nksib6': {
      'ru': 'Следите',
      'en': 'Follow',
    },
    '2gptrnlp': {
      'ru':
          'Смотрите расписание, баллы... в общем весь личный кабинет у Вас в кармане!',
      'en':
          'See the schedule, points ... in general, the entire personal account is in your pocket!',
    },
    '2rorad73': {
      'ru': 'Начать',
      'en': 'Begin',
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
      'en': 'HABUS',
    },
    'dqmava4q': {
      'ru': 'Осталось немного',
      'en': 'Wonderful! Left a little',
    },
    'j0sw6cig': {
      'ru':
          'Мы отправили Вам ссылку-подтверждение на почту. Было бы славно, если бы Вы на неё нажали',
      'en':
          'We have sent you a confirmation link by email. It would be nice if you clicked on it',
    },
    'sac3xqc3': {
      'ru': 'Войти',
      'en': 'To come in',
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
      'en': 'HABUS',
    },
    '7ue39d6j': {
      'ru': '',
      'en': 'Email',
    },
    's04rjuen': {
      'ru': 'Email',
      'en': '',
    },
    'ftjkdl9z': {
      'ru': '',
      'en': 'Password',
    },
    'rfftsqwi': {
      'ru': 'Пароль',
      'en': '',
    },
    'trhp94my': {
      'ru': 'Это поле обязательно',
      'en': 'This field is required',
    },
    'ihzbw1md': {
      'ru': 'Почта выглядит странно',
      'en': 'Mail looks weird',
    },
    'kfj6sip8': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'z33vbu6a': {
      'ru': 'Это поле обязательно',
      'en': 'This field is required',
    },
    'hd67wg9d': {
      'ru': 'Минимум 6 символов',
      'en': 'Minimum 6 characters',
    },
    'cbl785b6': {
      'ru': 'Слабый пароль',
      'en': 'Weak password',
    },
    '8ciz5mrw': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '603ktmif': {
      'ru': 'Войти',
      'en': 'To come in',
    },
    'd72d1omd': {
      'ru': 'Забыли пароль?',
      'en': 'Forgot your password?',
    },
    'c4jfmhbl': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // ForgotPassPage
  {
    'rua4rzxc': {
      'ru': 'ХАБУС',
      'en': 'HABUS',
    },
    'b3525net': {
      'ru': 'Введите почту',
      'en': 'Enter your mail',
    },
    '46stux2f': {
      'ru': 'Мы отправим Вам ссылку для восстановления пароля',
      'en': 'We will send you a link to reset your password',
    },
    'digx179s': {
      'ru': '',
      'en': 'Email',
    },
    'ljee5b2d': {
      'ru': 'Email',
      'en': '',
    },
    'l7lrfup9': {
      'ru': 'Это поле обязательно',
      'en': 'This field is required',
    },
    '4zt7gkxb': {
      'ru': 'Почта выглядит странно',
      'en': 'Mail looks weird',
    },
    '15n8ma9d': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '0t8prbiz': {
      'ru': 'Далее',
      'en': 'Further',
    },
    'nabs0ta1': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // ForgotPassPageVerification
  {
    'gv9y6p5p': {
      'ru': 'ХАБУС',
      'en': 'HABUS',
    },
    'a3naeoqn': {
      'ru': 'Ссылка отправлена!',
      'en': 'Link sent!',
    },
    'khbec071': {
      'ru': 'Проверяйте почту, в особенности папку спам',
      'en': 'Check your mail, especially the spam folder',
    },
    'qw8fc9s8': {
      'ru': 'Войти',
      'en': 'To come in',
    },
    'sijbju83': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // HomePage
  {
    'j5hehulf': {
      'ru': 'Личный кабинет ВВГУ',
      'en': 'VVGU personal account',
    },
    'vbufudzh': {
      'ru': 'Мой профиль',
      'en': 'My profile',
    },
    'ntgiet22': {
      'ru': 'Главная',
      'en': 'home',
    },
    'jeoqy9ab': {
      'ru': 'Создать сообщество',
      'en': 'Create a Community',
    },
    '99r94c3x': {
      'ru': 'Создать чат',
      'en': 'Create a chat',
    },
    'gz9zsgc7': {
      'ru': 'Настройки',
      'en': 'Settings',
    },
    'te3390pd': {
      'ru': 'Выйти',
      'en': 'Go out',
    },
    'ylghcgu4': {
      'ru': '1.0beta_build',
      'en': 'Version 1.0beta_build',
    },
    'yhgd92hs': {
      'ru': 'habus.tech@yandex.ru',
      'en': 'habus.tech@yandex.ru',
    },
    't19z9ie9': {
      'ru': 'Главная',
      'en': 'Main',
    },
    'c9hiaj7l': {
      'ru': 'Новости',
      'en': 'News',
    },
    'n4lwm5yb': {
      'ru': ' ВВГУ',
      'en': 'VVGU',
    },
    'u35wavjb': {
      'ru': '',
      'en': '',
    },
    'r258pdew': {
      'ru': 'Найти...',
      'en': 'Find...',
    },
    'yndbo3sr': {
      'ru': 'Фильтр',
      'en': 'Filter',
    },
    '21ires9t': {
      'ru': 'Новые',
      'en': 'New',
    },
    'fw7z82d6': {
      'ru': 'Студентка ВВГУ стала участницей Летней школы журналистики-2023',
      'en':
          'VVGU students became finalists of the All-Russian Championship \"Professionals\" in the \"Industrial Design\" competency',
    },
    'gqpm9gr1': {
      'ru': '4 августа 2023',
      'en': 'Fri, 28 Jul 2023 15:19:00 +1000',
    },
    'imae46rv': {
      'ru': 'Читать',
      'en': 'Read',
    },
    '1otryra8': {
      'ru': 'Сожалеем, но это все записи :(',
      'en': '',
    },
    'jblf7y87': {
      'ru': 'Сообщества',
      'en': 'Communities',
    },
    'pjoxivuf': {
      'ru': '[название сообщества]',
      'en': 'community name',
    },
    'u2ktxn8o': {
      'ru': '@id',
      'en': '@id',
    },
    '9xb7fyvi': {
      'ru': ' • ',
      'en': '•',
    },
    'yzsvu7dj': {
      'ru': '[время публикации]',
      'en': '4 minutes ago',
    },
    'hvj121zj': {
      'ru': '[текст]',
      'en': 'Text',
    },
    'ofputsr8': {
      'ru': '4',
      'en': '4',
    },
    'n04ntvn4': {
      'ru': '4',
      'en': '4',
    },
    '5rg71dka': {
      'ru': 'Сожалеем, но это все записи :(',
      'en': '',
    },
    'x5b0dz1u': {
      'ru': 'Новое в',
      'en': 'New in',
    },
    'zskfr57p': {
      'ru': ' сообществах',
      'en': 'communities',
    },
    'v16s9r75': {
      'ru': 'Лента',
      'en': 'Ribbon',
    },
    'o221adww': {
      'ru': 'Новое в',
      'en': 'New in',
    },
    'mban74u0': {
      'ru': ' ленте',
      'en': 'tape',
    },
    'n4nms3fv': {
      'ru': '[имя пользователя]',
      'en': '',
    },
    '47ws0heh': {
      'ru': '2h',
      'en': '',
    },
    'wm9im3ah': {
      'ru': '[текст]',
      'en': '',
    },
    'go4s2tvr': {
      'ru': '4',
      'en': '',
    },
    'n66ewj7h': {
      'ru': '4',
      'en': '',
    },
    '77xehwm5': {
      'ru': 'Сожалеем, но это все записи :(',
      'en': '',
    },
    'ysuwpepa': {
      'ru': 'Опросы',
      'en': 'Polls',
    },
    'ik6686gb': {
      'ru': 'Новое в',
      'en': 'New in',
    },
    '1apkzap8': {
      'ru': ' опросах',
      'en': 'surveys',
    },
    't4o0f37e': {
      'ru': '',
      'en': '',
    },
    'sp2q14pn': {
      'ru': 'Найти...',
      'en': 'Find...',
    },
    'agxoyi6w': {
      'ru': 'Фильтр',
      'en': 'Filter',
    },
    'n8b2cup7': {
      'ru': 'Новые',
      'en': 'New',
    },
    'eflztpcn': {
      'ru': 'Проходи опросы - получай ',
      'en': '',
    },
    '021487zf': {
      'ru': 'достижения',
      'en': '',
    },
    '6xie4ptp': {
      'ru':
          'Проходя опросы, ты не только помогаешь нуждающимся, но и зарабатываешь уникальные достижения!',
      'en': '',
    },
    'hlj3253b': {
      'ru': 'Создать опрос',
      'en': 'Create a survey',
    },
    'inrls6hp': {
      'ru': 'Помоги мне развиваться дальше',
      'en': '',
    },
    'mzd99u3h': {
      'ru':
          'Чтобы развиваться дальше и становиться лучше для пользователей, мне важно знать Ваше мнение по некоторым вопросам :)\nЭто не займёт много времени.',
      'en': '',
    },
    'al1bbqdt': {
      'ru': 'От ',
      'en': '',
    },
    'hmn1dqr8': {
      'ru': 'ХАБУС',
      'en': '',
    },
    'f3mnkmpr': {
      'ru': '0',
      'en': '',
    },
    'xqu4t7n5': {
      'ru': '0',
      'en': '',
    },
    '4ijtjvv2': {
      'ru': 'От ',
      'en': '',
    },
    '9fs1llul': {
      'ru': '0',
      'en': '',
    },
    '3r2f636t': {
      'ru': '0',
      'en': '',
    },
    '5hncbuor': {
      'ru': 'Сожалеем, но это все записи :(',
      'en': '',
    },
    'dyw7os9m': {
      'ru': 'ХАБУС',
      'en': 'HABUS',
    },
    'l32v18n1': {
      'ru': 'Home',
      'en': 'Home',
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
      'en': 'HABUS',
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
      'en': 'HABUS',
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
      'en': 'HABUS',
    },
    '7iwas8bc': {
      'ru': 'Давайте знакомиться',
      'en': 'let\'s get acquainted',
    },
    '434y2pch': {
      'ru': '',
      'en': 'Email',
    },
    '660l5474': {
      'ru': 'Введите имя',
      'en': 'Enter your name',
    },
    '64lqgapq': {
      'ru': '',
      'en': 'Email',
    },
    '3v3udrid': {
      'ru': 'Введите фамилию',
      'en': 'Enter last name',
    },
    'drvnfmui': {
      'ru':
          'Указывайте своё настоящее имя и фамилию, чтобы другим пользователям было легче Вас найти',
      'en':
          'Please use your real first and last name to make it easier for other users to find you.',
    },
    '820pn8ar': {
      'ru': 'Студент',
      'en': '',
    },
    'nscpox4g': {
      'ru': 'Абитуриент',
      'en': 'Enrollee',
    },
    'pi0wcveu': {
      'ru': 'Студент',
      'en': 'Student',
    },
    'tfz4uzts': {
      'ru': 'Аспирант',
      'en': 'Graduate student',
    },
    '2l7uudx4': {
      'ru': 'Докторант',
      'en': 'PhD student',
    },
    'nbrl4mk7': {
      'ru': 'Преподаватель',
      'en': 'Teacher',
    },
    'a7vwshf7': {
      'ru': 'Магистрант',
      'en': 'Master student',
    },
    '3wz77wud': {
      'ru': 'Лаборант',
      'en': 'laboratory assistant',
    },
    'kins1x33': {
      'ru': '',
      'en': 'Choose a role',
    },
    'kup43co3': {
      'ru': 'Поиск',
      'en': 'Search',
    },
    'nlidvsw7': {
      'ru': 'Верность выбранной Вами роли будет проверена',
      'en': 'The correctness of the role you have chosen will be checked',
    },
    'hfzlsc9h': {
      'ru': 'Это поле обязятельно',
      'en': 'This field is required',
    },
    '4t0cl656': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'a7dc3fey': {
      'ru': 'Это поле обязательно',
      'en': 'This field is required',
    },
    'aptmsk91': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'qjb0p5xz': {
      'ru': 'Продолжить',
      'en': 'Continue',
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
      'en': 'Account Information',
    },
    's2z98gid': {
      'ru': 'Измените основную информацию об аккаунте',
      'en': 'Change basic account information',
    },
    '5inglpq7': {
      'ru': 'Имя',
      'en': 'Name',
    },
    '2gn6dad1': {
      'ru': '',
      'en': '',
    },
    '37awu7da': {
      'ru': 'Фамилия',
      'en': 'Surname',
    },
    '3ialxtxh': {
      'ru': '',
      'en': '',
    },
    'qxpvdk8k': {
      'ru': 'Кафедра',
      'en': 'Chair',
    },
    'uyr1c2k8': {
      'ru': 'IT-колледж (IThub Владивосток) ',
      'en': 'IT College (IThub Vladivostok)',
    },
    'xwuvjlh1': {
      'ru': 'Академический колледж ',
      'en': 'Academic College',
    },
    'eob7zjrt': {
      'ru': 'Высшая школа кино и телевидения ',
      'en': 'High School of Film and Television',
    },
    'sl5o3hcs': {
      'ru': 'Институт заочного обучения ',
      'en': 'Distance Learning Institute',
    },
    'lo6ybbyf': {
      'ru': 'Кафедра гражданско-правовых дисциплин ',
      'en': 'Department of Civil Law Disciplines',
    },
    'kujh28hf': {
      'ru': 'Кафедра гуманитарных и социально-экономических дисциплин ',
      'en': 'Department of Humanities and Socio-Economic Disciplines',
    },
    'fshwew9p': {
      'ru': 'Кафедра дизайна и технологий ',
      'en': 'Department of Design and Technology',
    },
    'ye3wtkcd': {
      'ru': 'Кафедра информационной безопасности ',
      'en': 'Department of Information Security',
    },
    'ckbw7h0f': {
      'ru': 'Кафедра информационных технологий и систем ',
      'en': 'Department of Information Technologies and Systems',
    },
    'hacfbfpz': {
      'ru': 'Кафедра маркетинга и торговли ',
      'en': 'Department of Marketing and Trade',
    },
    '141q82r4': {
      'ru': 'Кафедра математики и моделирования ',
      'en': 'Department of Mathematics and Modeling',
    },
    'ypl77ukh': {
      'ru': 'Кафедра международных отношений и права ',
      'en': 'Department of International Relations and Law',
    },
    '1mcjm60j': {
      'ru': 'Кафедра межкультурных коммуникаций и переводоведения ',
      'en':
          'Department of Intercultural Communications and Translation Studies',
    },
    '2u4t36ad': {
      'ru': 'Кафедра русского языка ',
      'en': 'Department of the Russian language',
    },
    'ho2zpekv': {
      'ru': 'Кафедра теории и истории российского и зарубежного права ',
      'en': 'Department of Theory and History of Russian and Foreign Law',
    },
    'k6pa6otf': {
      'ru': 'Кафедра транспортных процессов и технологий ',
      'en': 'Department of Transport Processes and Technologies',
    },
    'ul69w5tx': {
      'ru': 'Кафедра туризма и гостинично-ресторанного бизнеса ',
      'en': 'Department of Tourism and Hotel and Restaurant Business',
    },
    'prlr7bn1': {
      'ru': 'Кафедра физкультурно-оздоровительной и спортивной работы ',
      'en': 'Department of Physical Culture and Health and Sports Work',
    },
    '8ktckca7': {
      'ru': 'Кафедра философии и юридической психологии ',
      'en': 'Department of Philosophy and Legal Psychology',
    },
    '17m55lta': {
      'ru': 'Кафедра экономики и управления ',
      'en': 'Department of Economics and Management',
    },
    'a5j6hrst': {
      'ru': 'Колледж индустрии моды и красоты ',
      'en': 'College of Fashion and Beauty Industry',
    },
    'u5qwe4q5': {
      'ru': 'Колледж сервиса и дизайна  ',
      'en': 'College of Service and Design',
    },
    'jofkwnz6': {
      'ru': 'Отделение специальностей среднего профессионального образования ',
      'en': 'Department of specialties of secondary vocational education',
    },
    'yb66dvzd': {
      'ru': 'Отделение среднего профессионального образования ',
      'en': 'Department of secondary vocational education',
    },
    'vbbp3oos': {
      'ru': 'Педагогический институт ',
      'en': 'Pedagogical Institute',
    },
    'e8avhhuw': {
      'ru': 'Филиал ФГБОУ ВО \"ВВГУ\" в г. Уссурийске ',
      'en': 'Branch of FGBOU VO \"VVGU\" in Ussuriysk',
    },
    '8e2tf3a3': {
      'ru': 'Выберите кафедру',
      'en': 'Choose department',
    },
    'nkfofutc': {
      'ru': 'Найти...',
      'en': 'Find...',
    },
    'vkdo3dkg': {
      'ru': 'Группа',
      'en': 'Group',
    },
    '9kp7m4e2': {
      'ru': 'IT-СИП-22-В1 ',
      'en': 'IT-SIP-22-V1',
    },
    'bx38i0x2': {
      'ru': 'IT-СИП-22-П1 ',
      'en': 'IT-SIP-22-P1',
    },
    'zagu4ql4': {
      'ru': 'IT-СИП-23-В1 ',
      'en': 'IT-SIP-23-V1',
    },
    'x65zq3wk': {
      'ru': 'IT-СИП-23-П1 ',
      'en': 'IT-SIP-23-P1',
    },
    '1nkb87z7': {
      'ru': 'IT-СОИП-22-В1 ',
      'en': 'IT-SOIP-22-V1',
    },
    'goe0rvhx': {
      'ru': 'IT-СОИП-22-П1 ',
      'en': 'IT-SOIP-22-P1',
    },
    'wedipl5a': {
      'ru': 'IT-СОИП-23-В1 ',
      'en': 'IT-SOIP-23-V1',
    },
    '4rembx6s': {
      'ru': 'IT-СОИП-23-П1 ',
      'en': 'IT-SOIP-23-P1',
    },
    'o0ewj005': {
      'ru': 'А/БПИ-20-ПЭ1 ',
      'en': 'A/BPI-20-PE1',
    },
    'g7k7jcbi': {
      'ru': 'А/БСС-20-СА1 ',
      'en': 'A/BSS-20-CA1',
    },
    'pza402kk': {
      'ru': 'А/ВБСС-19 ',
      'en': 'A/VBSS-19',
    },
    'ltsi6xiw': {
      'ru': 'А/ЗБМН-19 ',
      'en': 'A/ZBMN-19',
    },
    'dg1wjd7m': {
      'ru': 'А/ЗБМН-20 ',
      'en': 'A/ZBMN-20',
    },
    'wxxdmgjh': {
      'ru': 'А/ЗБЭМ-20 ',
      'en': 'A/ZBEM-20',
    },
    'pi9yql0l': {
      'ru': 'А/ЗБЭУ-19 ',
      'en': 'A/ZBEU-19',
    },
    '71n9iw8z': {
      'ru': 'А/ЗКМ(9)-20-01 ',
      'en': 'A/ZKM(9)-20-01',
    },
    '2qvrnx66': {
      'ru': 'А/ЗСКМ-21 ',
      'en': 'A/ZSKM-21',
    },
    'j2ci1pbp': {
      'ru': 'А/ЗСКМ-22-1 ',
      'en': 'A/ZSKM-22-1',
    },
    'punnihxp': {
      'ru': 'А/ЗСОКМ-21 ',
      'en': 'A/ZSOCM-21',
    },
    'dt3w3ck8': {
      'ru': 'А/ЗСОКМ-22-1 ',
      'en': 'A/ZSOCM-22-1',
    },
    'szxw1whh': {
      'ru': 'А/ЗССО-21 ',
      'en': 'А/ЗССО-21',
    },
    'xefgxan5': {
      'ru': 'А/ЗССО-22-1 ',
      'en': 'А/ЗССО-22-1',
    },
    'ys7ctxfj': {
      'ru': 'А/ЗСТ(9)-19-01 ',
      'en': 'A/FTA(9)-19-01',
    },
    'zlbl45uz': {
      'ru': 'А/ЗСТ-19-01 ',
      'en': 'A/ZST-19-01',
    },
    'ihx5ynxl': {
      'ru': 'А/ЗСТ-20-01 ',
      'en': 'A/ZST-20-01',
    },
    'm1bzxuk5': {
      'ru': 'А/ЗСЭЗ(9)-19-01 ',
      'en': 'A/ZSEZ(9)-19-01',
    },
    '2wyrzzkt': {
      'ru': 'А/ЗСЭЗ-20-01 ',
      'en': 'A/ZSEZ-20-01',
    },
    'n556j80h': {
      'ru': 'А/ЗЭБУ(9)-19-01 ',
      'en': 'A/ZEBU(9)-19-01',
    },
    'sjbkkm56': {
      'ru': 'А/ПК(9)-20-01 ',
      'en': 'A/PC(9)-20-01',
    },
    'c4e4os48': {
      'ru': 'А/ПСО(9)-20-01 ',
      'en': 'A/PSO(9)-20-01',
    },
    'jkt7iw03': {
      'ru': 'А/РК(9)-20-01 ',
      'en': 'A/RK(9)-20-01',
    },
    'xw03d4ud': {
      'ru': 'А/СОГД-22-1 ',
      'en': 'A/SOGD-22-1',
    },
    '04d4jnnt': {
      'ru': 'А/СОКМ-22-1 ',
      'en': 'A/SOCM-22-1',
    },
    'v1n2l1bk': {
      'ru': 'А/СООП-22-1 ',
      'en': 'A/SOOP-22-1',
    },
    'g13xhdzb': {
      'ru': 'А/СОПД-22-1 ',
      'en': 'А/SOPD-22-1',
    },
    'vv8tcdku': {
      'ru': 'А/СОПИ-21-1 ',
      'en': 'A/SOPI-21-1',
    },
    'dut7r94l': {
      'ru': 'А/СОПИ-22-1 ',
      'en': 'A/SOPI-22-1',
    },
    'y4h8lj1b': {
      'ru': 'А/СОПИ-22-2 ',
      'en': 'A/SOPI-22-2',
    },
    'yi3xmj12': {
      'ru': 'А/СОПИ-23-1 ',
      'en': 'A/SOPI-23-1',
    },
    'wipp7qxn': {
      'ru': 'А/СОПН-22-1 ',
      'en': 'A/SOPN-22-1',
    },
    'za8fs4ki': {
      'ru': 'А/СОРД-21-1 ',
      'en': 'A/SORD-21-1',
    },
    'ip386k83': {
      'ru': 'А/СОРД-22-1 ',
      'en': 'A/SORD-22-1',
    },
    'j818qyje': {
      'ru': 'А/СОРД-23-1 ',
      'en': 'A/SORD-23-1',
    },
    'hsn6997f': {
      'ru': 'А/СОРК-21-1 ',
      'en': 'A/SORK-21-1',
    },
    'eks1jllr': {
      'ru': 'А/СОРК-22-1 ',
      'en': 'A/SORK-22-1',
    },
    '6hx34fc9': {
      'ru': 'А/СОРК-23-1 ',
      'en': 'A/SORK-23-1',
    },
    '67s7w7pg': {
      'ru': 'А/СОСА-22-1 ',
      'en': 'А/СОСА-22-1',
    },
    'dc0seyio': {
      'ru': 'А/СОСА-23-1 ',
      'en': 'А/СОСА-23-1',
    },
    'nfbx68rw': {
      'ru': 'А/СОСО-21-1 ',
      'en': 'А/СОСО-21-1',
    },
    'baoziujk': {
      'ru': 'А/СОСО-22-1 ',
      'en': 'А/СОСО-22-1',
    },
    'nb6mit3v': {
      'ru': 'А/СОСЭ-21-1 ',
      'en': 'А/SOSE-21-1',
    },
    'hsj7sl12': {
      'ru': 'А/СОСЭ-22-1 ',
      'en': 'А/SOSE-22-1',
    },
    'ojqc93uk': {
      'ru': 'А/СОСЭ-22-2 ',
      'en': 'А/SOSE-22-2',
    },
    'c6ixruv8': {
      'ru': 'А/СОТГ-23-ТУ1 ',
      'en': 'A/SOTG-23-TU1',
    },
    'aqq4ddo8': {
      'ru': 'А/СОТУ-22-1 ',
      'en': 'A/SOTU-22-1',
    },
    'z5z2d96c': {
      'ru': 'А/СОФЗ-22-1 ',
      'en': 'A/SOFZ-22-1',
    },
    'mynzasou': {
      'ru': 'А/СОЭБ-21 ',
      'en': 'A/SOEB-21',
    },
    'yl645euc': {
      'ru': 'А/СПИ-21-1 ',
      'en': 'A/SPI-21-1',
    },
    'f7twrsnn': {
      'ru': 'А/СПИ-22-1 ',
      'en': 'A/SPI-22-1',
    },
    'eeymv00m': {
      'ru': 'А/СРД-22-1 ',
      'en': 'A/SRD-22-1',
    },
    '13zec5qy': {
      'ru': 'А/СРК-21-1 ',
      'en': 'A/SRK-21-1',
    },
    '94xcpjfm': {
      'ru': 'А/СРК-22-1 ',
      'en': 'A/SRK-22-1',
    },
    'mjrpqueg': {
      'ru': 'А/ССО-21-1 ',
      'en': 'А/ССО-21-1',
    },
    '0irwgi8f': {
      'ru': 'А/ССО-22-1 ',
      'en': 'А/ССО-22-1',
    },
    '2mygqbhf': {
      'ru': 'А/ССЭ-21-1 ',
      'en': 'A/SSE-21-1',
    },
    'fpm61b8r': {
      'ru': 'А/ССЭ-22-1 ',
      'en': 'A/SSE-22-1',
    },
    '2atgd5mx': {
      'ru': 'А/СТ(9)-20-01 ',
      'en': 'A/ST(9)-20-01',
    },
    'fvvc2qnv': {
      'ru': 'А/СЭБ-21-1 ',
      'en': 'A/SEB-21-1',
    },
    'bktzcuqt': {
      'ru': 'А/СЭБ-22-1 ',
      'en': 'A/SEB-22-1',
    },
    '21af41yo': {
      'ru': 'А/СЭЗ(9)-20-01 ',
      'en': 'A/FEZ(9)-20-01',
    },
    'v11dl0nq': {
      'ru': 'А/ЭБУ(9)-20-01 ',
      'en': 'A/ECU(9)-20-01',
    },
    'nl7kbqz3': {
      'ru': 'АМЕН-22-1 ',
      'en': 'AMEN-22-1',
    },
    '67huk6y4': {
      'ru': 'АМЕН-23-1 ',
      'en': 'AMEN-23-1',
    },
    'bdsouhzh': {
      'ru': 'АМНО-22-1 ',
      'en': 'AMNO-22-1',
    },
    '8elt5rmv': {
      'ru': 'АМПО-22-1 ',
      'en': 'AMPO-22-1',
    },
    'p7vefzdl': {
      'ru': 'АМСИ-22-1 ',
      'en': 'AMSI-22-1',
    },
    'hec2u3yo': {
      'ru': 'АПИП-22-1 ',
      'en': 'APIP-22-1',
    },
    '6eqb7a2e': {
      'ru': 'АПНР-20 ',
      'en': 'APNR-20',
    },
    '5dn9035k': {
      'ru': 'АПНР-21-МОП1 ',
      'en': 'APNR-21-MOP1',
    },
    'wyj4uxfw': {
      'ru': 'АППН-22-1 ',
      'en': 'APPN-22-1',
    },
    'l02rk77b': {
      'ru': 'АППН-23-1 ',
      'en': 'APPN-23-1',
    },
    't3re7n7o': {
      'ru': 'АРОЭ-22-1 ',
      'en': 'AROE-22-1',
    },
    'fyox77vg': {
      'ru': 'АРОЭ-22-2 ',
      'en': 'AROE-22-2',
    },
    'vpaesem8': {
      'ru': 'АРОЭ-23-1 ',
      'en': 'AROE-23-1',
    },
    '7snrk7vp': {
      'ru': 'АСАУ-22-1 ',
      'en': 'ASAU-22-1',
    },
    'g32gdw39': {
      'ru': 'АТИК-22-1 ',
      'en': 'ATIK-22-1',
    },
    'dyffhbjz': {
      'ru': 'АТИП-22-1 ',
      'en': 'ATIP-22-1',
    },
    't6e6w6ds': {
      'ru': 'АТИП-23-1 ',
      'en': 'ATIP-23-1',
    },
    'hms0vavn': {
      'ru': 'АЭИУ-20-ЭУ ',
      'en': 'AEIU-20-EU',
    },
    'oc6hq5e6': {
      'ru': 'АЭУН-21-ЭК1 ',
      'en': 'AEUN-21-EK1',
    },
    '4g3j4qv9': {
      'ru': 'АЮРП-20 ',
      'en': 'AYURP-20',
    },
    '982pnswi': {
      'ru': 'АЮРП-21-ТИП1 ',
      'en': 'AYURP-21-TYPE1',
    },
    'wem9nctg': {
      'ru': 'БАПС-19-01 ',
      'en': 'BAPS-19-01',
    },
    '3ypeym34': {
      'ru': 'БАПС-20-01 ',
      'en': 'BAPS-20-01',
    },
    'mas2qnc3': {
      'ru': 'ББИ-19-01 ',
      'en': 'BBI-19-01',
    },
    'tjk0m0ni': {
      'ru': 'ББИ-20-01 ',
      'en': 'BBI-20-01',
    },
    'gtncs200': {
      'ru': 'ББИ-21-БА1 ',
      'en': 'BBI-21-BA1',
    },
    'ulixm5rk': {
      'ru': 'ББИ-22-БА1 ',
      'en': 'BBI-22-BA1',
    },
    'oz3yzqz2': {
      'ru': 'ББИ-23-БА1 ',
      'en': 'BBI-23-BA1',
    },
    '719bvybi': {
      'ru': 'БГУ-19-01 ',
      'en': 'BGU-19-01',
    },
    'x4b4nd43': {
      'ru': 'БПМ-21-1 ',
      'en': 'BPM-21-1',
    },
    '7iczqpc0': {
      'ru': 'БПМ-22-1 ',
      'en': 'BPM-22-1',
    },
    '8peiryiw': {
      'ru': 'БПМ-20-01 ',
      'en': 'BPM-20-01',
    },
    'u0j92vgf': {
      'ru': 'Выберите группу',
      'en': 'Choose a group',
    },
    'dkjupltd': {
      'ru': 'Найти...',
      'en': 'Find...',
    },
    'lkuu29sv': {
      'ru': 'Это поле не может быть пустым',
      'en': 'This field cannot be empty',
    },
    'nd4inf2j': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'qq3nmmv9': {
      'ru': 'Это поле не может быть пустым',
      'en': 'This field cannot be empty',
    },
    '8p1bejno': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'zzfra36q': {
      'ru': 'Сохранить',
      'en': 'Save',
    },
    'zdi6d13j': {
      'ru': 'ХАБУС',
      'en': 'HABUS',
    },
    '7pbxg9u4': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // UserStatusRoleChangePage
  {
    'li8lvkea': {
      'ru': 'Изменить статус и роль',
      'en': 'Change status and role',
    },
    'aubu6nea': {
      'ru':
          'Измените свой статус или роль. Например, если Вы перешли на новую ступень обучения',
      'en':
          'Change your status or role. For example, if you have moved to a new level of education',
    },
    'wq6qah20': {
      'ru': 'Статус',
      'en': 'Status',
    },
    'bir5g1y7': {
      'ru': '',
      'en': '',
    },
    'vd7ef799': {
      'ru': 'Роль',
      'en': 'Role',
    },
    '6yv7is4l': {
      'ru': 'Абитуриент',
      'en': 'Enrollee',
    },
    '97rdttuo': {
      'ru': 'Студент',
      'en': 'Student',
    },
    'z9c64lqb': {
      'ru': 'Магистрант',
      'en': 'Master student',
    },
    'ke5oxfm5': {
      'ru': 'Аспирант',
      'en': 'Graduate student',
    },
    '0ps21qm1': {
      'ru': 'Лаборант',
      'en': 'laboratory assistant',
    },
    'hza00ov0': {
      'ru': 'Докторант',
      'en': 'PhD student',
    },
    'gsotmjy4': {
      'ru': 'Преподаватель',
      'en': 'Teacher',
    },
    'b57xtr98': {
      'ru': 'Выберите роль',
      'en': 'Choose a role',
    },
    '151qmadc': {
      'ru': 'Найти...',
      'en': 'Find...',
    },
    '6qr19p6q': {
      'ru': 'Верность выбранной Вами роли будет проверена',
      'en': 'Your role will be verified',
    },
    '2tbo5o2c': {
      'ru': 'Field is required',
      'en': 'Field is required',
    },
    'egn9bihi': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'j56t6vx4': {
      'ru': 'Сохранить',
      'en': 'Save',
    },
    'rf8yek63': {
      'ru': 'ХАБУС',
      'en': 'HABUS',
    },
    'esyau2pe': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // GetHelpPage
  {
    'n586r3qw': {
      'ru': 'Связаться с техподдержкой',
      'en': 'Contact technical support',
    },
    'xbzaoh20': {
      'ru': 'Расскажите, что случилось - а мы постараемся помочь',
      'en': 'Tell us what happened - and we will try to help',
    },
    'rq8titgd': {
      'ru': 'Опишите проблему',
      'en': 'Describe the problem',
    },
    'y5f7l50e': {
      'ru': '',
      'en': '',
    },
    'g80ck5es': {
      'ru': 'Написать...',
      'en': 'Write...',
    },
    'we8qtnq4': {
      'ru': 'Поле не может быть пустым',
      'en': 'The field cannot be empty',
    },
    'guwl8mfb': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'bwgfe8eh': {
      'ru': 'Отправить',
      'en': 'Send',
    },
    'dvxyy39m': {
      'ru': 'ХАБУС',
      'en': 'HABUS',
    },
    'yu3ykh0z': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // SendErrorPage
  {
    'bp3iflu0': {
      'ru': 'Сообщить об ошибке',
      'en': 'Report a bug',
    },
    '440yl1j2': {
      'ru':
          'Сообщите нам об ошибке, с которой Вы столкнулись и в новых обновлениях она будет исправлена... по крайней мере мы постараемся',
      'en':
          'Let us know about the bug you encountered and it will be fixed in new updates... at least we will try',
    },
    '2d4aqzpj': {
      'ru': 'Опишите ошибку',
      'en': 'Describe the error',
    },
    'hdgabe4j': {
      'ru': '',
      'en': '',
    },
    'wk1av5qx': {
      'ru': 'Написать...',
      'en': 'Write...',
    },
    '6pix6gqm': {
      'ru': 'Поле не может быть пустым',
      'en': 'The field cannot be empty',
    },
    '4zg8zs5o': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'fu807djb': {
      'ru': 'Отправить',
      'en': 'Send',
    },
    'xdbtgu14': {
      'ru': 'ХАБУС',
      'en': 'HABUS',
    },
    '2z9aso9d': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // SuggestImprovementPage
  {
    'zc3tcmef': {
      'ru': 'Предложить улучшение',
      'en': 'Suggest improvement',
    },
    '9q36tqf0': {
      'ru':
          'Расскажите нам, что бы Вы хотели видеть в приложении. Мы подумаем как это реализовать',
      'en':
          'Tell us what you would like to see in the application. We will consider how to implement it',
    },
    'gfc3dmfe': {
      'ru': 'Опишите предложение',
      'en': 'Describe the offer',
    },
    'dinbgzny': {
      'ru': '',
      'en': '',
    },
    'aod06z1m': {
      'ru': 'Написать...',
      'en': 'Write...',
    },
    'e5jejdls': {
      'ru': 'Поле не может быть пустым',
      'en': 'The field cannot be empty',
    },
    'sgorekom': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'sf0j26xw': {
      'ru': 'Отправить',
      'en': 'Send',
    },
    '86ohm5y6': {
      'ru': 'ХАБУС',
      'en': 'HABUS',
    },
    'gn2doft6': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // SettingsPage
  {
    'gmugfv7s': {
      'ru': 'Личный кабинет ВВГУ',
      'en': 'VVGU personal account',
    },
    'cxha4mwz': {
      'ru': 'Мой профиль',
      'en': 'My profile',
    },
    't4tpi12q': {
      'ru': 'Главная',
      'en': 'home',
    },
    'g1x5fhqw': {
      'ru': 'Создать сообщество',
      'en': 'Create a Community',
    },
    '4yajvw0t': {
      'ru': 'Создать чат',
      'en': 'Create a chat',
    },
    'fa9c8wrt': {
      'ru': 'Настройки',
      'en': 'Settings',
    },
    '2jxl5sa1': {
      'ru': 'Выйти',
      'en': 'Go out',
    },
    'vlqwp1jl': {
      'ru': '1.0beta_build',
      'en': 'Version 1.0beta_build',
    },
    'zkqjefdj': {
      'ru': 'habus.tech@yandex.ru',
      'en': 'habus.tech@yandex.ru',
    },
    'l0pj0ouz': {
      'ru': 'Настройки',
      'en': 'Report a bug',
    },
    'zgufdj5e': {
      'ru': 'Информация о профиле',
      'en': 'Profile information',
    },
    'pzghgx3i': {
      'ru': 'Изменить',
      'en': 'Change',
    },
    '14j3vntp': {
      'ru': 'Оформление и уведомления',
      'en': 'Registration and notices',
    },
    'k9mnu9po': {
      'ru': 'Изменить тему',
      'en': 'Change Theme',
    },
    'k09teg5o': {
      'ru': 'Изменить тему',
      'en': 'Change Theme',
    },
    'xpcs6vtk': {
      'ru': 'Уведомления',
      'en': 'Notifications',
    },
    'uwedsw03': {
      'ru': 'Изменить фото профиля',
      'en': 'Change profile photo',
    },
    'wphw62fv': {
      'ru': 'Изменить статус или роль',
      'en': 'Change status or role',
    },
    '05stdfdg': {
      'ru': 'Сменить язык',
      'en': 'Change language',
    },
    'sswb7zrt': {
      'ru': 'Безопасность и связь',
      'en': 'Security and Communication',
    },
    'nnhoklz9': {
      'ru': 'Сменить пароль',
      'en': 'Change password',
    },
    'zyn7cc4w': {
      'ru': 'Связаться с поддержкой',
      'en': 'Contact support',
    },
    '9fkhp7dz': {
      'ru': 'Сообщить об ошибке',
      'en': 'Report a bug',
    },
    '8bv4pv4d': {
      'ru': 'Предложить улучшение',
      'en': 'Suggest improvement',
    },
    'qkbt13rq': {
      'ru': 'Привязка',
      'en': 'Binding',
    },
    'udm88aq9': {
      'ru': 'Привязать ЛК ВВГУ',
      'en': 'Bind LK VVGU',
    },
    '8mjwfu04': {
      'ru': 'Выйти',
      'en': 'Go out',
    },
    'bksk4t6i': {
      'ru': '1.0beta_build',
      'en': 'Version 1.0beta_build',
    },
    'ggk3m7ae': {
      'ru': 'ХАБУС',
      'en': 'HABUS',
    },
    'ab0hcdhe': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // ConnectPAPage
  {
    'krz84k1o': {
      'ru': 'Привязав личный кабинет ВВГУ, Вы сможете:',
      'en': 'Error :(',
    },
    '4byu4jzp': {
      'ru': 'Смотреть расписание и баллы',
      'en': '',
    },
    'fet4ngya': {
      'ru': 'Привязать свой пропуск через NFC',
      'en': '',
    },
    'bapshvru': {
      'ru': 'Оплачивать расходы в одно нажатие',
      'en': '',
    },
    'a9v4riq7': {
      'ru': 'Следить за своей учебной активностью',
      'en': '',
    },
    'dopbemda': {
      'ru': 'И многое другое',
      'en': '',
    },
    'd9x7t45n': {
      'ru': 'Но...',
      'en': 'Error :(',
    },
    'z2melx0r': {
      'ru': 'Смена кафедры и группы станет недоступна',
      'en': '',
    },
    'bb4nj7vm': {
      'ru': 'Вход в приложение будет осуществляться через логин и пароль от ЛК',
      'en': '',
    },
    'cfr5ehtp': {
      'ru': 'Привязать',
      'en': 'Back',
    },
    'gc49o3zd': {
      'ru': 'ХАБУС',
      'en': 'HABUS',
    },
    '2k4kmt4r': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // UserProfilePage
  {
    'bpx96zxo': {
      'ru': 'Мой профиль',
      'en': 'Report a bug',
    },
    'ibqwonm0': {
      'ru': '0 друзей',
      'en': '',
    },
    'q1dxd720': {
      'ru': '0 постов',
      'en': '',
    },
    'da7qiecv': {
      'ru': '0 опросов',
      'en': '',
    },
    'g9q1cucd': {
      'ru': 'Мои посты',
      'en': '',
    },
    'if4mgc3q': {
      'ru': 'Делись с нами своими мыслями',
      'en': '',
    },
    'q6yw1dky': {
      'ru': 'Делись с нами моментами и историями из своей студенческой жизни',
      'en': '',
    },
    'w32l3ovl': {
      'ru': 'Создать запись',
      'en': 'Create a survey',
    },
    'bma0dpy3': {
      'ru': '[имя пользователя]',
      'en': '',
    },
    'pmldhdac': {
      'ru': '2h',
      'en': '',
    },
    '6s58576r': {
      'ru': '[текст]',
      'en': '',
    },
    'qyaanbuf': {
      'ru': '4',
      'en': '',
    },
    'r90wrevj': {
      'ru': '4',
      'en': '',
    },
    '9avud5zd': {
      'ru': 'Сожалеем, но это все Ваши записи :(',
      'en': '',
    },
    'plc1i58r': {
      'ru': 'Мои опросы',
      'en': '',
    },
    'b3sykfub': {
      'ru': 'Здесь храняться Ваши опросы',
      'en': '',
    },
    '3bd4wn4r': {
      'ru':
          'Создать опрос можно на главном экране в разделе \"Опросы\". После создания, все Ваши опросы будут отображаться здесь',
      'en': '',
    },
    '9c1at12i': {
      'ru': 'От ',
      'en': '',
    },
    'p2abc5sm': {
      'ru': '0',
      'en': '',
    },
    '6gnrm7s4': {
      'ru': '0',
      'en': '',
    },
    'eqa6u60l': {
      'ru': 'Сожалеем, но это все записи :(',
      'en': '',
    },
    'k77mfbgd': {
      'ru': 'Статистика',
      'en': '',
    },
    'gotctnen': {
      'ru': '0 опросов',
      'en': '',
    },
    'zf9zi86j': {
      'ru': 'вы прошли за всё время',
      'en': '',
    },
    '4nnz1xly': {
      'ru': '0 лайков',
      'en': '',
    },
    'xav71vl8': {
      'ru': 'вы поставили за всё время',
      'en': '',
    },
    '7g3bo4rp': {
      'ru': '0 коммент.',
      'en': '',
    },
    'turk31nc': {
      'ru': 'вы оставили за всё время',
      'en': '',
    },
    'yuerpguh': {
      'ru': '0 записей',
      'en': '',
    },
    'mrfd3y4l': {
      'ru': 'вы создали за всё время',
      'en': '',
    },
    'a13v2ds0': {
      'ru': '0 опросов',
      'en': '',
    },
    'tunopj80': {
      'ru': 'вы создали за всё время',
      'en': '',
    },
    'qrl4teic': {
      'ru': '0 опросов',
      'en': '',
    },
    '7toow67l': {
      'ru': 'вы прошли за всё время',
      'en': '',
    },
    'gxfyaoy7': {
      'ru': 'Достижения',
      'en': '',
    },
    'ndrourgs': {
      'ru': 'Архивариус',
      'en': '',
    },
    '8mxsafyo': {
      'ru': 'пройти 10 опросов',
      'en': '',
    },
    'ctw2kl2y': {
      'ru': 'Любитель',
      'en': '',
    },
    'wf7v835z': {
      'ru': 'оценить 50 записей',
      'en': '',
    },
    'ptchk0dp': {
      'ru': 'Комментатор',
      'en': '',
    },
    'ccsvouzy': {
      'ru': 'оставить 100 комментариев',
      'en': '',
    },
    '0k9g6r6o': {
      'ru': 'Великий',
      'en': '',
    },
    '4gtaqr2k': {
      'ru': 'закрыть сессию на 5',
      'en': '',
    },
    'f4uyue9q': {
      'ru': 'Закрыто',
      'en': '',
    },
    'tzw1f450': {
      'ru': 'достижение закрыто',
      'en': '',
    },
    'w8nutfuh': {
      'ru': 'ХАБУС',
      'en': 'HABUS',
    },
    'bvuw1y7k': {
      'ru': 'Home',
      'en': '',
    },
  },
  // HABUSFormWebView
  {
    '9lg31bpq': {
      'ru': 'ХАБУС',
      'en': 'HABUS',
    },
    'ojcxzf5n': {
      'ru': 'Home',
      'en': '',
    },
  },
  // FormWebViewPage
  {
    't0qwb7jj': {
      'ru': 'ХАБУС',
      'en': 'HABUS',
    },
    'oa8l1gsf': {
      'ru': 'Home',
      'en': '',
    },
  },
  // ThemeChanger
  {
    'sybzx9sh': {
      'ru': 'Выберите тему',
      'en': 'Choose a theme',
    },
    '5gbmuwc6': {
      'ru': 'Измените тему приложения, выбрав одну из приведённых ниже',
      'en': 'Change the app theme by choosing one of the following',
    },
    'h89ocx7n': {
      'ru': 'Сила тьмы',
      'en': 'The power of darkness',
    },
    'xm5id7eu': {
      'ru': 'Сила света',
      'en': 'The power of light',
    },
    '3ycu9xr4': {
      'ru': 'Назад',
      'en': 'Back',
    },
    'sa1yvmt5': {
      'ru': 'Сохранить',
      'en': 'Save',
    },
  },
  // LanguageChanger
  {
    'vhviesuz': {
      'ru': 'Выберите язык',
      'en': 'Choose language',
    },
    '64q48oej': {
      'ru': 'Смените язык приложения, выбрав один из приведённых ниже',
      'en':
          'Change the language of the application by choosing one of the following',
    },
    'is9iqx21': {
      'ru': 'Русский',
      'en': 'Russian',
    },
    '4b7isyzi': {
      'ru': 'English',
      'en': 'English.',
    },
    'ws8twq2u': {
      'ru': 'Назад',
      'en': 'Back',
    },
    'wtlf2o4j': {
      'ru': 'Сохранить',
      'en': 'Save',
    },
  },
  // ChangerPhoto
  {
    '5rofu6wc': {
      'ru': 'Выберите фото',
      'en': 'Choose a photo',
    },
    'wo2n7czk': {
      'ru': 'Измените фото профиля, выбрав его из своей галереи',
      'en': 'Change your profile photo by selecting it from your gallery',
    },
    'sd3b81u6': {
      'ru': 'Назад',
      'en': 'Back',
    },
    'fhl6db3f': {
      'ru': 'Сохранить',
      'en': 'Save',
    },
  },
  // CreatePost
  {
    '6jt0bgls': {
      'ru': 'Создать запись',
      'en': '',
    },
    'kl0fe62c': {
      'ru': 'Поделитесь с нами своими мыслями',
      'en': '',
    },
    'qjumqekm': {
      'ru': 'Добавьте фото',
      'en': '',
    },
    'e50avtrc': {
      'ru': 'Добавьте сюда фото записи или оставьте пустым',
      'en': '',
    },
    '1i4sntn3': {
      'ru': 'Что у Вас нового?',
      'en': '',
    },
    '16w62cqp': {
      'ru': 'Создать',
      'en': '',
    },
    'aeeth8sv': {
      'ru': 'Field is required',
      'en': '',
    },
    'vopnjdfk': {
      'ru': 'Please enter a real name',
      'en': '',
    },
    '4ma4i3i8': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'scifrg5e': {
      'ru': 'Please enter a short desription',
      'en': '',
    },
    'mjjg6py9': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    '9urve5ng': {
      'ru': 'We have to have a URL for the project.',
      'en': '',
    },
    'ole2goz4': {
      'ru': 'Please enter a valid URL...',
      'en': '',
    },
    'o8wrolv7': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'dsyw04nd': {
      'ru': 'Field is required',
      'en': '',
    },
    '1jlhjlv3': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // CreateForm
  {
    'glcoyvnk': {
      'ru': 'Создать ',
      'en': '',
    },
    'whs7pe14': {
      'ru': 'опрос',
      'en': '',
    },
    'do3m14v7': {
      'ru': 'Озаглавьте, опишите, вставьте ссылку - а люди будут проходить!',
      'en': '',
    },
    'eo536b6w': {
      'ru': 'Введите заголовок',
      'en': '',
    },
    'frpazeqi': {
      'ru': 'Введите описание',
      'en': '',
    },
    'fv6tfosl': {
      'ru': 'Вставьте ссылку на опрос',
      'en': '',
    },
    'y2qmgkge': {
      'ru': 'Создать',
      'en': '',
    },
    '3kbrp9eq': {
      'ru': 'Field is required',
      'en': '',
    },
    'qqlkxqm9': {
      'ru': 'Please enter a real name',
      'en': '',
    },
    'z4r1p6w0': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'hgmdqi9r': {
      'ru': 'Please enter a short desription',
      'en': '',
    },
    'n900f6i8': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'bepsfxgl': {
      'ru': 'We have to have a URL for the project.',
      'en': '',
    },
    'egwqx4cs': {
      'ru': 'Please enter a valid URL...',
      'en': '',
    },
    'f1pd2qgp': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    '15japa26': {
      'ru': 'Field is required',
      'en': '',
    },
    'gs7ajaip': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // UpdateForm
  {
    'z4tslexu': {
      'ru': 'Изменить ',
      'en': '',
    },
    'l8tcx5vu': {
      'ru': 'опрос',
      'en': '',
    },
    'kz60s0n9': {
      'ru': 'Измените свой уже созданный опрос',
      'en': '',
    },
    '6vv2mh77': {
      'ru': 'Введите заголовок',
      'en': '',
    },
    'g1uy6vqg': {
      'ru': 'Введите описание',
      'en': '',
    },
    'fwhl1xgu': {
      'ru': 'Вставьте ссылку на опрос',
      'en': '',
    },
    'thfe6a39': {
      'ru': 'Изменить',
      'en': '',
    },
    'pw2mmgyu': {
      'ru': 'Field is required',
      'en': '',
    },
    'osz70xn7': {
      'ru': 'Please enter a real name',
      'en': '',
    },
    'fkd7ge5w': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    '0y8qmixk': {
      'ru': 'Please enter a short desription',
      'en': '',
    },
    'fp8st0jg': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'yh16u5ou': {
      'ru': 'We have to have a URL for the project.',
      'en': '',
    },
    'xqryf7v2': {
      'ru': 'Please enter a valid URL...',
      'en': '',
    },
    'n95jj5sj': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    '1uriyxgr': {
      'ru': 'Field is required',
      'en': '',
    },
    'f25vuwqe': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // DeleteForm
  {
    '88onsgbs': {
      'ru': 'Удалить ',
      'en': '',
    },
    'po1buiw5': {
      'ru': 'опрос',
      'en': '',
    },
    'yc6bwj4i': {
      'ru': 'Вы действительно хотите удалить опрос?',
      'en': '',
    },
    'q1498me3': {
      'ru': 'Удалить',
      'en': '',
    },
    'rygt4uwz': {
      'ru': 'Field is required',
      'en': '',
    },
    'kwetvr2l': {
      'ru': 'Please enter a real name',
      'en': '',
    },
    'onb43aq0': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'novpzq6w': {
      'ru': 'Please enter a short desription',
      'en': '',
    },
    'qnve749m': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'xjnje1wd': {
      'ru': 'We have to have a URL for the project.',
      'en': '',
    },
    'ugph96qp': {
      'ru': 'Please enter a valid URL...',
      'en': '',
    },
    'uke8ikki': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ych1nhx5': {
      'ru': 'Field is required',
      'en': '',
    },
    'c6kdpgqo': {
      'ru': 'Please choose an option from the dropdown',
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
