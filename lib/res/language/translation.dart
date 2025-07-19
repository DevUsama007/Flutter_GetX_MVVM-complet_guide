import 'package:get/get.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'Name': 'Usama Basharat',
          'changeBTNE': "English",
          'changeBTNU': "اردو ",
          'themeChanger': 'Change the Theme',
          'items_list': 'Items List'
        },
        'ur_PK': {
          'Name': 'اسامھ بشارت',
          'changeBTNE': 'English',
          'changeBTNU': 'اردو ',
          'themeChanger': 'رنگ کہ بدلے',
          'items_list': 'اشیاء کی فہرست',
        }
      };
}
