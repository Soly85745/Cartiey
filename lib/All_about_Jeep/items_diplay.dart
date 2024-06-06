import 'package:flutter/material.dart';
import '../customers/constants.dart';
import 'DetailPage.dart';
import 'cart_model.dart';
import 'items_model.dart';

class ItemsDisplay extends StatefulWidget {
  const ItemsDisplay({Key? key});

  @override
  State<ItemsDisplay> createState() => _ItemsDisplayState();
}

class _ItemsDisplayState extends State<ItemsDisplay> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: carsItems.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        mainAxisExtent: 265,
      ),
      itemBuilder: (context, index) {
        AutoSpareParts car = carsItems[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(car: car),
              ),
            );
          },
          child: Container(
            height: 265,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(125),
                        child: Image.network(
                          car.image,
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        car.name,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          const Center(),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            car.rate.toString(),
                            style: const TextStyle(color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '\$${car.price}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Material(
                    color: kPrimaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        addToCart(car);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // Function to handle adding item to cart
  void addToCart(AutoSpareParts car) {
    cart.addItem(car);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${car.name} added to cart'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
