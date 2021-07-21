import 'package:flutter/material.dart';
// import '../chart/chart_list.dart';
// import '../chart/chart.dart';
// import 'package:covid/chart/chart.dart';

class Details extends StatelessWidget {
  final affected;
  final death;
  final recovered;
  final active;
  final newdeath;
  final flag;
  Details(
      {this.active,
      this.affected,
      this.death,
      this.newdeath,
      this.recovered,
      this.flag});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Expanded(
                child: Card(
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                  color: Color(0xffbFFC93C),
                  elevation: 4,
                  child: Container(
                    height: 100,
                    //  width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Affected',
                            // style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '$active',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                  color: Colors.deepOrange[400],
                  elevation: 4,
                  child: Container(
                    // color: Color(),
                    height: 100,
                    //  width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Death',
                            // style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '$death',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Expanded(
                child: Card(
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                  color: Colors.yellow,
                  elevation: 4,
                  child: Container(
                    color: Colors.green,
                    height: 100,
                    //  width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Recovered',
                            // style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '$recovered',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                  color: Colors.blue,
                  elevation: 4,
                  child: Container(
                    height: 100,
                    //  width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Active',
                            // style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '$active',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                  color: Colors.purple,
                  elevation: 4,
                  child: Container(
                    height: 100,
                    //  width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'New Death',
                            // style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '$newdeath',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Card(
        //   color: Colors.white,
        //   elevation: 4,
        //   child: Container(
        //     height: 200,
        //     //  width: 200,
        //     child: BarChartGraph(
        //       data1,
        //     ),
        //   ),
        // )
      ],
    );
  }
}
