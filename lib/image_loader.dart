import 'package:flutter/material.dart';
import 'dart:math';

class ImageLoader extends StatefulWidget {
  @override
  _ImageLoaderState createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader>
    with SingleTickerProviderStateMixin {
  //SingleTickerProviderStateMixin is use for animation in single state
  //I defined three animations to manupulate the state of the Dots animation
  //around the cube logo

  AnimationController
      animationController; //controll the state of our animation.

  //rotation state animation
  Animation<double> rotation;

  //radius dots around the cube logo, this will push in towards the logo
  Animation<double> animationRadiusIn;

  //radius dots around the cube logo, this will push out off the logo
  Animation<double> animationRadiusOut;

  //Distnace at which dots will appear around the cube-logo
  final double initradius = 100.0;

  double radius = 0.0;

  //This where I initialize the animatiions and AnimationController
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    rotation = Tween<double>(
      /*
        The rotation will beging at the last quater of 0.75
        and end at maximun radius fo 1.0
      */
      begin: 0.75,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.75, 1.0, curve: Curves.linear),
    ));

    animationRadiusIn = Tween<double>(
      /*
        The rotation will beging at maximun radius fo 1.0
        and end atthe last quater of 0.75
      */
      begin: 1.0,
      end: 0.75,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.75, 1.0, curve: Curves.elasticIn),
    ));

    animationRadiusOut = Tween<double>(
      /*
        The rotation will beging at the last quater of 0.75
        and end at maximun radius fo 1.0
      */
      begin: 0.75,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.75, 1.0, curve: Curves.elasticInOut),
    ));

    /*
      The addListener function will evaluate anytime
      the animation make some progress. which is around 60 times
      in a single second.


    */
    animationController.addListener(() {
      setState(() {
        /* Only in the last qaurter of the animation the 
          "if" statement will take effect.
        */
        if (animationController.value >= 0.75 &&
            animationController.value <= 1.0) {
          radius = animationRadiusIn.value * initradius;
        } else if (animationController.value >= 0.0 &&

            /*
              Only in the fist quater of the animation the 
              "else if" statement will take effect.
            */
            animationController.value <= 0.25) {
          radius = animationRadiusOut.value * initradius;
        }
      });
    });

    animationController.repeat(); //animation starts here
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        /* Overall container which will contain
         the dots and cube logo at the center.
      */
        width: 200.0,
        height: 200.0,
        child: Center(
          child: RotationTransition(
            /*
              RotationTransition is the class the will rotate
              the dots around.
            */
            turns: rotation,
            child: Stack(
              //Stack class will take all the dots and cube logo

              children: <Widget>[
                Container(
                  /* 
                    Cube logo will rotate regardless of the dots.
                     the cube-logo is the main priority,
                     that is why I want it to rotate indepently.
                  */
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: AnimatedBuilder(
                    animation: animationController,
                    child: new Container(
                      width: 100.0,
                      height: 100.0,
                      child: Image.asset('images/changeflycube.png'),
                    ),
                    builder: (BuildContext context, Widget _widget) {
                      return Transform.rotate(
                        angle: animationController.value * 6.3,
                        child: _widget,
                      );
                    },
                  ),
                ),

                /*

                  Here, are the dots that will appear just around the cube-logo
                  to position the dots correctly, I used Transform.translate
                  which takes an offset value of x and y,
                  to move the dots away from it current position,
                  I used the trigonometric cos() and sin() to manipulate
                  the position of other dots so they appear in circular 
                  fashion around the cube-logo.

                 */

                //Ten dots that will appear around cube-logo
                //First
                Transform.translate(
                  offset: Offset(radius * cos(pi), radius * sin(pi)),
                  child: Dot(
                    radius: 5.0,
                    color: Colors.yellowAccent,
                  ),
                ),

                //Second dot
                Transform.translate(
                  offset: Offset(
                      radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                  child: Dot(
                    radius: 5.0,
                    color: Colors.blueAccent,
                  ),
                ),

                //Thirdt dot
                Transform.translate(
                  offset: Offset(
                      radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
                  child: Dot(
                    radius: 5.0,
                    color: Colors.redAccent,
                  ),
                ),

                //Fouth dot
                Transform.translate(
                  offset: Offset(
                      radius * cos(4 * pi / 4), radius * sin(4 * pi / 4)),
                  child: Dot(radius: 5.0, color: Colors.yellowAccent),
                ),

                //Fift dot
                Transform.translate(
                  offset: Offset(
                      radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
                  child: Dot(
                    radius: 5.0,
                    color: Colors.blueAccent,
                  ),
                ),

                //Sixth dot
                Transform.translate(
                  offset: Offset(
                      radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
                  child: Dot(
                    radius: 5.0,
                    color: Colors.redAccent,
                  ),
                ),

                //Seventh dot
                Transform.translate(
                  offset: Offset(
                      radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
                  child: Dot(
                    radius: 5.0,
                    color: Colors.yellowAccent,
                  ),
                ),

                //Eight dot
                Transform.translate(
                  offset: Offset(
                      radius * cos(8 * pi / 4), radius * sin(8 * pi / 4)),
                  child: Dot(
                    radius: 5.0,
                    color: Colors.blueAccent,
                  ),
                ),

                //Ninth dot
                Transform.translate(
                  offset: Offset(
                      radius * cos(9 * pi / 4), radius * sin(9 * pi / 4)),
                  child: Dot(
                    radius: 5.0,
                    color: Colors.redAccent,
                  ),
                ),

                //Tenth dot
                Transform.translate(
                  offset: Offset(
                      radius * cos(10 * pi / 4), radius * sin(10 * pi / 4)),
                  child: Dot(
                    radius: 5.0,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

//This is the class that will display dots around cube logo.

class Dot extends StatelessWidget {
  final double radius; //radius of the dots.
  final Color color; //colors of the dots.

  //Values of the dots initialize here in the constructor.
  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      //A circular container around the cube logo.
      child: Container(
        width: this.radius, //Render the color in the page.
        height: this.radius, //Render the radius in the page.

        /* For the dots to appear in a circular fashion,
           I used BoxDecoration and it shape,
           is BoxShape.circle.
        */
        decoration: BoxDecoration(
          color: this.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
