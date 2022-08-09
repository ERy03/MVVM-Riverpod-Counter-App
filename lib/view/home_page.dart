import 'package:counter_app/view_model/home_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // わからん
    final _homePageState = ref.watch(homePageProvider);

    // わからん
    final _homePageNotifier = ref.read(homePageProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter MVVM + Riverpod counter')),
      floatingActionButton: FloatingActionButton(
        onPressed: _homePageNotifier.resetAllCount,
        child: const Icon(Icons.exposure_zero),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Main Count: ${_homePageState.mainCount}'),
            onTap: _homePageNotifier.increaseMainCount,
          ),
          ListTile(
            title: Text('Sub Count: ${_homePageState.subCount}'),
            onTap: _homePageNotifier.increaseSubCount,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SelectableText(
                  'メモ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 12),
                SelectableText(
                  'アプリ内容',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                SizedBox(height: 12),
                SelectableText(
                    'MainCout, SubCountをタップすると+1。右下のFABをタップすると値を0にリセットする。'),
                SizedBox(height: 12),
                SelectableText(
                  '使用したパッケージ',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                SizedBox(height: 12),
                SelectableText('・flutter_riverpod: ^1.0.4'),
                SizedBox(height: 6),
                SelectableText('・freezed: ^2.1.0+1'),
                SizedBox(height: 6),
                SelectableText('・freezed_annotation: ^2.1.0'),
                SizedBox(height: 6),
                SelectableText('・build_runner: ^2.2.0'),
                SizedBox(height: 6),
                SizedBox(height: 12),
                SelectableText(
                  'アプリを作る流れ',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                SizedBox(height: 12),
                SelectableText(
                    '➀ freezedを使ったModelの作成\nHomePageStateクラスを定義(デフォルト値が0のmainCountとsubCount)\nfreezed用のコマンドを実行"flutter pub run build_runner watch --delete-conflicting-outputs"\n※freezedを使用してデータを保持するimmutableなクラスを作成できる'),
                SizedBox(height: 6),
                SelectableText(
                    '➁ ViewModelの作成(home_page_notifier)\nHomePageNotifierというクラスがStateNotifier<HomePageState>をextendする\nメインカウントとサブカウントを+1するメソッド、全てのカウントを0にするメソッドを作成\n"state = "を呼ぶことで必要な時にUIを自動的にリビルドする\nStateNotifierProviderを使ってHomePageNotifierの状態を管理。autoDisposeは参照されなくなったプロバイダのステートを破棄する(不必要な負荷を避けたり、ステートをリセットしてデータ取得をやり直すためなどに使用)\n※StateNotifierProviderでUIがHomePageNotifierクラスと対話できるようになる'),
                SizedBox(height: 6),
                SelectableText(
                    '➂ viewの作成\nref.watch(homePageProvider)でhomePageProviderのステートを取得\nref.read(homePageProvider.notifier)にStateNotifierで定義したメソッドを使用してステートを変更する。'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
