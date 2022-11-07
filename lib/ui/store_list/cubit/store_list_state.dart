part of 'store_list_cubit.dart';

abstract class StoreListState extends Equatable {
  const StoreListState();

  @override
  List<Object> get props => [];
}

class StoreListInitial extends StoreListState {}

class StoreListLoaded extends StoreListState {

  final List<StoreBox> listStore;
  final List<Marker> listMarker;

  const StoreListLoaded({
    required this.listStore,
    required this.listMarker
  });

  @override
  List<Object> get props => [listStore];

}

class StoreListLoading extends StoreListState {}