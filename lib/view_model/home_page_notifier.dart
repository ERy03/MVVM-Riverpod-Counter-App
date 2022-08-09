import 'package:counter_app/model/home_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageNotifier extends StateNotifier<HomePageState> {
  HomePageNotifier() : super(const HomePageState());

  // なぜasync？
  void increaseMainCount() async {
    state = state.copyWith(mainCount: state.mainCount + 1);
  }

  void increaseSubCount() async {
    state = state.copyWith(subCount: state.subCount + 1);
  }

  void resetAllCount() async {
    state = state.copyWith(
      mainCount: 0,
      subCount: 0,
    );
  }
}

// ここわからない
// StateNotifierProviderって何？
//　UIがHomePageNotifierクラスと対話できるようになる
// autoDisposeって何？
// 参照されなくなったプロバイダのステートを破棄する。不必要な負荷を避けたり、ステートをリセットしてデータ取得をやり直すためなどに使用。

final homePageProvider =
    StateNotifierProvider.autoDispose<HomePageNotifier, HomePageState>(
  (ref) => HomePageNotifier(),
);
