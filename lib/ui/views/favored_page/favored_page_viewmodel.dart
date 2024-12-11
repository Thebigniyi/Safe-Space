import 'package:diary_project/services/diary_service.dart';
import 'package:diary_project/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class FavoredPageViewModel extends ReactiveViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _diaryService = locator<DiaryService>();

  List<DiaryEntry> get favoredEntries => _diaryService.favoredEntries;
  int get favoredEntrieLength => _diaryService.favoredEntries.length;

  void navigateBack() {
    _navigationService.back();
  }

  void archiveEntry(DiaryEntry entry) {
    _diaryService.addToArchieve(entry);
  }

  void removeEntry(DiaryEntry entry) {
    _diaryService.deleteFromList(entry);
  }

  void toggleFavorite(DiaryEntry entry) {
    _diaryService.toggleFavorite(entry);
    _diaryService.addToAndremoveFrom(entry);
  }

  void openText({DiaryEntry? entry}) {
    _navigationService.navigateTo(Routes.diaryTextView,
        arguments: DiaryTextViewArguments(entry: entry));
  }
}
