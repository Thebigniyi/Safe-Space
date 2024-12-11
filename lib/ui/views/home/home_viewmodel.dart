import 'package:another_flushbar/flushbar.dart';
import 'package:diary_project/app/app.bottomsheets.dart';
import 'package:diary_project/app/app.dialogs.dart';
import 'package:diary_project/app/app.locator.dart';
import 'package:diary_project/app/app.router.dart';
import 'package:diary_project/services/diary_service.dart';
import 'package:diary_project/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _diaryService = locator<DiaryService>();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final GlobalKey _buttonKey = GlobalKey();

  final initialLetter = "";
  String delete = "";
  String archive = "";

  void navigateToLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }

  List<DiaryEntry> get entries => _diaryService.entries;
  int get entriesLength => _diaryService.entries.length;
  List<DiaryEntry> get entriesArchieve => _diaryService.entriesArchieve;

  void openText({DiaryEntry? entry}) {
    _navigationService.navigateTo(Routes.diaryTextView,
        arguments: DiaryTextViewArguments(entry: entry));
  }

  void navigateToProfile() {
    _navigationService.navigateTo(Routes.profileView);
  }

  void navigateToArchieve() {
    _navigationService.navigateTo(Routes.archievePageView);
  }

  void navigateToFavorPage() {
    _navigationService.navigateTo(Routes.favoredPageView);
  }

  void toggleFavorite(DiaryEntry entry) {
    _diaryService.toggleFavorite(entry);
    _diaryService.addToAndremoveFrom(entry);
  }

  void removeEntry(
    DiaryEntry entry,
  ) {
    _diaryService.deleteFromList(entry);
    notifyListeners();
  }

  void archieveEntry(DiaryEntry entry) {
    _diaryService.addToArchieve(entry);
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }



  @override
  List<ListenableServiceMixin> get listenableServices => [_diaryService];
}

class DiaryEntry {
  String title;
  String content;
  DateTime date;
  bool isfavorite;

  DiaryEntry(
      {required this.title,
      required this.content,
      required this.date,
      this.isfavorite = false});
}
