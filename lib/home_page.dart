import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'fake_store_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //first we have to create a model for data call fake store api model and then we have to call the data
  //from the model as the list that you ready research in the collection framework

  late Future<List<FakeStore>> products;

  //but about this code i will write the application by using the service inside this class cuz
  //i hope that you will understand easier than make the code using the OOP from the service class
  Future<List<FakeStore>> getApi() async {
    final response =
        await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));

    if (response.statusCode == 200) {
      return fakeStoreFromJson(response.body);
      //if the service are success the response data will get this status 200
    } else {
      throw Exception('Failed to load products');
      //but if the service are not success the response data will return the exception in this case
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    products = getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF05A7E),
        title: const Text("GET API"),
      ),
      body: FutureBuilder<List<FakeStore>>(
        future: products,
        //product, we have to call it from the list we declare above
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            //if the code we are loading or wrong on some syntax or else it will response some loading circle
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            //if the code we are write are error on somewhare it display the error
            //and now i use print to show the error inside the terminal inside the machine
            print(snapshot.error);
            return const Center(child: Text('Error loading products'));
            // but it is only for development mode that we also can use other style like Kdebug... to print the error but for
            //production mode we have to delete or commanded on it
          } else if (snapshot.hasData) {
            //now about this point it will be the special place like you and me xd, kidding
            // it was used for response on the screen that if it was return status 200,
            // it will work on this case.
            return ListView.builder(
                itemCount: snapshot.data!.length,
                //snapshot.data is response to the data that we have to get from the api by using length
                //to shot all the length in the data on the screen.
                itemBuilder: (context, index) {
                  final product = snapshot.data![index];
                  //declare the method or ... nhom plix bat hz for call when we get the data
                  return ListTile(
                    leading:Image.network(product.category!.image!),
                    //leading part, vea use nv place ឆ្វេងដៃ ke
                    title: Text(product.title ?? 'No Title'),
                    //title, using to display the data name or title product
                    subtitle: Text('Price: \$${product.price ?? 0}'),
                  );
                });
          } else {
            return const Center(child: Text('No products found.'));
          }
        },
      ),
    );
  }
}