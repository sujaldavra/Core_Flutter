import 'package:flutter/material.dart';
import 'package:flutter_app/Details_Page.dart';
import 'package:flutter_app/product.dart';


void main() {
  runApp(
    const HomePage(),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetInvoice getInvoice = GetInvoice();
  TextStyle MyStyle =
  const TextStyle(fontSize: 22, fontWeight: FontWeight.w500);
  List<Productsinvoice> allProducts = [
    Productsinvoice(
        productName: 'Jordan Boys T-Shirt',
        productPrice: 700,
        Image: 'https://m.media-amazon.com/images/I/81uMWD50ywL._UX679_.jpg'),
    Productsinvoice(
        productName: 'Nike Shoes',
        productPrice: 9000,
        Image: 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/b7d9211c-26e7-431a-ac24-b0540fb3c00f/air-force-1-07-shoe-WrLlWX.png'),
    Productsinvoice(
        productName: 'Headphone',
        productPrice: 12000,
        Image: 'https://cdn.shopify.com/s/files/1/0464/8422/6203/products/AirPodsMax-1_800x533.jpg?v=1632515246'),
    Productsinvoice(
        productName: 'Samsung',
        productPrice: 119000,
        Image: 'https://m.media-amazon.com/images/I/71PvHfU+pwL._SL1500_.jpg'),
    Productsinvoice(
        productName: 'Mac Studio',
        productPrice: 200000,
        Image: 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mac-studio-select-202203?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1645739294025'),
    Productsinvoice(
        productName: 'Air Pods Pro',
        productPrice: 1300,
        Image: 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MWP22?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1591634795000'),
    Productsinvoice(
        productName: 'Nothing Mobile',
        productPrice: 30000,
        Image: 'https://cdn.shopify.com/s/files/1/0583/2202/6680/products/original-imagg4xza5rehdqv_720x.jpg?v=1657829870'),
    Productsinvoice(
        productName: 'MacBook Pro M2',
        productPrice: 119900,
        Image: 'https://m.media-amazon.com/images/I/61bX2AoGj2L._SX522_.jpg'),
    Productsinvoice(
        productName: '13 Pro Max',
        productPrice: 125900,
        Image: 'https://m.media-amazon.com/images/I/61jLiCovxVL._SX679_.jpg'),
    Productsinvoice(
        productName: 'MI TV',
        productPrice: 18999,
        Image: 'https://i01.appmifile.com/webfile/globalimg/in/cms/C26D1A72-E8D5-86A7-1649-DB7DA01A6675.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          elevation: 5,
          title: const Text("Invoice Generator"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                final invoice = await getInvoice.getInvoice(allProducts);
                getInvoice.openPDF(invoice);
              },
              icon: Icon(Icons.picture_as_pdf),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Image", style: MyStyle),
                  const Spacer(),
                  Text("Name", style: MyStyle),
                  const Spacer(),
                  Text("Price", style: MyStyle),
                  const Spacer(),
                  Text("Quantity", style: MyStyle),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: allProducts.length,
                    itemBuilder: (context, i) {
                      final currentProduct = allProducts[i];
                      return Row(
                        children: [
                          const SizedBox(width: 4),
                          Column(
                            children: [
                              Image.network(
                                currentProduct.Image,
                                height: 50,
                                width: 50,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            currentProduct.productName,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Spacer(),
                          Text(
                            'Rs.${currentProduct.productPrice}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (currentProduct.productQuantity > 0) {
                                    currentProduct.productQuantity--;
                                  }
                                });
                              },
                              icon: const Icon(Icons.remove)),
                          Text(
                            '${currentProduct.productQuantity}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  currentProduct.productQuantity++;
                                });
                              },
                              icon: const Icon(Icons.add)),
                        ],
                      );
                    }),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total:-', style: MyStyle),
                      Text('Rs.${getTotal()}', style: MyStyle),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  getTotal() => allProducts
      .fold(
      0,
          (int prev, element) =>
      prev + (element.productPrice * element.productQuantity))
      .toStringAsFixed(0);
}
