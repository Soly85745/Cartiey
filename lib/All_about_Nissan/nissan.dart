import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../All_about_Jeep/AutoSparePartsPage.dart';
import '../All_about_Jeep/BookServicePage.dart';

class NissanPage extends StatelessWidget {
  const NissanPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'name': 'Oil Change',
        'price': '\$ 170',
        'rate': '4.5',
        'icon': Icons.build
      },
      {
        'name': 'Tire Rotation',
        'price': '\$ 200',
        'rate': '4.7',
        'icon': Icons.tire_repair_rounded
      },
      {
        'name': 'Brake Inspection',
        'price': '\$ 370',
        'rate': '4.8',
        'icon': Icons.car_repair
      },
      {
        'name': 'Car Wash',
        'price': '\$ 130',
        'rate': '4.6',
        'icon': Icons.local_car_wash
      }, // Add car wash service with icon
    ];

    Future<void> _launchMapsUrl(String query) async {
      final url = 'https://maps.app.goo.gl/dLgx4qnPw1UjxQJ2A';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    Future<void> _launchPhoneUrl(String phoneNumber) async {
      final url = 'tel:$phoneNumber';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nissan Service Center'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'images/Nissan.jpeg', // Replace with your image asset
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nissan Service Center',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'El-Basatin, sharkeya, El Basatin',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.location_on,
                            color: Color(0xffab8671)),
                        onPressed: () =>
                            _launchMapsUrl('Nissan Service Center'),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.phone, color: Color(0xffab8671)),
                        onPressed: () => _launchPhoneUrl('01065555145'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Description:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'We offer the best service for your Nissan with experienced mechanics and genuine spare parts. '
                    'Our services include oil changes, tire rotations, brake inspections, and more.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Services:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: services.map((service) {
                      return ListTile(
                        leading: Icon(
                            service['icon'] as IconData), // Cast to IconData
                        title:
                            Text(service['name'] as String), // Cast to String
                        subtitle: Row(
                          children: [
                            const Icon(Icons.star, color: Colors.yellow),
                            Text(' ${service['rate']}'),
                          ],
                        ),
                        trailing:
                            Text(service['price'] as String), // Cast to String
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.book_online, color: Colors.white),
                      label: const Text('Book Service',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          )),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookServicePage(
                                    services: services,
                                  )),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff734a34), // Background color
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AutoSparePartsPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff734a34), // Background color
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Auto Spare Parts',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: NissanPage()));
