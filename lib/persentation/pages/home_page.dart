import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pikpo/common/constants.dart';
import 'package:pikpo/data/models/add_on_model.dart';
import 'package:pikpo/persentation/blocs/addon_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var total = Provider.of<AddonBloc>(context).totalPrice();
    var qty = Provider.of<AddonBloc>(context).qty;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 192,
              width: double.infinity,
              child: Stack(
                children: [
                  // BG IMAGE
                  Container(
                    height: 164,
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/bg_card.png",
                          fit: BoxFit.cover,
                          height: 164,
                          width: double.infinity,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              gradient: LinearGradient(
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.0),
                                  Colors.black,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // USER SECTION
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          "assets/usr.png",
                          height: 80,
                          width: 80,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Victor Alba",
                              style: kHeading5.copyWith(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "@victor.alba",
                              style: kSubtitle.copyWith(
                                fontSize: 16,
                                color: kPastelPurple,
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/ic_coment.png",
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text("15 Recommenation "),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  _buildWidgetActionButton(),
                ],
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Padding(
              padding: EdgeInsets.only(left: margin),
              child: Text(
                "Produce a radio\ncommercial",
                style: kHeading5.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kWhite,
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            _buildWidgetInfo(),
            SizedBox(
              height: 19,
            ),
            Padding(
              padding: EdgeInsets.only(left: margin),
              child: Text(
                "30-second spot",
                style: kHeading5.copyWith(
                  fontSize: 21,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: margin),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Pro voiceover, spec timing, music and SFX, HQ MP3. Mixed and mastered.",
                      style: kBodyText.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "\$67",
                    style: kHeading5.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kPurple,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 29,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: margin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Choose an add-on",
                    style: kSubtitle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kPurple,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Optional",
                    style: kSubtitle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kWhite,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Column(
              children: mockAddOn.map((e) {
                return _buildWidgetAddOns(e);
              }).toList(),
            ),
            SizedBox(
              height: 42,
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 23,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      context.read<AddonBloc>().add(ReduceQty());
                    });
                  },
                  child: Image.asset(
                    "assets/btn_dec.png",
                    width: 30,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    qty.toString(),
                    style: kSubtitle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kWhite,
                      fontSize: 16,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      context.read<AddonBloc>().add(AddQty());
                    });
                  },
                  child: Image.asset(
                    "assets/btn_inc.png",
                    width: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                height: 48,
                width: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kPurple,
                    ),
                    child: Text(
                      "Book \$${total}",
                      style: kSubtitle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kWhite,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetAddOns(AddOnModel addOnModel) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: margin),
          child: Row(
            crossAxisAlignment: addOnModel.isChecked
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: addOnModel.isChecked,
                onChanged: (val) {
                  if (!addOnModel.isChecked) {
                    context
                        .read<AddonBloc>()
                        .add(AddToAddOn(addOnModel: addOnModel));
                  } else {
                    context
                        .read<AddonBloc>()
                        .add(DeleteToAddOn(addOnModel: addOnModel));
                  }
                  setState(() {
                    addOnModel.isChecked = val!;
                  });
                },
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      addOnModel.title,
                      style: kSubtitle.copyWith(
                        fontWeight: FontWeight.w300,
                        color: kWhite,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      addOnModel.description,
                      style: kSubtitle.copyWith(
                        fontWeight: FontWeight.w300,
                        color: kWhite,
                        fontSize: 12,
                      ),
                    ),
                    addOnModel.isChecked
                        ? Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  log("PRESSED");
                                  if (addOnModel.qty != 1) {
                                    setState(() {
                                      context.read<AddonBloc>().add(
                                          ReduceQtyAddOn(id: addOnModel.id));
                                    });
                                  }
                                },
                                child: Image.asset(
                                  "assets/btn_dec.png",
                                  width: 30,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  addOnModel.qty.toString(),
                                  style: kSubtitle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: kWhite,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  log("PRESSED");
                                  setState(() {
                                    context
                                        .read<AddonBloc>()
                                        .add(AddQtyAddOn(id: addOnModel.id));
                                  });
                                },
                                child: Image.asset(
                                  "assets/btn_inc.png",
                                  width: 30,
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
              Text(
                "+ ${addOnModel.price}",
                style: kSubtitle.copyWith(
                  fontWeight: FontWeight.w300,
                  color: kWhite,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          thickness: 1,
        ),
      ],
    );
  }

  Widget _buildWidgetInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: margin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/ic_clock.png",
                width: 18,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "2 Days Delivery",
                style: kHeading6.copyWith(
                  color: kPastelGrey,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                "assets/ic_revision.png",
                width: 18,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "2 Revisions",
                style: kHeading6.copyWith(
                  color: kPastelGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetActionButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/ic_back.png",
            width: 34,
            height: 34,
          ),
          Image.asset(
            "assets/ic_more.png",
            width: 34,
            height: 34,
          ),
        ],
      ),
    );
  }
}
