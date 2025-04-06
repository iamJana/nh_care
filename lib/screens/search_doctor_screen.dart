import 'package:flutter/material.dart';
import 'package:nh_care/utils/constants.dart';
import 'package:nh_care/widgets/doctor_card.dart';

class SearchDoctorScreen extends StatefulWidget {
  const SearchDoctorScreen({super.key});

  @override
  State<SearchDoctorScreen> createState() => _SearchDoctorScreenState();
}

class _SearchDoctorScreenState extends State<SearchDoctorScreen> {
  List<Widget> doctors = [
    DoctorCard(),
    DoctorCard(),
    DoctorCard(),
    DoctorCard(),
    DoctorCard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Doctor")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search Doctors',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                ),
              ),
              SizedBox(height: kDefaultHeight),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => doctors[index],
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: doctors.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
