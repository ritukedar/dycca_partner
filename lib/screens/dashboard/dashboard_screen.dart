import 'package:dycca_partner/custom_widget/appbar_widget.dart';
import 'package:dycca_partner/custom_widget/drawer_widget.dart';
import 'package:dycca_partner/custom_widget/tabbar_widget.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/screens/dashboard/tabs/professionals_screen.dart';
import 'package:dycca_partner/screens/dashboard/tabs/service_screen.dart';
import 'package:dycca_partner/screens/dashboard/tabs/upper_tabs.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController search = TextEditingController();

  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
         drawer: MyDrawer(),
      backgroundColor: whiteColour,
       
        appBar: AppBar(

            // leading: CircleAvatar(                radius: 5.0,
            //   backgroundImage: NetworkImage("https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: primaryColor),
          elevation: 0,
          title: headline,
          actions: const [
            Icon(Icons.messenger_outlined,color: neutral4Color,size: 20,),
            SizedBox(
              width: 15,
            ),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(Icons.notifications,color: neutral4Color,size: 25,)
            ),
          ],
        ),
         bottomNavigationBar: BottomNavigationBar(
             items: const <BottomNavigationBarItem>[
               BottomNavigationBarItem(
                   icon: Icon(Icons.home),
                   label: 'Home',
                   backgroundColor: Colors.white
               ),
               BottomNavigationBarItem(
                   icon: Icon(Icons.add_circle_outlined),
                   label: 'Create',
                   backgroundColor: Colors.white
               ),
               BottomNavigationBarItem(
                 icon: Icon(Icons.key),
                 label: 'Solutions',
                 backgroundColor: Colors.white,
               ),
             ],
             type: BottomNavigationBarType.shifting,
             currentIndex: _selectedIndex,
             selectedItemColor: primaryColor,
             showUnselectedLabels: true,
             unselectedItemColor: Colors.black45,
             iconSize: 40,
             onTap: _onItemTapped,
             elevation: 5
         ),

    body:UpperTabsScreen()
    );
  }
}
