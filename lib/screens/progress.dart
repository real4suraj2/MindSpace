import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MoodData {
  String type;
  double amt;
  MoodData(@required this.type, @required this.amt);
}

final List<MoodData> data1 = [
  MoodData('sad', 40.0),
  MoodData('angry', 10.0),
  MoodData('happy', 30.0),
  MoodData('safe', 10.0),
  MoodData('fearless', 10.0),
  MoodData('free', 10.0),
  MoodData('attracted', 10.0),
  MoodData('attached', 10.0),
  MoodData('powerless', 20.0),
  MoodData('hated', 10.0),
  MoodData('alone', 10.0),
  MoodData('loved', 10.0)
];

final List<MoodData> data2 = [
  MoodData('sad', 40.0),
  MoodData('happy', 30.0),
  MoodData('powerless', 20.0),
  MoodData('loved', 10.0)
];

class Progress extends StatefulWidget {
  Progress(@required this.kind);
  final String kind;
  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  bool _toggle = false;
  String _text = 'Show My Top Moods';

  List<charts.Series<MoodData, String>> _buildChartData() {
    List<MoodData> chartData = _toggle ? data2 : data1;
    List<charts.Series<MoodData, String>> series = [
      charts.Series(
        id: "Mood Report",
        data: chartData,
        domainFn: (MoodData series, _) => series.type,
        measureFn: (MoodData series, _) => series.amt,
      )
    ];
    return series;
  }

  Widget _Card(
      String title, Color clr1, Color clr2, double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0.3, 1],
          colors: [clr1, clr2],
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: Text(
            '$title',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = widget.kind == 'Daily' ? Colors.pink : Colors.blue;
    if (_toggle)
      _text = 'Show My Top Moods';
    else
      _text = 'Show My All Moods';
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.kind} Progress'),
        backgroundColor: color,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _toggle = !_toggle;
                    });
                  },
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 22.0, vertical: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: color),
                      child: Text(
                        _text,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                height: 190.0,
                child: charts.PieChart(
                  _buildChartData(),
                  animate: true,
                  defaultRenderer: new charts.ArcRendererConfig(
                    arcRendererDecorators: [
                      new charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.outside,
                        outsideLabelStyleSpec:
                            charts.TextStyleSpec(fontSize: 8),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                  height: 200.0,
                  width: 300.0,
                  child: ShaderMask(
                    child: charts.BarChart(
                      _buildChartData(),
                      animate: true,
                      domainAxis: new charts.OrdinalAxisSpec(
                          renderSpec: new charts.SmallTickRendererSpec(
                              labelRotation: 60)),
                      layoutConfig: new charts.LayoutConfig(
                          leftMarginSpec: new charts.MarginSpec.fixedPixel(0),
                          topMarginSpec: new charts.MarginSpec.fixedPixel(0),
                          rightMarginSpec: new charts.MarginSpec.fixedPixel(0),
                          bottomMarginSpec:
                              new charts.MarginSpec.fixedPixel(0)),
                    ),
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color(0xFFFA4169),
                          Color(0xFFFFB540),
                          Color(0xFF51DE93),
                        ],
                        stops: [
                          0.0,
                          0.5,
                          1.0,
                        ],
                      ).createShader(Offset.zero & bounds.size);
                    },
                    blendMode: BlendMode.srcATop,
                  )),
              SizedBox(height: 80.0),
            ],
          ),
        ),
      ),
    );
  }
}
