

import 'package:chairil/data/database/store_box.dart';

class Store {

  List<StoreBox>? stores;
  String? status;
  String? message;

  Store({this.stores, this.status, this.message});

  Store.fromJson(Map<String, dynamic> json) {
    if (json['stores'] != null) {
      stores = <StoreBox>[];
      json['stores'].forEach((v) {
        stores!.add(StoreBox.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (stores != null) {
      data['stores'] = stores!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
