import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_ui/details/destination_details.dart';
import 'package:travel_app_ui/home/components/slider_page_route.dart';
import '../../constant/constant_value.dart';
import '../../model/destination.dart';

class MyDestinationCard extends StatefulWidget {
  const MyDestinationCard({super.key, required this.destinations});

  final List<Destination> destinations;

  @override
  State<MyDestinationCard> createState() => _MyDestinationCardState();
}

class _MyDestinationCardState extends State<MyDestinationCard> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Thêm khoảng cách nếu cần
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.destinations.length,
          itemBuilder: (context, index) {
            final place = widget.destinations[index];
            return GestureDetector(
              onTap: (){
                setState(() {
                  Navigator.push(context, SlidePageRoute(page: MyDestinationDetails(destination: place), beginOffset: Offset(1.0,0.0), endOffset: Offset.zero, duration: Duration(milliseconds: 1000)));
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 15, left: 10),
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33),
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage("assets/images/${place.urlImage}"), // Sử dụng AssetImage
                    fit: BoxFit.cover, // Điều chỉnh cách hiển thị hình ảnh
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      left: MediaQuery.of(context).size.width * 0.35,
                      bottom: MediaQuery.of(context).size.height * 0.3,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.bookmark, size: 20, color: place.isSaving ? Colors.orangeAccent : Colors.grey[300],),
                      ),
                    ),
                    // Chỉnh sửa đoạn này để căn giữa văn bản
                    Positioned(
                      bottom: 30, // Cách từ dưới lên 10 pixels
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Text(
                            place.name,
                            style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.8), fontFamily: textFamily),
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_pin, color: Colors.white.withOpacity(0.8),),
                              Text(place.location, style: TextStyle(fontSize: 15,fontFamily: textFamily,color: Colors.white.withOpacity(0.8)),textAlign: TextAlign.center,),
                            ],
                          )
                        ],
                      )
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
