import 'dart:async';

import 'package:chairil/core/app/app.dart';
import 'package:chairil/core/util/util.dart';
import 'package:chairil/data/database/location_box.dart';
import 'package:chairil/data/database/store_box_repository.dart';
import 'package:chairil/ui/component/component.dart';
import 'package:chairil/ui/login/view/login_view.dart';
import 'package:chairil/ui/store_detail/store_detail_view.dart';
import 'package:chairil/ui/store_list/cubit/store_list_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class StoreListView extends StatefulWidget {

  final LocationBox locationBox;

  const StoreListView({Key? key, required this.locationBox}) : super(key: key);

  @override
  State<StoreListView> createState() => _StoreListViewState();
}

class _StoreListViewState extends State<StoreListView> {

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreListCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalette.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Component.textBold("List Store"),
          actions: [
            GestureDetector(   
              onTap: (){
                StoreBoxRepository.clear();
                pushAndRemoveUntil(const LoginView(), RouterType.material);
              }, 
              child: Card(
                color: ColorPalette.red,
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  child: Component.textBold("Logout", colors: ColorPalette.white, fontSize: 12),
                )
              )
            ),
            const SizedBox(width: 10,)
          ],
        ),
        backgroundColor: ColorPalette.white,
        body: Stack(
          children: [
            BlocBuilder<StoreListCubit, StoreListState>(
              builder: (context, state) {
                if (state is StoreListLoading) {
                  return const CupertinoActivityIndicator();
                } else if (state is StoreListLoaded) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            compassEnabled: false,
                            zoomGesturesEnabled: true,
                            myLocationButtonEnabled: true,
                            mapToolbarEnabled: false,
                            buildingsEnabled: true,
                            rotateGesturesEnabled: false,
                            indoorViewEnabled: false,
                            markers: Set.from(state.listMarker),
                            onCameraMove: (value) {},
                            gestureRecognizers: Set()
                              ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer())),
                            scrollGesturesEnabled: true,
                            tiltGesturesEnabled: true,
                            zoomControlsEnabled: true,
                            trafficEnabled: false,
                            myLocationEnabled: true,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(widget.locationBox.latitude ?? 0, widget.locationBox.longitude ?? 0),
                              zoom: 16,
                            ),
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Component.textDefault("List Kunjungan ${DateFormat.yMMMd().format(DateTime.now())}"),
                        const SizedBox(height: 10,),
                        Flexible(
                          flex: 1,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            itemCount: state.listStore.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () async {
                                  final GoogleMapController controller = await _controller.future;
                                  controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                                    target: LatLng(
                                      double.parse(state.listStore[index].latitude.toString()),
                                      double.parse(state.listStore[index].longitude.toString())
                                    ),
                                    zoom: 16
                                  )));
                                },
                                onDoubleTap: () {
                                  routePush(StoreDetailView(storeBox: state.listStore[index], index: index,), RouterType.material).then((value){
                                    if (value != null) {
                                      context.read<StoreListCubit>().onFetchData();
                                    }
                                  });
                                },
                                child: Card(
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Component.textBold(
                                              "${state.listStore[index].storeName} - ${state.listStore[index].storeId}",
                                              maxLines: 2,
                                              fontSize: 12
                                            ),
                                            const SizedBox(height: 5),
                                            Component.textDefault(
                                              "Cluster : small",
                                              fontSize: 11
                                            ),
                                            const SizedBox(height: 5),
                                            Component.textDefault(
                                              "TT Regular (${state.listStore[index].channelId}) - IRTM Big Store (${state.listStore[index].subchannelId})",
                                              fontSize: 11
                                            ),
                                            const SizedBox(height: 5),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Spacer(),
                                        if (state.listStore[index].lastVisit != null) const Icon(
                                          Icons.check_box,
                                          color: ColorPalette.green,
                                        ),
                                        const Spacer(),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(
                                              Icons.location_on,
                                              color: ColorPalette.green,
                                            ),
                                            Component.textDefault("1m", fontSize: 11)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
