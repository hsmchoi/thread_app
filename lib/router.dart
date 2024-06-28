import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/tweeter/features/activity/activity_screen_tweet.dart';
import 'package:tiktok_clone/tweeter/features/navbar/screens/tiktok_home_screen.dart';
import 'package:tiktok_clone/tweeter/features/privacy/privacy_screen_tweet.dart';
import 'package:tiktok_clone/tweeter/features/profile/profile_tweet_screen.dart';
import 'package:tiktok_clone/tweeter/features/search/search_screen_tweet.dart';
import 'package:tiktok_clone/tweeter/features/settings/views/settings_screen_tweet.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const TiktokHomeScreen(),
    ),
    GoRoute(
      path: "/search",
      builder: (context, state) => const SearchScreenTweet(),
    ),
    GoRoute(
      path: "/activity",
      builder: (context, state) => const ActivityScreenTweet(),
    ),
    GoRoute(
      path: "/profile",
      builder: (context, state) => const ProfileTweetScreen(),
    ),
    GoRoute(
      path: "/settings",
      builder: (context, state) => const SettingsScreenTweet(),
    ),
    GoRoute(
      path: "/settings/privacy",
      builder: (context, state) => const PrivacyScreenTweet(),
    ),
  ],
);


// Building upon the work from the previous assignment, migrate the app to use GoRouter.
// The navigation of your apps should now work using URLs. This means your app should be able to navigate using the following URLs:
// 이전 과제에서 수행한 작업을 기반으로 앱을 마이그레이션하여 GoRouter를 사용하도록 합니다.
// 이제 앱의 탐색이 URL을 사용하여 작동해야 합니다. 이것은 앱이 다음 URL을 사용하여 탐색할 수 있어야 함을 의미합니다.
// /: Home Screen
// /search: Search Screen
// /activity: Activity Screen
// /profile: Profile Screen
// /settings: Settings Screen
// /settings/privacy: Privacy Screen
// you can leave the Write Screen as it is.
// 쓰기 화면은 그대로 두셔도 됩니다.