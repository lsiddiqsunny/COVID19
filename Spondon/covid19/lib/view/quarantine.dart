import 'package:flutter/material.dart';

class Quarantine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test Center and Quarantine'),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10,0,10,0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '\nInstitutional Quarantine inside Dhaka',
                  style: TextStyle(fontSize: 20),
                ),
                Text('\n1. Mugda General Hospital'),
                Text('\n2. Kuwait Moitree Hospital'),
                Text('\n3. Mohanagar Hospital'),
                Text('\n4. Kurmitola General Hospital\n'),
                Text(
                  'Probable Institutional Quarantine outside Dhaka :',
                  style: TextStyle(fontSize: 20),
                ),
                Text('\n1. Faridpur Medical College,Faridpur,Dhaka Division'),
                Text(
                    '\n2. Shahid Syed Nazrul Islam Medical College,Kishoreganj,Dhaka Division'),
                Text('\n3. Faridpur Medical College,Faridpur,Dhaka Division'),
                Text('\n4. Faridpur Medical College,Faridpur,Dhaka Division'),
                Text('\n5. Faridpur Medical College,Faridpur,Dhaka Division'),
                Text('\n6. Faridpur Medical College,Faridpur,Dhaka Division'),
                Text('\n7. Faridpur Medical College,Faridpur,Dhaka Division'),
                Text('\n8. Faridpur Medical College,Faridpur,Dhaka Division'),
                Text('\n9. Faridpur Medical College,Faridpur,Dhaka Division'),
                Text('\n10. Faridpur Medical College,Faridpur,Dhaka Division'),
                Text('\n11. Faridpur Medical College,Faridpur,Dhaka Division'),
                Text('\n12. Faridpur Medical College,Faridpur,Dhaka Division'),
                Text('\n13. Faridpur Medical College,Faridpur,Dhaka Division'),
                Text('\n14. Faridpur Medical College,Faridpur,Dhaka Division'),
                Text('\n15. Faridpur Medical College,Faridpur,Dhaka Division'),
                Text('\n16. Faridpur Medical College,Faridpur,Dhaka Division'),
                Text('\n17. Faridpur Medical College,Faridpur,Dhaka Division'),
                Text('\n18. Faridpur Medical College,Faridpur,Dhaka Division'),
              ],
            ),
          ),
        ));
  }
}
