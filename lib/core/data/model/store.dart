import 'package:chairil/core/data/model/strores.dart';
import 'package:chairil/data/database/store_box.dart';

class ResponseAPI {

  List<StoreBox>? stores;
  String? status;
  String? message;

  ResponseAPI({this.stores, this.status, this.message});

  ResponseAPI.fromJson(Map<String, dynamic> json) {
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
