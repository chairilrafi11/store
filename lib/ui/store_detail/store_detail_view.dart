import 'package:chairil/core/app/app.dart';
import 'package:chairil/data/database/store_box.dart';
import 'package:chairil/ui/component/component.dart';
import 'package:chairil/ui/store_detail/cubit/store_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailView extends StatelessWidget {

  final int index;
  final StoreBox storeBox;

  const StoreDetailView({ Key? key, required this.index, required this.storeBox }) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreDetailCubit(),
        child: Scaffold(
        body: BlocBuilder<StoreDetailCubit, StoreDetailState>(
          builder: (context, state) {
            return ListView(
              // alignment: Alignment.bottomCenter,
              children: [
                const Icon(Icons.store, size: 300, color: ColorPalette.primary,),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Card(
                          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.location_on, color: ColorPalette.yellow,),
                                    const SizedBox(width: 10,),
                                    Component.textDefault("Lokasi belum sesuai", colors: ColorPalette.red),
                                    const SizedBox(width: 10,),
                                    ElevatedButton(
                                      onPressed: (){}, 
                                      style: ElevatedButton.styleFrom(
                                        primary: ColorPalette.primary,
                                      ),
                                      child: Component.textDefault("Reset", colors: ColorPalette.white)
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.store, color: ColorPalette.yellow,),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Component.textBold(storeBox.storeName ?? ""),
                                        const SizedBox(height: 5,),
                                        Component.textDefault(storeBox.address ?? ""),
                                        const SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Component.textDefault("Tipe Outlet"),
                                                const SizedBox(height: 5,),
                                                Component.textDefault("Tipe Display"),
                                                const SizedBox(height: 5,),
                                                Component.textDefault("Sub Tipe Display"),
                                                const SizedBox(height: 5,),
                                                Component.textDefault("ERTM"),
                                                const SizedBox(height: 5,),
                                                Component.textDefault("Pareto"),
                                                const SizedBox(height: 5,),
                                                Component.textDefault("E-merchaadising"),
                                              ],
                                            ),
                                            const SizedBox(width: 30,),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Component.textDefault(": ${storeBox.channelName}"),
                                                const SizedBox(height: 5,),
                                                Component.textDefault(": ${storeBox.channelId}"),
                                                const SizedBox(height: 5,),
                                                Component.textDefault(": ${storeBox.subchannelName}"),
                                                const SizedBox(height: 5,),
                                                Component.textDefault(": YA"),
                                                const SizedBox(height: 5,),
                                                Component.textDefault(": YA"),
                                                const SizedBox(height: 5,),
                                                Component.textDefault(": YA"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    const Icon(Icons.task, color: ColorPalette.yellow,),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Component.textBold("Last Visit"),
                                        const SizedBox(height: 5,),
                                        Component.textDefault(storeBox.lastVisit ?? "Toko belum anda kunjungi")
                                      ]
                                    )
                                  ]
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: ColorPalette.primary,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: ColorPalette.white,
                                  width: 3
                                )
                              ),
                              child: IconButton(
                                onPressed: (){}, 
                                icon: const Icon(Icons.navigation, color: ColorPalette.white,)
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Container(
                              decoration: BoxDecoration(
                                color: ColorPalette.primary,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: ColorPalette.white,
                                  width: 3
                                )
                              ),
                              child: IconButton(
                                onPressed: (){}, 
                                icon: const Icon(Icons.camera_alt, color: ColorPalette.white,)
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Container(
                              decoration: BoxDecoration(
                                color: ColorPalette.primary,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: ColorPalette.white,
                                  width: 3
                                )
                              ),
                              child: IconButton(
                                onPressed: (){}, 
                                icon: const Icon(Icons.gps_fixed, color: ColorPalette.white,)
                              ),
                            ),
                            const SizedBox(width: 40,)
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: ElevatedButton(   
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: ColorPalette.red,
                              ),   
                              onPressed: (){
                                Navigator.of(context).pop();
                              }, 
                              child: Component.textBold("No Visit", colors: ColorPalette.white)
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: (){
                                context.read<StoreDetailCubit>().onVisit(index, storeBox);
                              }, 
                              child: Component.textBold("Visit", colors: ColorPalette.white)
                            )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10,)
              ],
            );
          },
        )
      ),
    );
  }
}