import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'constants.dart';

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  var Security;
  var ID;
  var IndustryID;
  var Industry;
  var SectorId;
  var Sector;
  var MCAP;
  var EV;
  var BNP;
  var PEG;
  var SecuritySlug;
  var Industryslug;
  var SectorSlug;
  var Yearend;
  var Yield;
  var TTMYearend;
  var TTMPE;
  var Securityid;
  var EVDateEnd;
  Future fetchdata() async {
    Response response = await get(Uri.parse(
        'https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);

      setState(() {
        Security = result['Security'];
        ID = result['ID'];
        IndustryID = result['IndustryID'];
        Industry = result['Industry'];
        SectorId = result['SectorID'];
        Sector = result['Sector'];
        MCAP = result['MCAP'];
        EV = result['EV'];
        BNP = result['BookNavPerShare'];
        PEG = result['PEGRatio'].toStringAsFixed(1);
        Securityid = result['SecurityId'];
        SecuritySlug = result['SecuritySlug'];
        TTMPE = result['TTMPE'];
        TTMYearend = result['TTMYearEnd'];
        Yield = result['Yield'];
        Yearend = result['YearEnd'];
        Industryslug = result['IndustrySlug'];
        EVDateEnd = result['EVDateEnd'];
        SectorSlug = result['SectorSlug'];
      });
    } else {
      // ignore: avoid_print
      print('Failed to fetch data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'Overview',
            style: kheadingstyle,
          ),
          const SizedBox(
              child: Divider(
            thickness: 3.0,
            color: Colors.black12,
          )),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Sector',
                      style: ktextstyle,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.account_balance,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          Sector == null ? '-' : '$Sector',
                          style: kvaluestyle,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'SectorID',
                      style: ktextstyle,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(SectorId == null ? '-' : '$SectorId'.toString(),
                            style: kvaluestyle),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Security',
                      style: ktextstyle,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(Security == null ? '-' : '$Security',
                            style: kvaluestyle),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Industry',
                      style: ktextstyle,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.account_balance),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(Industry == null ? '-' : '$Industry',
                            style: kvaluestyle),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'IndustryID',
                      style: ktextstyle,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                            IndustryID == null ? '-' : '$IndustryID'.toString(),
                            style: kvaluestyle),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'ID',
                      style: ktextstyle,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          ID == null ? '-' : '$ID'.toString(),
                          style: kvaluestyle,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Market Cap.',
                      style: ktextstyle,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          MCAP == null
                              ? '-'
                              : (MCAP / 10000000).toStringAsFixed(2) + ' Cr.',
                          style: kvaluestyle,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Enterprise Value',
                      style: ktextstyle,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          EV == null ? '-' : '$EV',
                          style: kvaluestyle,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Book Value/Share',
                      style: ktextstyle,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          BNP == null ? '-' : '$BNP'.toString(),
                          style: kvaluestyle,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'PEGRatio',
                      style: ktextstyle,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          PEG == null ? '-' : '$PEG'.toString(),
                          style: kvaluestyle,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Yield',
                      style: ktextstyle,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          Yield == null ? '-' : '$Yield'.toString(),
                          style: kvaluestyle,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'YearEnd',
                      style: ktextstyle,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          Yearend == null ? '-' : '$Yearend'.toString(),
                          style: kvaluestyle,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'TTMPE',
                      style: ktextstyle,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          TTMPE == null ? '-' : '$TTMPE'.toString(),
                          style: kvaluestyle,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'TTMYearEnd',
                      style: ktextstyle,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          TTMYearend == null ? '-' : '$TTMYearend'.toString(),
                          style: kvaluestyle,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'EVDateEnd',
                      style: ktextstyle,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          EVDateEnd == null ? '-' : '$EVDateEnd'.toString(),
                          style: kvaluestyle,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Security Slug',
                      style: ktextstyle,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          SecuritySlug == null
                              ? '-'
                              : '$SecuritySlug'.toString(),
                          style: kvaluestyle,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'SectorSlug',
                      style: ktextstyle,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          SectorId == null ? '-' : '$SectorSlug',
                          style: kvaluestyle,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'IndustrySlug',
                      style: ktextstyle,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          Industryslug == null ? '-' : '$Industryslug',
                          style: kvaluestyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
