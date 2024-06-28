
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tiktok_clone/tweeter/features/settings/view_models/darkmode_config_vm.dart';

bool isDarkMode(WidgetRef ref) => ref.watch(darkModeConfigProvider).isDarkMode;
