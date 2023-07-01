import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_prac/common/constants/constants.dart';
import 'package:udemy_prac/featured/screen/featured_page.dart';

import '../../common/colors.dart';

// class MylearningPage extends ConsumerStatefulWidget {
//   MylearningPage({super.key});

//   Color _selectedButtonColor = sColor;
//   String _selectedButtonText = "";
//   Widget _selectedWidget = TitleText('my learning page widget');

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Padding(
//       padding: EdgeInsets.only(top: 64, right: 16, left: 16),
//       child: Column(
//         children: [
//           Text(
//             'this is my learning page',
//             style: TextStyle(fontSize: 16, color: Colors.white),
//           ),
//             Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     SizedBox(
//                       height: 40,
//                       // width: 80,
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor: _selectedButtonText == "Today"
//                               ? MaterialStateProperty.all(pColor)
//                               : MaterialStateProperty.all(sColor),
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _selectedButtonColor = pColor;
//                             _selectedButtonText = "Today";
//                             _selectedWidget = Analytictoday();
//                           });
//                         },
//                         child: Text("Today",
//                             style: Theme.of(context).textTheme.titleSmall),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     SizedBox(
//                       height: 40,
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor: _selectedButtonText == "last week"
//                               ? MaterialStateProperty.all(pColor)
//                               : MaterialStateProperty.all(sColor),
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _selectedButtonText = "last week";
//                             _selectedButtonColor = sColor;
//                             _selectedWidget = Analyticlastweek();
//                           });
//                         },
//                         child: Text("last week",
//                             style: Theme.of(context).textTheme.titleSmall),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     SizedBox(
//                       height: 40,
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor: _selectedButtonText == "last month"
//                               ? MaterialStateProperty.all(pColor)
//                               : MaterialStateProperty.all(sColor),
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _selectedButtonText = "last month";
//                             _selectedButtonColor = pColor;
//                             _selectedWidget = Analyticlastmonth();
//                           });
//                         },
//                         child: Text("last month",
//                             style: Theme.of(context).textTheme.titleSmall),
//                       ),
//                     ),
//                   ],
//                 ),
//         ],
//       ),
//     );
//   }
// }

class MylearningPage extends ConsumerStatefulWidget {
  const MylearningPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MylearningPageState();
}

class _MylearningPageState extends ConsumerState<MylearningPage> {
  Color _selectedButtonColor = sColor;
  String _selectedButtonText = "";
  Widget _selectedWidget = TitleText('my learning page widget');

  // @override
  // Widget build(BuildContext context) {
  //   return Container();
  // }
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
