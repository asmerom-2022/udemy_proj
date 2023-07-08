import 'package:flutter/material.dart';
import 'package:udemy_prac/common/constants/constants.dart';

import '../../featured/components/widgets.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> dataList = ['Item 1', 'Item 2', 'Item 3'];
  List<String> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList.addAll(dataList);
  }

  void filterData(String searchTerm) {
    filteredList.clear();
    if (searchTerm.isEmpty) {
      filteredList.addAll(dataList);
    } else {
      for (var item in dataList) {
        if (item.toLowerCase().contains(searchTerm.toLowerCase())) {
          filteredList.add(item);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Page'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterData,
              decoration: const InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          TitleText('Top searches'),
          const Row(
            children: [
              categories(label: 'python class'),
              categories(label: 'AWS course'),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredList[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
