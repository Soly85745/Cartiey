import 'package:flutter/material.dart';
import '../customers/constants.dart';

import 'cart_model.dart';

import 'items_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.car}) : super(key: key);
  final AutoSpareParts car;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          detailItemsHeader(),
          detailImage(),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // For name
                          Text(
                            widget.car.name,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 34,
                            ),
                          ),
                          // For price
                          Text(
                            '\$${widget.car.price}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // For items quantity
                    Material(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(30),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (quantity > 1) {
                                setState(() {
                                  quantity -= 1;
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "$quantity",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                quantity += 1;
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 27,
                ),
                Row(
                  children: [
                    // For rating
                    buildStarRating(widget.car.rate),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.car.rate.toString(),
                      style: const TextStyle(
                        color: Colors.black38,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.car.description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Material(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      addToCart(widget.car, quantity);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${widget.car.name} added to cart'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Container(
                      height: 65,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 21),
                      child: const Text(
                        "Add to Cart",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget detailItemsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Material(
            color: Colors.white.withOpacity(0.21),
            borderRadius: BorderRadius.circular(10),
            child: const BackButton(
              color: Colors.white,
            ),
          ),
          const Spacer(),
          const Text(
            "Details",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Material(
            color: Colors.white.withOpacity(0.21),
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget detailImage() {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.green[400]!,
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  )
                ],
                borderRadius: BorderRadius.circular(250),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(250),
                child: Image.network(
                  widget.car.image,
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStarRating(double rating) {
    int fullStars = rating.floor();
    bool halfStar = (rating - fullStars) >= 0.5;
    return Row(
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return const Icon(Icons.star, color: Colors.amber);
        } else if (index == fullStars && halfStar) {
          return const Icon(Icons.star_half, color: Colors.amber);
        } else {
          return const Icon(Icons.star_border, color: Colors.amber);
        }
      }),
    );
  }

  void addToCart(AutoSpareParts car, int quantity) {
    for (int i = 0; i < quantity; i++) {
      cart.addItem(car);
    }
  }
}
