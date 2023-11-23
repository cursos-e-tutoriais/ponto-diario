import 'package:bloc/bloc.dart';
import 'package:ponto_diario/app/modules/splash/splash_state.dart';
import 'package:ponto_diario/app/repositories/splash_repository.dart';

class SplashController extends Cubit<SplashState> {
  final SplashRepository splashRepository;

  SplashController({required this.splashRepository}) : super(SplashInitial());

  Future<void> checkIfIsLogged() async {
    emit(SplashLoading());
    final isLogged = await splashRepository.checkIfIsLogged();
    emit(SplashLoaded(isLogged: isLogged));
  }
}
