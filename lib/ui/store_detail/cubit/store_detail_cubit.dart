import 'package:bloc/bloc.dart';
import 'package:chairil/core/app/app.dart';
import 'package:chairil/core/util/util.dart';
import 'package:chairil/data/database/store_box.dart';
import 'package:chairil/data/database/store_box_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'store_detail_state.dart';

class StoreDetailCubit extends Cubit<StoreDetailState> {
  StoreDetailCubit() : super(StoreDetailInitial());

  onVisit(int index, StoreBox storeBox) async {
    StoreBox storeBoxNew = storeBox;
    storeBoxNew.lastVisit = DateFormat.yMd().add_jm().format(DateTime.now());
    StoreBoxRepository.update(index, storeBoxNew);

    CoreFunction.showToast("Berhasil Visit", backgroundColor: ColorPalette.green);
    Future.delayed(const Duration(seconds: 1), (){
      // Navigator.of(navGK.currentContext!).pop();
      Navigator.of(navGK.currentContext!).pop(1);
    });
  }

}
