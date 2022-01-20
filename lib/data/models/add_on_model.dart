import 'package:equatable/equatable.dart';

class AddOnModel extends Equatable {
  final int id;
  String title;
  String description;
  bool isChecked;
  bool isPlus;
  int qty;
  int price;

  AddOnModel({
    required this.title,
    required this.description,
    required this.qty,
    required this.price,
    required this.isChecked,
    required this.id,
    required this.isPlus,
  });

  @override
  List<Object?> get props {
    return [
      title,
      description,
      qty,
      price,
      isChecked,
      id,
      isPlus,
    ];
  }
}

List<AddOnModel> mockAddOn = [
  AddOnModel(
    id: 1,
    title: "Extra Fast 1 Day Delivery",
    description: "",
    qty: 1,
    price: 35,
    isChecked: false,
    isPlus: false,
  ),
  AddOnModel(
    id: 2,
    title: "Write Voiceover Script (+1 day)",
    description: "The seller will create the written script for the voiceover.",
    qty: 1,
    price: 14,
    isChecked: false,
    isPlus: true,
  ),
  AddOnModel(
    id: 3,
    title: "Global Rights",
    description:
        "I will include global commercial and broadcast rights in perpetuity",
    qty: 1,
    price: 7,
    isChecked: false,
    isPlus: false,
  ),
];
