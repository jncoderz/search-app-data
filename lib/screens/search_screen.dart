import 'package:custom_search/data/product_list.dart';
import 'package:custom_search/models/product_model.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = "";
  List<ProductModel> filteredLists = [];

  @override
  Widget build(BuildContext context) {
    filteredLists = productLists
        .where((product) => product.title.toLowerCase().contains(searchText))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Search Screen"),
      ),
      body: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              setState(() {
                searchText=value.toLowerCase();
              });
            },
            decoration: InputDecoration(
                hintText: "Search", prefixIcon: Icon(Icons.search)),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: filteredLists.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(filteredLists[index].image),
                  ),
                  title: Text(filteredLists[index].title),
                  subtitle: Text(filteredLists[index].description),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
