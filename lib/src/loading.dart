import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading {

  static final Function spin = (Color val) { 
    return Center(
      child: SpinKitDoubleBounce(
        color: val,
        size: 30,
        duration: Duration(milliseconds: 500),
      ),
    );
  };
}