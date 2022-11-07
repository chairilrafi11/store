import 'package:bloc/bloc.dart';
import 'package:chairil/core/data/model/strores.dart';
import 'package:chairil/data/database/store_box.dart';
import 'package:chairil/data/database/store_box_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'store_list_state.dart';

class StoreListCubit extends Cubit<StoreListState> {
  StoreListCubit() : super(StoreListLoading()){
    onFetchData();
  }

  Future onFetchData() async {
    emit(StoreListLoading());
    List<StoreBox> listStore = await StoreBoxRepository.load();
    List<Marker> listMarker = [];
    for (var element in listStore) {
      
      listMarker.add(Marker(
        infoWindow: InfoWindow( 
          title: element.storeName,
          snippet: "Kode Outlet ${element.storeCode}",
        ),
        markerId: MarkerId(element.storeId ?? ''), 
        position: LatLng(double.parse(element.latitude.toString()), double.parse(element.longitude.toString())),
        // icon: BitmapDescriptor.fromBytes(customMarker)
      ));
    }
    emit(StoreListLoaded(listStore: listStore, listMarker: listMarker));
  }
  
}
