import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_prac/common/constants/constants.dart';

import '../../common/colors.dart';
import '../../featured/components/widgets.dart';


class MylearningPage extends ConsumerStatefulWidget {
  const MylearningPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MylearningPageState();
}

class _MylearningPageState extends ConsumerState<MylearningPage> {
  Color _selectedButtonColor = sColor;
  String _selectedButtonText = "";
  Widget _selectedWidget = TitleText('my learning page widget');

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64, right: 16, left: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
                // width: 80,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: _selectedButtonText == "Today"
                        ? MaterialStateProperty.all(pColor)
                        : MaterialStateProperty.all(sColor),
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedButtonColor = pColor;
                      _selectedButtonText = "All";
                      _selectedWidget = TitleText('All');
                    });
                  },
                  child: Text("All",
                      style: Theme.of(context).textTheme.titleSmall),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: _selectedButtonText == "Downloaded"
                        ? MaterialStateProperty.all(pColor)
                        : MaterialStateProperty.all(sColor),
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedButtonText = "Downloaded";
                      _selectedButtonColor = sColor;
                      _selectedWidget = TitleText('Downloaded');
                    });
                  },
                  child: Text("Downloaded",
                      style: Theme.of(context).textTheme.titleSmall),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: _selectedButtonText == "Favorites"
                        ? MaterialStateProperty.all(pColor)
                        : MaterialStateProperty.all(sColor),
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedButtonText = "Favorites";
                      _selectedButtonColor = pColor;
                      _selectedWidget = const Recomended_widget(title: 'test');
                    });
                  },
                  child: Text("Favorites",
                      style: Theme.of(context).textTheme.titleSmall),
                ),
              ),
            ],
          ),
          const Text(
            'this is my learning page',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
