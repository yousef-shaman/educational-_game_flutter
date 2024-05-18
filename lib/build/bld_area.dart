import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/constants/text_style.dart';
import 'package:graduation_project_flutter/models/area/area.dart';
import 'package:graduation_project_flutter/views/screen/topics_viewer.dart';

import '../constants/constants.dart';
import '../utilities/local_storge.dart';

class AreaListWidget extends StatefulWidget {
  final List<GetArea> data;

  const AreaListWidget({super.key, required this.data});

  @override
  State<AreaListWidget> createState() => _AreaListWidgetState();
}

class _AreaListWidgetState extends State<AreaListWidget> {
  int _currentPage = 0; // Initial page index
  String _currentAreaname = "";
  bool isLoading = false;

  String? redirect;

  @override
  void initState() {
    super.initState();
    if (widget.data.isNotEmpty) {
      _currentAreaname = widget.data[0].areaName ??
          'Untitled Area'; // Initialize with the first item's description
    }
    userType();
  }

  Future<void> userType() async {
    setState(() {
      isLoading = true;
    });

    redirect = await getData(role);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 20, bottom: 5),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            _currentAreaname,
            style: labelLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 35), // Spacing between dots and description
          CarouselSlider(
            options: CarouselOptions(
              height: 500,
              autoPlay: false,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                  _currentAreaname =
                      widget.data[index].areaName ?? 'Untitled Area';
                });
              },
            ),
            items: widget.data.map((areaData) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TopicsViewer(
                                areaId: areaData.id!,
                                areaName: areaData.areaName!,
                              )));
                    },
                    child: Card(
                      elevation: 15,
                      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 25),
                      color: areaData.isActive!
                              ? Colors.amberAccent
                              : Colors.grey[500],
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        // decoration: BoxDecoration(
                          
                        //   borderRadius: BorderRadius.circular(25),
                        // ),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: Text(
                              areaData.description ?? "No description available",
                              style: labelMediem,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              widget.data
                  .length, // Ensure this matches the number of items in the carousel
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _currentPage == index ? 14 : 10,
                height: _currentPage == index ? 14 : 10,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
