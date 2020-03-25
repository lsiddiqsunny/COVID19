import 'package:flutter/material.dart';

class Quarantine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test Center and Quarantine'),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                    '\n2. Shahid Syed Nazrul Islam Medical College, Kishoreganj , Dhaka Division'),
                Text(
                    '\n3. Sheikh Sayera Khatun Medical College, Gopalganj , Dhaka Division'),
                Text(
                    '\n4. Shaheed Tajuddin Ahmad Medical College, Gazipur , Dhaka Division'),
                Text(
                    '\n5. Sheikh Hasina Medical College, Tangail, Dhaka Division'),
                Text(
                    '\n6. Mymensingh Medical College, Mymensingh, Mymensingh Division'),
                Text(
                    '\n7. Sheikh Hasina Medical College,Jamalpur,Mymensingh division'),
                Text(
                    '\n8. Netrokona Medical College, Netrokona, Mymensingh division'),
                Text(
                    '\n9. Chittagong Medical College, Chittagong, Chittagong division'),
                Text(
                    '\n10. Chandpur Medical College, Chandpur, Chittagong division'),
                Text(
                    '\n11. Abdul Malek Ukil Medical College, Noakhali, Chittagong division'),
                Text(
                    '\n12. Cox’s Bazar Medical College, Cox’s Bazar ,Chittagong division'),
                Text(
                    '\n13. Comilla Medical College, Comilla ,Chittagong division'),
                Text(
                    '\n14. Rangamati Medical College, Rangamati, Chittagong division'),
                Text('\n15. Khulna Medical College, Khulna, Khulna Division'),
                Text('\n16. Kushtia Medical College, Kushtia, Khulna Division'),
                Text('\n17. Jessore Medical College, Jessore, Khulna Division'),
                Text('\n18. Magura Medical College, Magura, Khulna Division'),
                Text(
                    '\n19. Satkhira Medical College, Satkhira , Khulna Division'),
                Text(
                    '\n20. Rajshahi Medical College, Rajshahi, Rajshahi division'),
                Text(
                    '\n21. Shaheed Ziaur Rahman Medical College, Bogra, Rajshahi division'),
                Text('\n22. Pabna Medical College, Pabna, Rajshahi division'),
                Text(
                    '\n23. Naogaon Medical College, Naogaon, Rajshahi division'),
                Text(
                    '\n24.Shaheed M. Monsur Ali Medical College, Sirajganj, Rajshahi division'),
                Text(
                    '\n25.Sylhet MAG Osmani Medical College, Sylhet, Sylhet division'),
                Text(
                    '\n26.Sheikh Hasina Medical College, Habiganj, Sylhet division'),
                Text('\n27.Rangpur Medical College, Rangpur, Rangpur division'),
                Text(
                    '\n28.M Abdur Rahim Medical College, Dinajpur, Rangpur division'),
                Text(
                    '\n29.Nilphamari Medical College, Nilphamari, Rangpur division'),
                Text(
                    '\n30.Patuakhali Medical College, Patuakhali, Barisal division'),
                Text(
                    '\n31.Sher-e-Bangla Medical College ,Barisal, Barisal division'),
              ],
            ),
          ),
        ));
  }
}
