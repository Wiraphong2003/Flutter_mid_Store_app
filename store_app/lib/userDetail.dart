import 'package:flutter/material.dart';
import 'package:store_app/services.dart';

import 'models/user.dart'; // Import the Services class

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      // Call the getUsers method to fetch user data
      future: Services.getUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for data, display a loading indicator
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          // If there's an error fetching data, display an error message
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          // If data is successfully fetched, display the user data
          final user = snapshot.data;

          return Scaffold(
            body: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // จัดวางในแนวนอน (X-axis) ให้อยู่กึ่งกลาง
                    crossAxisAlignment: CrossAxisAlignment
                        .center, // จัดวางในแนวตั้ง (Y-axis) ให้อยู่กึ่งกลาง
                    children: [
                      Column(
                        children: [
                          ClipOval(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_2_rounded,
                                  color: Color(0xFFFF9800),
                                  size: 170,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '${user?.name.firstname}   ${user?.name.lastname}',
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                      'Username ${user?.username}'), // Display other user details here as needed
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Card(
                          elevation: 4,
                          margin: const EdgeInsets.all(1),
                          child: Container(
                            width: 355,
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Use a Column to stack the icon and text
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center, // Center vertically
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Email icon in the middle-left
                                    Icon(Icons.email,
                                        size:
                                            40), // You can change the icon as needed
                                  ],
                                ),

                                // Spacer to create some space between the icon and text
                                const SizedBox(width: 10),

                                // Column to stack "Email" and "user.email" text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Email", // Text "Email" at the top
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${user?.email}', // Replace with your actual email data
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Card(
                          elevation: 4,
                          margin: const EdgeInsets.all(1),
                          child: Container(
                            width: 355,
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Use a Column to stack the icon and text
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center, // Center vertically
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Email icon in the middle-left
                                    Icon(Icons.call,
                                        size:
                                            40), // You can change the icon as needed
                                  ],
                                ),

                                // Spacer to create some space between the icon and text
                                const SizedBox(width: 10),

                                // Column to stack "Email" and "user.email" text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Phone Number", // Text "Email" at the top
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${user?.phone}', // Replace with your actual email data
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Card(
                          elevation: 4,
                          margin: const EdgeInsets.all(1),
                          child: Container(
                            width: 355,
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Use a Column to stack the icon and text
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center, // Center vertically
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Email icon in the middle-left
                                    Icon(Icons.location_on,
                                        size:
                                            40), // You can change the icon as needed
                                  ],
                                ),

                                // Spacer to create some space between the icon and text
                                const SizedBox(width: 10),

                                // Column to stack "Email" and "user.email" text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Uesr Address", // Text "Email" at the top
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Number: ${user?.address.number}', // Replace with your actual email data
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      'City: ${user?.address.city}', // Replace with your actual email data
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      'Street: ${user?.address.street}', // Replace with your actual email data
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      'Zipcode: ${user?.address.zipcode}', // Replace with your actual email data
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Latitud: ${user?.address.geolocation.lat}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Latitud: ${user?.address.geolocation.long}'),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
