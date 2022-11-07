import 'package:bloc/bloc.dart';
import 'package:chairil/core/util/util.dart';
import 'package:chairil/data/database/location_box_repository.dart';
import 'package:chairil/data/database/store_box_repository.dart';
import 'package:chairil/domain/repository/login_repository.dart';
import 'package:chairil/ui/store_list/store_list_view.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  onLogin(String username, String password) async {
    var request = FormData.fromMap({
      'username': username,
      'password' : password
    });
    var data = await LoginRepository().login(request);
    if (data!.isNotEmpty) {
      StoreBoxRepository.save(data);
      var locationBox = await LocationBoxRepository.load();
      pushAndRemoveUntil(StoreListView(locationBox: locationBox), RouterType.material);
    }
  }
}
