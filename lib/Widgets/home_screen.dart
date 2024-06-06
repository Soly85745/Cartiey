import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../All_about_BMW/BMW.dart';

import '../All_about_Jeep/jeep.dart';
import '../All_about_Nissan/nissan.dart';
import '../customers/item_widget.dart';
// Import other item pages similarly...

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> items = [
    {
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/cartiety.appspot.com/o/wp2637510-jeep-logo-wallpaper-hd-removebg-preview.png?alt=media&token=99c54469-bb47-46ef-87e0-9017390532bf',
      'title': 'Jeep',
      'subtitle': 'Jeep Services Center',
    },
    {
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/cartiety.appspot.com/o/bmw-brand-logo-0.png?alt=media&token=545e6389-bdbb-4ad6-953b-29451b5f91b0',
      'title': 'BMW',
      'subtitle': 'BMW Services Center',
    },
    {
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/cartiety.appspot.com/o/Nissan%20Skyline.jpeg?alt=media&token=96b12a26-5f3f-4a64-9252-9bd0b0cd0129',
      'title': 'Nissan',
      'subtitle': 'Nissan Services Center',
    },
    // Add other items similarly...
  ];

  final List<Map<String, String>> otherItems = [
    {
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/cartiety.appspot.com/o/wp2637510-jeep-logo-wallpaper-hd-removebg-preview.png?alt=media&token=99c54469-bb47-46ef-87e0-9017390532bf',
      'title': 'New Item 1',
      'subtitle': 'Jeep Services Center',
    },
    {
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/cartiety.appspot.com/o/bmw-brand-logo-0.png?alt=media&token=545e6389-bdbb-4ad6-953b-29451b5f91b0',
      'title': 'New Item 2',
      'subtitle': 'BMW Services Center',
    },
    {
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/cartiety.appspot.com/o/Nissan%20Skyline.jpeg?alt=media&token=96b12a26-5f3f-4a64-9252-9bd0b0cd0129',
      'title': 'New Item 3',
      'subtitle': 'Nissan Services Center',
    },
    // Add other new items similarly...
  ];

  late List<Map<String, String>> ItemtwoWidget;

  @override
  void initState() {
    super.initState();
    ItemtwoWidget = items;
  }

  void filterItems(String query) {
    final List<Map<String, String>> sourceItems =
        query.contains("new") ? otherItems : items;

    final filtered = sourceItems.where((item) {
      final titleLower = item['title']?.toLowerCase() ?? '';
      final subtitleLower = item['subtitle']?.toLowerCase() ?? '';
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          subtitleLower.contains(searchLower);
    }).toList();

    setState(() {
      ItemtwoWidget = filtered;
    });
  }

  void navigateToPage(String title) {
    Widget page;
    switch (title) {
      case 'Jeep':
        page = JeepPage();
        break;
      case 'BMW':
        page = BMWPage();
        break;
      case 'Nissan':
        page = NissanPage();
        break;
      // Add other cases for other items similarly...
      default:
        page = Scaffold(
          appBar: AppBar(
            title: Text('Detail Page'),
          ),
          body: Center(
            child: Text('Details about $title'),
          ),
        );
        break;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.yellow,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Location",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.grey),
                          ),
                          Text(
                            "Sadat academy, Maadi",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                ),
                onChanged: filterItems,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ItemtwoWidget.length,
                itemBuilder: (context, index) {
                  final item = ItemtwoWidget[index];
                  return ItemWidget(
                    imageUrl: item['imageUrl'] ?? '',
                    title: item['title'] ?? 'Unknown Title',
                    subtitle: item['subtitle'] ?? 'No Subtitle',
                    onTap: () => navigateToPage(item['title'] ?? ''),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
