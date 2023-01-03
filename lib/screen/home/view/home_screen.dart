import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/screen/home/modal/WeatherClass.dart';
import 'package:weather/screen/home/provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProvidertrue;
  HomeProvider? homeProviderfalse;

  @override
  Widget build(BuildContext context) {
    homeProvidertrue = Provider.of<HomeProvider>(context, listen: true);
    homeProviderfalse = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("City Name"),
            backgroundColor: Colors.black,
          ),
          drawer: Drawer(
            child: Column(
              children: [
                TextButton(onPressed: (){}, child: Text("Surat")),
                TextButton(onPressed: (){}, child: Text("Mumbai")),
                TextButton(onPressed: (){}, child: Text("Surat")),
                TextButton(onPressed: (){}, child: Text("Surat")),
                TextButton(onPressed: (){}, child: Text("Surat")),

              ],
            ),
          ),
          body: FutureBuilder<WeatherClass>(
            future: homeProviderfalse!.apicall(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              if (snapshot.hasData) {
                WeatherClass weatherdata = snapshot!.data!;

                return Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      child: Image.network("https://images.unsplash.com/photo-1516912481808-3406841bd33c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8d2VhdGhlcnxlbnwwfHwwfHw%3D&w=1000&q=80",fit: BoxFit.fill,),
                    ),
                    SingleChildScrollView(
                      child: Column(children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "☀",
                                  style: TextStyle(fontSize: 40),
                                ),
                                Text(
                                  "${DateTime.now().day}"
                                  " - "
                                  "${DateTime.now().month}"
                                  " - "
                                  "${DateTime.now().year}",
                                  style:
                                      TextStyle(color: Colors.white, fontSize: 25),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${weatherdata.main!.temp}",
                                  style:
                                      TextStyle(fontSize: 50, color: Colors.white),
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  "C",
                                  style:
                                      TextStyle(fontSize: 50, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width * 0.7,
                              width: MediaQuery.of(context).size.width * 0.98,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(width: 3, color: Colors.white),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                      child: Icon(
                                                    Icons.thermostat,
                                                    color: Colors.white,
                                                    size: 70,
                                                  )),
                                                  Expanded(
                                                      child: Text(
                                                    "${weatherdata.main!.temp} C",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  )),
                                                ],
                                              ),
                                              Text(
                                                "Temperature",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        )),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Expanded(
                                            child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                      child: Icon(
                                                    Icons.cloud_done,
                                                    color: Colors.white,
                                                    size: 70,
                                                  )),
                                                  Expanded(
                                                    child: Text(
                                                      "${weatherdata.clouds!.all}",
                                                      style: TextStyle(
                                                          color: Colors.white,fontSize: 18),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "Clouds",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Expanded(
                                                          child: Icon(
                                                            Icons.wind_power,
                                                            color: Colors.white,
                                                            size: 70,
                                                          )),
                                                      Expanded(
                                                          child: Text(
                                                            "${weatherdata.wind!.speed} C",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20),
                                                          )),
                                                    ],
                                                  ),
                                                  Text(
                                                    "Wind Speed",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                            )),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Expanded(
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Expanded(
                                                          child: Icon(
                                                            Icons.assistant_navigation,
                                                            color: Colors.white,
                                                            size: 70,
                                                          )),
                                                      Expanded(
                                                        child: Text(
                                                          "${weatherdata.wind!.deg}",
                                                          style: TextStyle(
                                                              color: Colors.white,fontSize: 18),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "Wind Degree",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width * 0.7,
                              width: MediaQuery.of(context).size.width * 0.98,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(width: 3, color: Colors.white),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(children: [
                                          Text("Humidity",style: TextStyle(fontSize: 18,color: Colors.white),),
                                          SizedBox(height: 10,),
                                          Icon(Icons.water_drop,size: 50,color: Colors.white),
                                          SizedBox(height: 10,),
                                          Text("${weatherdata.main!.humidity}%",style: TextStyle(fontSize: 25,color: Colors.white),)
                                        ],),
                                      ), Expanded(
                                        child: Column(children: [
                                          Text("Visibility",style: TextStyle(fontSize: 18,color: Colors.white),),
                                          SizedBox(height: 10,),
                                          Icon(Icons.remove_red_eye,size: 50,color: Colors.white),
                                          SizedBox(height: 10,),
                                          Text("${weatherdata.visibility}",style: TextStyle(fontSize: 25,color: Colors.white),)
                                        ],),
                                      ), Expanded(
                                        child: Column(children: [
                                          Text("FeelsLike",style: TextStyle(fontSize: 18,color: Colors.white),),
                                          SizedBox(height: 10,),
                                          Icon(Icons.sunny_snowing,size: 50,color: Colors.white),
                                          SizedBox(height: 10,),
                                          Text("${weatherdata.main!.feelsLike}",style: TextStyle(fontSize: 25,color: Colors.white),)
                                        ],),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ],
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          )),
    );
  }
}
