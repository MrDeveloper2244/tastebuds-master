import 'package:flutter/material.dart';

class CountrySelector extends StatefulWidget {
  const CountrySelector({Key? key}) : super(key: key);

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<String> countries = [
    'Pakistan',
    'India',
    'UK',
    'USA',
    'UAE',
    'Canada',
    'Germany',
    'Australia'
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void toggleList() {
    setState(() {
      isExpanded = !isExpanded;
      isExpanded ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: toggleList,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
          child: const Text(
            'Choose Country',
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizeTransition(
          sizeFactor: _animation,
          axisAlignment: -1.0,
          child: Container(
            height: 300,
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: countries.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(countries[i]),
                onTap: () {
                  print("Selected: ${countries[i]}");
                  toggleList();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
