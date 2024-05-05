import 'package:flutter/material.dart';
import 'destination_detail_page.dart';

// class Destination
class Destination {
  // attributes
  final String name;
  final String description;
  final String image;
  // constructor
  Destination({
    required this.name,
    required this.description,
    required this.image,
  });
}

// mutable state
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // populating destinations
  List<Destination> destinations = [
    Destination(
      name: 'Bali, Indonesia',
      description:
          'Bali, Indonesia, invites you to immerse yourself in its multifaceted beauty. With stunning beaches stretching along its coastline, Bali beckons travelers to unwind on soft sands kissed by turquoise waters. Yet, beyond the allure of its beaches lies a tapestry of vibrant culture and natural splendor. Wander through lush rice terraces that cascade down verdant hillsides, a testament to Bali\'s agricultural heritage. Delve into the island\'s rich traditions, where Balinese dance and artistry captivate the senses, offering glimpses into centuries-old rituals and expressions of creativity. Whether you seek adventure or relaxation, Bali\'s luxurious resorts nestled amid picturesque landscapes promise an unforgettable retreat, where every moment is steeped in tranquility and rejuvenation.',
      image: 'assets/bali.jpg',
    ),
    Destination(
      name: 'Bangkok, Thailand',
      description:
          'Bangkok, Thailand\'s bustling capital, pulsates with energy, offering a sensory feast for explorers. Navigate through its labyrinthine streets, where bustling markets overflow with vibrant colors and aromatic flavors. Amidst the urban sprawl, ornate temples stand as timeless symbols of spiritual devotion and architectural grandeur. The Grand Palace and Wat Pho enchant visitors with their intricate designs and storied history, while the iconic Chao Phraya River weaves through the city, revealing glimpses of Bangkok\'s skyline illuminated by the night. Indulge your senses with delectable Thai cuisine, from savory street food to gourmet dining experiences, each bite a celebration of Thailand\'s culinary heritage. In Bangkok, every corner tells a tale, inviting you to uncover the layers of its rich cultural tapestry and dynamic urban landscape.',
      image: 'assets/bangkok.jpg',
    ),
    Destination(
      name: 'Halong Bay, Vietnam',
      description:
          'Halong Bay, Vietnam, captivates the imagination with its ethereal beauty and tranquil charm. Embark on a journey through this UNESCO World Heritage Site, where emerald waters cradle towering limestone karsts adorned with lush vegetation. Glide through hidden caves and pristine islands, each a testament to nature\'s artistry and time\'s patient sculpting. Whether kayaking through secluded coves or hiking along rugged trails, Halong Bay offers endless opportunities for adventure and exploration. Yet, amidst the excitement, there\'s a serenity that pervades the bay, inviting travelers to pause and soak in the awe-inspiring scenery. Surrender to the allure of Halong Bay, where every moment spent amidst its pristine landscapes is a testament to the enduring power of nature\'s beauty.',
      image: 'assets/halongbay.jpg',
    ),
  ];

  // state of the like button
  List<bool> isFavoriteList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    // base material design structure
    return Scaffold(
      // appbar for the app
      appBar: AppBar(
        title: const Text('Destinations App'),
      ),
      // main content
      body: Padding(
        // adding padding
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        // creating grid for the widgets
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 600,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          // number of widgets
          itemCount: destinations.length,
          itemBuilder: (context, index) {
            // looping destinations
            Destination destination = destinations[index];
            // adding ontap to widgets
            return GestureDetector(
              onTap: () {
                // redirect to another screen
                Navigator.push(
                  context,
                  // sending data about current widgets
                  MaterialPageRoute(
                    builder: (context) => DestinationDetailPage(
                      name: destination.name,
                      description: destination.description,
                      image: destination.image,
                    ),
                  ),
                );
              },
              // creating the widgets with data
              child: destinationCard(
                index: index,
                name: destination.name,
                description: destination.description,
                image: destination.image,
              ),
            );
          },
        ),
      ),
    );
  }

  // creating custom component as a widget
  Widget destinationCard({
    // attributes
    required int index,
    required String name,
    required String description,
    required String image,
  }) {
    // returning widget
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              name,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    isFavoriteList[index]
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: isFavoriteList[index] ? Colors.red : null,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavoriteList[index] = !isFavoriteList[index];
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
