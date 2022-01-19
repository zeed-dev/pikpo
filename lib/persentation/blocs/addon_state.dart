part of 'addon_bloc.dart';

abstract class AddonState extends Equatable {
  const AddonState();
  
  @override
  List<Object> get props => [];
}

class AddonInitial extends AddonState {}
