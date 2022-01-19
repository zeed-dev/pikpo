part of 'addon_bloc.dart';

abstract class AddonEvent extends Equatable {
  const AddonEvent();

  @override
  List<Object> get props => [];
}

class AddToAddOn extends AddonEvent {
  final AddOnModel? addOnModel;

  AddToAddOn({required this.addOnModel});
}

class DeleteToAddOn extends AddonEvent {
  final AddOnModel? addOnModel;

  DeleteToAddOn({required this.addOnModel});
}

class AddQtyAddOn extends AddonEvent {
  final int? id;

  AddQtyAddOn({required this.id});
}

class ReduceQtyAddOn extends AddonEvent {
  final int id;

  ReduceQtyAddOn({required this.id});
}

class AddQty extends AddonEvent {}

class ReduceQty extends AddonEvent {}

class AddOnLoading extends AddonEvent {}

class AddOnLoaded extends AddonEvent {
  final List<AddOnModel> addOn;

  AddOnLoaded(this.addOn);
}

class AddOnFailed extends AddonEvent {
  final String message;

  AddOnFailed(this.message);
}
