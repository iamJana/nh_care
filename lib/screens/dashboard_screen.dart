// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:nh_care/utils/constants.dart';
import 'package:nh_care/widgets/action_widget.dart';
import 'package:nh_care/widgets/section_widget.dart';

/*
1. AppBar 
2. Search Widget with the custom delegate
3. Action based widgets with horizantal scrollview
4. Banner
5. Gridview for the specific diseases with page indication
6. BottomNavigation


 */

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello User'), centerTitle: false),
      drawer: Drawer(),
      body: _buildBody(context),
      // bottomNavigationBar: BottomNavigationBar(items: []),
    );
  }
}

Widget _buildBody(BuildContext context) {
  List<ActionWidget> actionWidgets = [
    ActionWidget(
      icon: Icon(Icons.calendar_month),
      actionName: "Book Appointment",
    ),
    ActionWidget(
      icon: Icon(Icons.health_and_safety),
      actionName: "Health Checkup",
    ),
    ActionWidget(icon: Icon(Icons.label), actionName: "Book Tests"),
    ActionWidget(icon: Icon(Icons.checklist), actionName: "My Bookings"),
    ActionWidget(
      icon: Icon(Icons.vaccines_sharp),
      actionName: "Vaccine Immunization",
    ),
  ];

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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

          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: actionWidgets.length,
              itemBuilder:
                  (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(width: 100, child: actionWidgets[index]),
                  ),
            ),
          ),

          SizedBox(height: kDefaultHeight),

          // _buildBanner(context),
          _buildSection(context),
          SizedBox(height: kDefaultHeight),
        ],
      ),
    ),
  );
}

Widget _buildBanner(BuildContext context) {
  return CarouselView(
    itemExtent: 1,
    children: [
      AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'https://img.freepik.com/free-photo/medium-shot-doctor-explaining-diagnosis-patient_23-2148882204.jpg',
          ),
        ),
      ),
    ],
  );
}

Widget _buildSection(BuildContext context) {
  List<SectionWidget> sections = [
    SectionWidget(icon: Icon(Icons.monitor_heart), name: 'Cardiologist'),
    SectionWidget(icon: Icon(Icons.healing), name: 'Dentist'),
    SectionWidget(icon: Icon(Icons.visibility), name: 'Eye Specialist'),
    SectionWidget(icon: Icon(Icons.child_care), name: 'Pediatrician'),
    SectionWidget(icon: Icon(Icons.psychology), name: 'Psychiatrist'),
    SectionWidget(icon: Icon(Icons.spa), name: 'Dermatologist'),
    SectionWidget(icon: Icon(Icons.woman), name: 'Gynecologist'),
    SectionWidget(icon: Icon(Icons.sports_mma), name: 'Orthopedic'),
    SectionWidget(icon: Icon(Icons.earbuds), name: 'ENT'),
  ];

  List<List<SectionWidget>> sectionChunks = [];
  for (int i = 0; i < sections.length; i += 6) {
    sectionChunks.add(
      sections.sublist(i, (i + 6) > sections.length ? sections.length : i + 6),
    );
  }

  PageController _pageController = PageController();
  int currentPage = 0;

  return StatefulBuilder(builder: (context, setState) {
    return Column(
      children: [
        SizedBox(
          height: 300, // adjust as needed
          child: PageView.builder(
            controller: _pageController,
            itemCount: sectionChunks.length,
            onPageChanged: (index) => setState(() => currentPage = index),
            itemBuilder: (context, pageIndex) {
              return GridView.count(
                crossAxisCount: 3,
                physics: NeverScrollableScrollPhysics(),
                children: sectionChunks[pageIndex],
                shrinkWrap: true,
              );
            },
          ),
        ),
        // SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(sectionChunks.length, (index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              width: currentPage == index ? 12 : 8,
              height: currentPage == index ? 12 : 8,
              decoration: BoxDecoration(
                color: currentPage == index ? Colors.blue : Colors.grey,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    );
  });
}


