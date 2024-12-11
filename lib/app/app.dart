import 'package:diary_project/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:diary_project/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:diary_project/ui/views/home/home_view.dart';
import 'package:diary_project/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:diary_project/ui/views/login/login_view.dart';
import 'package:diary_project/ui/views/sign_up/sign_up_view.dart';
import 'package:diary_project/ui/views/email_confirmation/email_confirmation_view.dart';
import 'package:diary_project/ui/views/otp_verification/otp_verification_view.dart';
import 'package:diary_project/ui/views/diary_text/diary_text_view.dart';
import 'package:diary_project/services/diary_service.dart';
import 'package:diary_project/ui/views/profile/profile_view.dart';
import 'package:diary_project/services/dairy_profile_service.dart';
import 'package:diary_project/ui/views/edit_profile/edit_profile_view.dart';
import 'package:diary_project/ui/views/archieve_page/archieve_page_view.dart';
import 'package:diary_project/ui/views/favored_page/favored_page_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: EmailConfirmationView),
    MaterialRoute(page: OtpVerificationView),
    MaterialRoute(page: DiaryTextView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: EditProfileView),
    MaterialRoute(page: ArchievePageView),
    MaterialRoute(page: FavoredPageView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DiaryService),
    LazySingleton(classType: DairyProfileService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
