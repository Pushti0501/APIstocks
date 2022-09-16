import 'dart:convert';

import 'package:apistockedge/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:percent_indicator/percent_indicator.dart';

class Performance extends StatefulWidget {
  const Performance({Key? key}) : super(key: key);

  @override
  State<Performance> createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
  Future<List<dynamic>> getperformance() async {
    var response = await http.get(
      Uri.parse(
          'https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en'),
    );
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<dynamic>>(
        future: getperformance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 4.0,right:4.0),
                    child: Text(
                      'Performance',
                      style: kheadingstyle,
                    ),
                  ),
                  const SizedBox(
                      child: Divider(
                    thickness: 3.0,
                    color: Colors.black12,
                  )),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      // ignore: non_constant_identifier_names
                      var Label = snapshot.data![index]['Label'];
                      // ignore: non_constant_identifier_names
                      var Changepercent =
                          snapshot.data![index]['ChangePercent'];

                      return Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(

                                  child: Text(
                                    Label,
                                    style: kperformancetext,
                                  ),
                                ),
                                 Container(
                                    width: 180.0,
                                    alignment: Alignment.center,
                                    child: 
                                       (Changepercent > 100)
                                                ? Align(
                                                    child:
                                                        (LinearPercentIndicator(
                                                      barRadius: const Radius.circular(5.0),
                                                      width: 180.0,
                                                      lineHeight: 24.0,
                                                      percent: 1.0,
                                                      backgroundColor:
                                                          Colors.grey[200],
                                                      progressColor: Colors.green,
                                                    )),
                                                  )
                                                : (LinearPercentIndicator(
                                                    barRadius: const Radius.circular(5.0),
                                                    width: 180.0,
                                                    lineHeight: 24.0,
                                                    percent:
                                                        (Changepercent / 100).abs(),
                                                    backgroundColor: Colors.grey[200],
                                                    progressColor: Changepercent > 0.0
                                                        ? Colors.green
                                                        : Colors.red,
                                                  ))
                                   
                                  ),
                                
                             
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      (Changepercent < 0.0)
                                          ? const Icon(Icons.arrow_drop_down,
                                              color: Colors.red)
                                          : const Icon(Icons.arrow_drop_up,
                                              color: Colors.green),
                                      Text(
                                        Changepercent.abs()
                                                .toStringAsFixed(1) +
                                            '%',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Changepercent < 0.0
                                              ? Colors.red
                                              : Colors.green[800],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
