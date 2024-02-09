import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_router_riverpod/entities/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

const _dummyUser = Auth.signedIn(
  id: -1,
  displayName: 'Test User',
  email: 'メールアドレス',
  token: 'トークン',
);

@riverpod
class AuthController extends _$AuthController {
  late SharedPreferences _sharedPreferences;
  static const _sharedPrefsKey = 'token';

  @override
  Future<Auth> build() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _persistenceRefreshLogic();
    return _loginRecoveryAttemt();
  }

  // 永続ストレージに保存されたトークンを使用してログインを試行する。
  // 何か問題が発生した場合は、内部トークンを削除し、[User.signedOut] を返す。
  Future<Auth> _loginRecoveryAttemt() {
    try {
      final savedToken = _sharedPreferences.getString(_sharedPrefsKey);
      if (savedToken == null) throw const UnauthorizedException('トークンがありません');

      return _loginwithToken(savedToken);
    } catch (_, __) {
      _sharedPreferences.remove(_sharedPrefsKey).ignore();
      return Future.value(const Auth.signedOut());
    }
  }

  // ログアウト時に実行されるリクエストのモック
  Future<void> logout() async {
    await Future.delayed(networkRoundTripTime);
    state = const AsyncData(Auth.signedOut());
  }

// 成功したログイン試行のモック。結果はネットワークから取得される。
  Future<void> login(String email, String password) async {
    final result = await Future.delayed(
      networkRoundTripTime,
      () => _dummyUser,
    );
    state = AsyncData(result);
  }

// 保存されたトークンを使用して実行されるログイン リクエストのモック。
// そのようなリクエストが失敗した場合、このメソッドは [UnauthorizedException] をスローします。
  Future<Auth> _loginwithToken(String token) async {
    final logInAttempt = await Future.delayed(
      networkRoundTripTime,
      () => true,
    );
    if (logInAttempt) return _dummyUser;

    throw UnsupportedError('401有効な認証資格が不足しています');
  }

  /// 認証状態の変更をリッスンするために使用される内部メソッド。
  /// 認証オブジェクトが読み込み中の状態では何も起こりません。
  /// 認証オブジェクトがエラー状態にある場合、トークンを削除することを選択します
  /// それ以外の場合は、現在の認証値が永続性 API に反映されることが期待されます。
  void _persistenceRefreshLogic() {
    ref.listenSelf((_, next) {
      if (next.isLoading) return;
      if (next.hasError) {
        _sharedPreferences.remove(_sharedPrefsKey);
        return;
      }

      next.requireValue.map<void>(
        signedIn: (signedIn) =>
            _sharedPreferences.setString(_sharedPrefsKey, signedIn.token),
        signedOut: (signedOut) {
          _sharedPreferences.remove(_sharedPrefsKey);
        },
      );
    });
  }
}

// 401エラーのモック
class UnauthorizedException implements Exception {
  const UnauthorizedException(this.message);
  final String message;
}

// ネットワークリクエストの期間のモック
final networkRoundTripTime = 2.seconds;
