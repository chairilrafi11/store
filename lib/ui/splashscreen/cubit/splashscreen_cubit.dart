import 'package:bloc/bloc.dart';
import 'package:chairil/core/usecase/location_usecase.dart';
import 'package:chairil/data/database/store_box_repository.dart';
import 'package:chairil/ui/login/view/login_view.dart';
import 'package:chairil/ui/store_list/store_list_view.dart';
import 'package:equatable/equatable.dart';
import 'package:chairil/core/util/util.dart';
part 'splashscreen_state.dart';

class SplashscreenCubit extends Cubit<SplashscreenState> {
  
  SplashscreenCubit() : super(SplashscreenInitial()){
    checkSessions();
  }

  Future checkSessions() async {
    var location = await LocationUsecase().getLocation();
    bool? isEmpty = await StoreBoxRepository.isEmpty();
    if (isEmpty ?? false) {
      pushAndRemoveUntil(const LoginView(), RouterType.material);
    } else {
      pushAndRemoveUntil(StoreListView(locationBox: location), RouterType.material);
    }
  }

}
