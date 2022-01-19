import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pikpo/data/models/add_on_model.dart';
import 'package:logger/logger.dart';

part 'addon_event.dart';
part 'addon_state.dart';

class AddonBloc extends Bloc<AddonEvent, AddonState> {
  List<AddOnModel?> addOns = [];
  int price = 67;
  int qty = 1;

  Logger _logger = Logger();

  AddonBloc() : super(AddonInitial()) {
    on<AddToAddOn>((event, emit) {
      if (!addOnExist(event.addOnModel)) {
        addOns.add(event.addOnModel);
      }

      _logger.d(addOns);
    });

    on<DeleteToAddOn>((event, emit) {
      addOns.removeWhere(
          (addOn) => addOn?.isChecked == event.addOnModel?.isChecked);

      _logger.d(addOns);
    });

    on<AddQtyAddOn>((event, emit) {
      var data = addOns.where((element) => element?.id == event.id).first;
      data!.qty++;
    });

    on<ReduceQtyAddOn>((event, emit) {
      var data = addOns.where((element) => element?.id == event.id).first;
      data!.qty--;
    });

    on<AddQty>((event, emit) {
      qty++;
    });

    on<ReduceQty>((event, emit) {
      qty--;
    });
  }

  bool addOnExist(AddOnModel? addOnModel) {
    if (addOns.indexWhere((element) => element?.id == addOnModel?.id) == -1) {
      return false;
    } else {
      return true;
    }
  }

  int totalPrice() {
    int total = 0;

    for (var item in addOns) {
      total += (item!.qty * item.price * qty);
    }

    return total + price;
  }
}
