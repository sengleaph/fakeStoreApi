// import 'package:fake_store_api/fake_store_model.dart';
// import 'package:http/http.dart' as http;
//
// class ApiService{
//   // fetch api get
//
//   Future<List<FakeStore>> getApi() async{
//     final response = await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));
//
//     if (response.statusCode == 200) {
//       return fakeStoreFromJson(response.body);
//       //if the service are success the response data will get this status 200
//     } else {
//       throw Exception('Failed to load products');
//       //but if the service are not success the response data will return the exception in this case
//     }
//   }
// }
// //for normal application if they using the normal state they will write the service and fetch it class by class we call it the OOP