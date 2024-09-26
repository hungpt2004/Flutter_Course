import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_ui/constant/constant_value.dart';

import '../model/destination.dart';

class MyDestinationDetails extends StatefulWidget {
  final Destination destination;

  const MyDestinationDetails({super.key, required this.destination});

  @override
  State<MyDestinationDetails> createState() => _MyDestinationDetailsState();
}

class _MyDestinationDetailsState extends State<MyDestinationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Expanded widget for the background image with flex = 2
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/${widget.destination.urlImage}", // Use image from destination
                    fit: BoxFit.cover,
                  ),
                ),
                // Overlay text on the image
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.22, // Adjust the position as needed
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.destination.name, // Destination name
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: textFamily,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0, // Make the text stand out
                              color: Colors.black.withOpacity(0.7),
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_pin, color: Colors.white),
                          Text(
                            widget.destination.location, // Location
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: textFamily,
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.7),
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Expanded widget for details with flex = 3
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Horizontal row with ratings and weather info
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.orange),
                          Text('5.0', style: TextStyle(fontSize: 15, fontFamily: textFamily, color: Colors.orange)),
                          SizedBox(width: 12),
                          Icon(Icons.cloud, color: Colors.blue),
                          Text('19°C', style: TextStyle(fontSize: 15, fontFamily: textFamily, color: Colors.blue)),
                          SizedBox(width: 12),
                          Icon(Icons.calendar_today, color: Colors.purple),
                          SizedBox(width: 12),
                          Text('5 Day', style: TextStyle(fontSize: 15, fontFamily: textFamily, color: Colors.purple)),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 40,
                        child: Stack(
                          children: [
                            const Positioned(
                              left: 0,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage('assets/images/aa.png'),
                              ),
                            ),
                            const Positioned(
                              left: 25,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage('assets/images/bb.webp'),
                              ),
                            ),
                            const Positioned(
                              left: 50,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage('assets/images/ab.jpeg'),
                              ),
                            ),
                            const Positioned(
                              left: 75,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage('assets/images/as.jpeg'),
                              ),
                            ),
                            Positioned(
                              left: 100,
                              child: CircleAvatar(
                                radius: 20,
                                child: const Text("+28"),
                                backgroundColor: primaryColor,
                              ),
                            ),
                            const Positioned(
                                top: 10,
                                left: 160,
                                child: Text("+28 recommend")
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: textFamily,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.destination.description, // Destination description
                        style: const TextStyle(fontSize: 16, color: Colors.grey, fontFamily: textFamily),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '\$${widget.destination.price}', // Display the price
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              fontFamily: textFamily,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Action when 'Book Now' is pressed
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: primaryColor,
                            ),
                            child: const Text(
                              'Book Now',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontFamily: textFamily,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
