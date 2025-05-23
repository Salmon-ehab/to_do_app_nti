import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/core/cache/cache_helper.dart';
import 'package:login_task_nti/feature/settings/presentation/manager/change_language_manager/change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial());
  static ChangeLanguageCubit get(context) => BlocProvider.of(context);
  Map<String, String> languages = {
    "English": "en",
    "Arabic": "ar",
  };

  void changeLanguageFromMenu(String lang) async {
    // await getIt<CacheHelper>().setCurrentLanguage(language: lang);
    // await getIt<CacheHelper>()
        .setCurrentLanguageCode(languageCode: languages[lang]!);
    emit(ChangeLanguageDone());
  }
}