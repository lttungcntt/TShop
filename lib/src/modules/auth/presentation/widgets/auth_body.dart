part of '../pages/auth_page.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {},
          error: (error) => context.showError(error.toString()),
        );
      },
      builder: (context, state) {
        return FlutterLogin(
          title: context.s.common_login,
          onLogin: (data) async {
            await _authUser(context, data);
            return state.maybeWhen(
              authenticated: (user) => null,
              error: (error) => error.toString(),
              orElse: () => 'Error',
            );
          },
          onRecoverPassword: (p0) {
            return null;
          },
          loginProviders: [
            LoginProvider(
              icon: FontAwesomeIcons.apple,
              callback: () {
                return null;
              },
            ),
            LoginProvider(
              icon: FontAwesomeIcons.facebookF,
              callback: () {
                return null;
              },
            ),
            LoginProvider(
              icon: FontAwesomeIcons.google,
              callback: () {
                return null;
              },
            )
          ],
        );
      },
    );
  }

  Future<void> _authUser(BuildContext context, LoginData data) async {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    await context
        .read<AuthCubit>()
        .login(LoginRequest(email: data.name, password: data.password));
  }
}
