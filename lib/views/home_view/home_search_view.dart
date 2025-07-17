import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class HomeSearchView extends StatelessWidget {
  const HomeSearchView({super.key});
Widget _service_btn(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
             
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
                   Icon(icon),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          side: BorderSide(
              color: const Color.fromARGB(255, 210, 209, 209), width: 1),
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              SizedBox(
                width: 350,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400),
                      hintText: 'What do you want to eat?',
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 220, 220, 220)),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 220, 220, 220)),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
                    ),
                      IconButton(onPressed: (){}, 
           icon: Icon(Icons.clear_outlined,color: Colors.black,),)
     
            ],
          ),
          SizedBox(height: 7,),
       Padding(
         padding: const EdgeInsets.only(
          left: 10,
         
          ),
          
         child: Text("History",
         style: TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600
         ),),
       ),

SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [
      _service_btn('Keyword', Icons.clear),
      _service_btn('Keyword', Icons.clear),
      _service_btn('Keyword', Icons.clear),
      _service_btn('Keyword', Icons.clear),
      _service_btn('Keyword', Icons.clear),
  
    ],
  
  ),
)
        ],
      ),
    );
  }
}
