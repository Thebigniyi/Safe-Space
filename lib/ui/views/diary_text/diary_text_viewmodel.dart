import 'package:diary_project/app/app.locator.dart';
import 'package:diary_project/services/diary_service.dart';
import 'package:diary_project/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.router.dart';

class DiaryTextViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _navigatorService = locator<NavigationService>();
  final _diaryService = locator<DiaryService>();

  List<DiaryEntry> get entries => _diaryService.entries;

  void initState(DiaryEntry? entry) {
    title.text = entry?.title ?? "";
    subTitle.text = entry?.content ?? "";
  }

  //To navigate back on appBar
  void back() {
    _navigatorService.back();
  }

  void saveDiary() {
    _diaryService.addToList(DiaryEntry(
        title: title.text, content: subTitle.text, date: DateTime.now()));
    _navigatorService.back();
  }

  void editDiary() {
    final newEntry = DiaryEntry(
        title: title.text, content: subTitle.text, date: DateTime.now());
    _diaryService.editEntry(newEntry);
    _navigatorService.clearTillFirstAndShow(Routes.homeView);
  }

//Controller for Textformfield
  TextEditingController title = TextEditingController();
  TextEditingController subTitle = TextEditingController();
}
