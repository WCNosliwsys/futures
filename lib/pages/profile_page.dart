import 'package:flutter/material.dart';

import '../models/profile_model.dart';
import '../models/trabajo_model.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileModel? profileFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateProfileData().then((value) {
      setState(() {
        profileFuture = value;
      });
    });
  }

  Future<ProfileModel> generateProfileData() async {
    // Simular una carga de datos
    await Future.delayed(Duration(seconds: 2));

    // Generar datos falsos
    ProfileModel profile = ProfileModel(
      name: "Elliot Thomponn",
      profesion: "Desarrollador móvil",
      likes: 23,
      folowers: 980,
      rating: 8.9,
      sobreMi:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam at eleifend libero, eu rhoncus orci. Nam tortor leo, feugiat at orci ac, finibus elementum nisi. Phasellus",
      trabajosList: [
        TrabajoModel(
          posicion: "Desarrollador Senior",
          empresa: "TATA",
          imageUrl:
              "https://images.pexels.com/photos/1293120/pexels-photo-1293120.jpeg?auto=compress&cs=tinysrgb&w=600",
        ),
        TrabajoModel(
          posicion: "Desarrollador Senior",
          empresa: "TATA",
          imageUrl:
              "https://images.pexels.com/photos/1293120/pexels-photo-1293120.jpeg?auto=compress&cs=tinysrgb&w=600",
        ),
      ],
    );

    return profile;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeigth = MediaQuery.of(context).size.height;
    double screnWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: screenHeigth,
              width: screnWidth,
              color: Colors.grey.shade200,
              alignment: Alignment.topCenter,
              child: Container(
                height: 150,
                width: screnWidth - 40,
                decoration: BoxDecoration(
                  color: Color(0xff808FAC),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(top: 40),
                      width: screnWidth - 80,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(0, 4),
                            blurRadius: 12,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.network(
                                  "https://imgv3.fotor.com/images/gallery/a-man-profile-picture-with-blue-and-green-background-made-by-LinkedIn-Profile-Picture-Maker.jpg",
                                  width: screnWidth / 5,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      profileFuture != null ? profileFuture!.name : "Nombre del perfil no disponible",
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      profileFuture != null ? profileFuture!.profesion : "",
                                      style: TextStyle(color: Colors.black38),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Likes",
                                              style: TextStyle(
                                                color: Colors.black38,
                                              ),
                                            ),
                                            Text(
                                             profileFuture != null ? profileFuture!.likes.toString() : "",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text("Folowers"),
                                            Text(profileFuture != null ? profileFuture!.folowers.toString() : ""),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text("Rating"),
                                            Text(profileFuture != null ? profileFuture!.rating.toString() : ""),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 2, color: Colors.black26),
                                        borderRadius: BorderRadius.circular(10)),
                                    alignment: Alignment.center,
                                    child: Text("Chat"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration:
                                        BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Follow",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text("Notable works"),
                  Text("Basado en la experiencia profesional"),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              "https://images.pexels.com/photos/1293120/pexels-photo-1293120.jpeg?auto=compress&cs=tinysrgb&w=600",
                              width: screnWidth / 2.6,
                              height: 110,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("DeSARROLLADOR sENIOR"),
                          SizedBox(
                            height: 8,
                          ),
                          Text("TATA")
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              "https://images.pexels.com/photos/1293120/pexels-photo-1293120.jpeg?auto=compress&cs=tinysrgb&w=600",
                              width: screnWidth / 2.6,
                              height: 110,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("DeSARROLLADOR sENIOR"),
                          SizedBox(
                            height: 8,
                          ),
                          Text("TATA")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: screnWidth - 50,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          padding: EdgeInsetsDirectional.all(8),
                          child: Text("Sobre mi"),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam at eleifend libero, eu rhoncus orci. Nam tortor leo, feugiat at orci ac, finibus elementum nisi. Phasellus",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
