import 'package:flutter/material.dart';
import '../customers/constants.dart';

class HeaderParts extends StatefulWidget {
  const HeaderParts({super.key});

  @override
  State<HeaderParts> createState() => _HeaderPartsState();
}

int indexCategory = 0;

class _HeaderPartsState extends State<HeaderParts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(),
        const SizedBox(
          height: 30, // Adjusted height to create more space
        ),
        searchBar(),
        const SizedBox(
          height: 30,
        ),
        categorySelection(),
      ],
    );
  }

  Padding categorySelection() {
    // list of items
    List<String> list = ["All", "Brake Pads", "Battery", "Tires"];
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    indexCategory = index;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 10,
                    ),
                    child: Text(
                      list[index],
                      style: TextStyle(
                        fontSize: 20,
                        color: indexCategory == index
                            ? kPrimaryColor
                            : Colors.black45,
                        fontWeight:
                            indexCategory == index ? FontWeight.bold : null,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Container searchBar() {
    return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.red[50], borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          const Expanded(
              child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: kPrimaryColor,
                ),
                hintText: "Search ",
                hintStyle: TextStyle(color: Colors.black26)),
          )),
          Material(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.insert_emoticon_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding title() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Find your Auto Spare Parts",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
