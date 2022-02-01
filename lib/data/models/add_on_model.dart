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
    price: 45,
    isChecked: false,
    isPlus: false,
  ),
  AddOnModel(
    id: 2,
    title: "Global Rights",
    description:
        "I will include global commercial and broadcast rights in perpetuity",
    qty: 1,
    price: 7,
    isChecked: false,
    isPlus: false,
  ),
  AddOnModel(
    id: 3,
    title: "Edit Audio To Video (+1 day)",
    description:
        "I will professionally edit my voice over to match-frame with your existing video",
    qty: 1,
    price: 42,
    isChecked: false,
    isPlus: true,
  ),
  AddOnModel(
    id: 4,
    title: "Add Music To 15 Spot (+1 day)",
    description: "I will add music to your 15 second spot",
    qty: 1,
    price: 12,
    isChecked: false,
    isPlus: true,
  ),
  AddOnModel(
    id: 4,
    title: "Add Music To 15 Spot (+1 day)",
    description: "I will add music to your 15 second spot",
    qty: 1,
    price: 14,
    isChecked: false,
    isPlus: true,
  ),
  AddOnModel(
    id: 6,
    title: "Write Voiceover Script (+1 day)",
    description: "The seller will create the written script for the voiceover.",
    qty: 1,
    price: 14,
    isChecked: false,
    isPlus: true,
  ),
];
