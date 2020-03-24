import 'package:flutter/material.dart';
import 'package:foodget/models/models.dart';
import 'package:foodget/screens/meal_detail.dart';
import 'package:foodget/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  HomeScreen({Key key, @required this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState(user: user);
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final User user;

  _HomeScreenState({@required this.user});

  static List<Color> appColors = [
    Colors.pink[300],
    Colors.amber,
    Colors.indigo[300],
  ];

  static var month = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  static List<String> day = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  static int cardIndex = 0;
  ScrollController scrollController;
  Color currentColor = appColors[cardIndex];
  static DateTime now = DateTime.now();
  static var numDay = now.day;
  String curDay = day[(numDay - 1) % 7];
  String curMonth = month[now.month - 1];

  int navIndex = 1;

  var cardsList = [
    CardItemModel("Breakfast", Icons.check_circle, 9, false),
    CardItemModel("Lunch", Icons.check_circle, 12, false),
    CardItemModel("Dinner", Icons.check_circle, 7, true),
  ];

  AnimationController animationController;
  ColorTween colorTween;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    // _controller = AnimationController(duration: expandDuration, vsync: this);

    // super.initState();
    // _controller = new AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentColor,
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue[100], currentColor],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 23),
                UserView(user: user),
                SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 16.0),
                      child: Text(
                        "$curDay, $curMonth $numDay",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500,
                            fontSize: 27),
                      ),
                    ),
                    Container(
                      height: 350.0,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, position) {
                          return GestureDetector(
                            child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MealDetail(
                                        mealType:
                                            cardsList[position].cardTitle,
                                        color: appColors[position],
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(15.0)),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Column(
                                    // crossAxisAlignment:CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Icon(
                                              cardsList[position].icon,
                                              color: cardsList[position]
                                                          .taskCompletion ==
                                                      true
                                                  ? appColors[position]
                                                  : Colors.grey,
                                              size: 45,
                                            ),
                                            Icon(
                                              Icons.more_vert,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 4.0),
                                              child: Text(
                                                "${cardsList[position].tasksRemaining} Tasks",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 4.0),
                                              child: Hero(
                                                tag: cardsList[position].cardTitle,
                                                child: Text(
                                                  "${cardsList[position].cardTitle}",
                                                  style:
                                                      TextStyle(fontSize: 28.0),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: LinearProgressIndicator(
                                                value: cardsList[position]
                                                            .taskCompletion ==
                                                        true
                                                    ? 1
                                                    : 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                              ),
                            // onTap: () {
                            //   Navigator.of(context).push(
                            //     MaterialPageRoute(
                            //       builder: (context) {
                            //         return MealDetail(
                            //           mealType: cardsList[position].cardTitle,
                            //           color: appColors[position],
                            //           );
                            //       },
                            //     ),
                            //   );
                            // },
                            onHorizontalDragEnd: (details) {
                              animationController = AnimationController(
                                  duration: Duration(milliseconds: 275),
                                  vsync: this);
                              curvedAnimation = CurvedAnimation(
                                  parent: animationController,
                                  curve: Curves.fastOutSlowIn);
                              animationController.addListener(() {
                                setState(() {
                                  currentColor =
                                      colorTween.evaluate(curvedAnimation);
                                });
                              });

                              if (details.velocity.pixelsPerSecond.dx > 0) {
                                if (cardIndex > 0) {
                                  cardIndex--;
                                  colorTween = ColorTween(
                                      begin: currentColor,
                                      end: appColors[cardIndex]);
                                }
                              } else {
                                if (cardIndex < 2) {
                                  cardIndex++;
                                  colorTween = ColorTween(
                                      begin: currentColor,
                                      end: appColors[cardIndex]);
                                }
                              }
                              setState(() {
                                scrollController.animateTo(
                                    (cardIndex) *
                                        MediaQuery.of(context).size.width /
                                        1.5,
                                    duration: Duration(milliseconds: 350),
                                    curve: Curves.fastOutSlowIn);
                              });

                              colorTween.animate(curvedAnimation);

                              animationController.forward();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            )),
          )),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey[800],
        elevation: 0,
        backgroundColor: Colors.transparent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: navIndex,
        selectedItemColor: Colors.grey[200],
        onTap: (int newIndex) {
          setState(() {
            navIndex = newIndex;
          });
        },
      ),
    );
  }
}
