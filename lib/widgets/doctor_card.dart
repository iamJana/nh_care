import 'package:flutter/material.dart';
import 'package:nh_care/utils/constants.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white70),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(radius: 30, child: Text('A')),
              SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dr. Shobha B"),
                    Text(
                      'MBBS, MD (Paediatrics) , DNB PAEDIATRIC ONCOLOGY, HAEMATO-ONCOLOGY & BMT | Consultant',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    Row(children: [Icon(Icons.language), Text("English")]),

                    SizedBox(height: kDefaultHeight),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.location_on),
              Text(
                "Mazumdar Shaw Medical Centre, Bangalore",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ],
          ),
          SizedBox(height: kDefaultHeight),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _availablityWidget("8th Apr"),
              _availablityWidget("Tomorrow"),
            ],
          ),
          SizedBox(height: kDefaultHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _button(
                Icon(Icons.person, color: Colors.greenAccent),
                'Hospital Visit',
              ),
              _button(
                Icon(Icons.video_call, color: Colors.greenAccent),
                'Video Consultant',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _availablityWidget(String date) {
  return Row(
    children: [
      Text("Next available:"),
      Text(date, style: TextStyle(color: Colors.deepOrangeAccent.shade100)),
    ],
  );
}

Widget _button(Icon icon, String consultantMode) {
  return OutlinedButton(
    style: ButtonStyle(
      side: WidgetStatePropertyAll(BorderSide(color: Colors.greenAccent)),
    ),
    onPressed: () {},
    child: Row(children: [icon, Text(consultantMode)]),
  );
}
