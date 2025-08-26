import 'package:flutter/material.dart';
import 'package:weather_app/widgets/detaile_collumn.dart';

class WatherScreen extends StatefulWidget {
  const WatherScreen({super.key});

  @override
  State<WatherScreen> createState() => _WatherScreenState();
}

class _WatherScreenState extends State<WatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF676BD0),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Text(
                  "Guelma",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "35.07 °C",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Clouds",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Text(
                //   "${DateTime.now().day}",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 17,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/wather.png"),
                ),

                Container(
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 78, 82, 188),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    spacing: 30,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DetaileCollumn(
                            icon: Icons.wind_power,
                            value: 4.08,
                            unity: "km/h",
                            name: "Wind",
                            color: Colors.white,
                          ),
                          DetaileCollumn(
                            icon: Icons.sunny,
                            value: 35.07,
                            unity: "°C",
                            name: "Max",
                            color: Colors.white,
                          ),
                          DetaileCollumn(
                            icon: Icons.wind_power,
                            value: 35.07,
                            unity: "°C",
                            name: "Min",
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DetaileCollumn(
                            icon: Icons.water_drop_rounded,
                            value: 29,
                            unity: "%",
                            name: "Humidity",
                            color: Colors.orange,
                          ),
                          DetaileCollumn(
                            icon: Icons.wind_power,
                            value: 1008,
                            unity: "hPa",
                            name: "Pressure",
                            color: Colors.orange,
                          ),
                          DetaileCollumn(
                            icon: Icons.bar_chart,
                            value: 1008,
                            unity: "m",
                            name: "Sea-Level",
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
