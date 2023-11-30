import 'package:flutter/material.dart';

class Book {
  final String name;
  final String author;
  final String imageUrl;
  final String description;

  Book(
      {required this.name,
      required this.author,
      required this.imageUrl,
      required this.description});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookListPage(),
    );
  }
}

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Book List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            BookCard(
              book: Book(
                  name: 'Flutter Apprentice',
                  author: 'Mike Katz',
                  imageUrl: 'assets/images/book1.png',
                  description: 'Learn to build cross platform apps'),
            ),
            BookCard(
              book: Book(
                  name: 'Begin app development with Flutter',
                  description: 'Create cross platform Mobile apps',
                  imageUrl: 'assets/images/book2.jpg',
                  author: 'Rape Payne'),
            ),
            BookCard(
              book: Book(
                  name: 'Flutter Libraries',
                  author: 'Nevercode',
                  imageUrl: 'assets/images/book3.png',
                  description: 'Discover 60+ Flutter libraries'),
            ),
            BookCard(
              book: Book(
                  name: 'Flutter Apprentice',
                  author: 'Mike Katz',
                  imageUrl: 'assets/images/book1.png',
                  description: 'Learn to build cross platform apps'),
            ),
            BookCard(
              book: Book(
                  name: 'Begin app development with Flutter',
                  description: 'Create cross platform Mobile apps',
                  imageUrl: 'assets/images/book2.jpg',
                  author: 'Rape Payne'),
            ),
            BookCard(
              book: Book(
                  name: 'Flutter Libraries',
                  author: 'Nevercode',
                  imageUrl: 'assets/images/book3.png',
                  description: 'Discover 60+ Flutter libraries'),
            ),
          ],
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Colors.blue.shade800, width: 2.5),
        ),
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        surfaceTintColor: Colors.white,
        elevation: 5,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, top: 30),
                  width: 80.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(book.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        book.author,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Rating: 4.5',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue[800]),
                  ),
                  onPressed: () {
                    navigateToBuyNowPage(context, book);
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Buy Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void navigateToBuyNowPage(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BuyNowPage(book: book),
      ),
    );
  }
}

class BuyNowPage extends StatefulWidget {
  final Book book;

  const BuyNowPage({Key? key, required this.book}) : super(key: key);

  @override
  State<BuyNowPage> createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<BuyNowPage> {
  String selectedOption = 'Bkash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text(
          'Buy Now',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 160.0,
                height: 230.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.book.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                widget.book.name,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.book.author,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.book.description,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Price: \$19.99',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              // Dropdown button
              DropdownButton<String>(
                dropdownColor: Colors.white,
                focusColor: Colors.white,
                value: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
                items: [
                  'Bkash',
                  'Nagad',
                  'Cash on Delivery',
                  'Crdeit or Debit Card',
                  // Add more options as needed
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Buy',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Go Back',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
