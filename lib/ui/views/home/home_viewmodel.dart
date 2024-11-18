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

  void toggleFavorite(DiaryEntry entry) {
    _diaryService.toggleFavorite(entry);
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

  void popUpButton(BuildContext context, entry) {
    final RenderBox button = _buttonKey.currentContext!
        .findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context)!.context
        .findRenderObject() as RenderBox;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(
            button.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showMenu(
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          value: Text(delete),
          child: const Text('Delete'),
          onTap: () => removeEntry(entry),
        ),
        PopupMenuItem(
          value: Text(archive),
          child: const Text('Archive'),
          onTap: () => navigateToArchieve(),
        ),
      ],
    );
  }
  @override
  List<ListenableServiceMixin> get listenableServices => [_diaryService];


  void showTopNotification(BuildContext context, String message) {
    Flushbar(
      message: message,
      messageSize: 20.0,
      margin: const EdgeInsets.all(8.0),
      padding: EdgeInsets.all(10.0),
      borderRadius: BorderRadius.circular(15.0),
      backgroundColor: Colors.black87,
      icon: const Icon(
        Icons.info,
        color: Colors.white,
      ),
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }



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
