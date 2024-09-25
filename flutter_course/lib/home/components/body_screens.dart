import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_ui/constant/constant_value.dart';
import 'package:travel_app_ui/home/components/category_button.dart';
import 'package:travel_app_ui/home/components/destination_card.dart';
import 'package:travel_app_ui/home/components/under_button.dart';

import '../../model/destination.dart';

class MyBodyScreens extends StatefulWidget {
  const MyBodyScreens({super.key});

  @override
  State<MyBodyScreens> createState() => _MyBodyScreensState();
}

class _MyBodyScreensState extends State<MyBodyScreens> {

  List<Destination> destinations = [
    Destination(
      name: "Germany",
      location: "GER",
      urlImage: "thebridge.png",
      rankingType: "Tourist",
      description: "One of the most popular destinations in Europe, known for its rich history and modern cities.",
      price: 150.0,
      rating: 4.5,
      isSaving: true,
    ),
    Destination(
      name: "Czech Republic",
      location: "CAN",
      urlImage: "sunrises.png",
      rankingType: "Cultural",
      description: "A beautiful capital city known for its cultural heritage and charming architecture.",
      price: 100.0,
      rating: 4.7,
      isSaving: false,
    ),
    Destination(
      name: "Italy",
      location: "VN",
      urlImage: "thebridge.png",
      rankingType: "Natural",
      description: "A country with stunning landscapes, historic landmarks, and world-famous cuisine.",
      price: 200.0,
      rating: 4.8,
      isSaving: true,
    ),
    Destination(
      name: "France",
      location: "HN",
      urlImage: "theway.png",
      rankingType: "Beach",
      description: "Known for its beautiful beaches and vibrant coastal cities.",
      price: 250.0,
      rating: 4.6,
      isSaving: false,
    ),
    Destination(
      name: "United Kingdom",
      location: "UK",
      urlImage: "eiffel_tower.png",
      rankingType: "Beach",
      description: "A famous destination known for its picturesque beaches and coastal landscapes.",
      price: 180.0,
      rating: 4.4,
      isSaving: true,
    ),
    Destination(
      name: "Spain",
      location: "USA",
      urlImage: "thebridge.png",
      rankingType: "Mountain",
      description: "A country with breathtaking mountain views and a rich cultural history.",
      price: 120.0,
      rating: 4.5,
      isSaving: false,
    ),
    Destination(
      name: "Netherlands",
      location: "SPAIN",
      urlImage: "thebridge.png",
      rankingType: "Cultural",
      description: "Famous for its floating markets and unique culinary experiences.",
      price: 80.0,
      rating: 4.2,
      isSaving: true,
    ),
    Destination(
      name: "Switzerland",
      location: "SWL",
      urlImage: "theway.png",
      rankingType: "Beach",
      description: "A paradise for nature lovers, offering serene landscapes and tranquil beaches.",
      price: 150.0,
      rating: 4.3,
      isSaving: false,
    ),
  ];

  String selectedType = "Best nature";

  List<Destination> getFilteredProducts() {
    if (selectedType == "Best nature") {
      return destinations;
    } else {
      return destinations.where((des) => des.rankingType == selectedType).toList();
    }
  }

  void _updateProducts(String type) {
    setState(() {
      selectedType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyCategoryButton(onCategorySelected: _updateProducts,),
        MyDestinationCard(destinations: destinations),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Popular Categories", style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 27,
                fontFamily: textFamily
              ),),
              TextButton(onPressed: (){}, child: Text("See All", textAlign: TextAlign.end, style: TextStyle(color: Colors.pink[300], fontFamily: textFamily),)),
            ],
          ),
        ),
        MyCategoryButtonSecond(),
      ],
    );
  }
}
