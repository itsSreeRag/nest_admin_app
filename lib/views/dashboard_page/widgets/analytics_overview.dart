import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashWebAnalyticsOverview extends StatelessWidget {
  const DashWebAnalyticsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Analytics Overview',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Card(
                      color: Colors.white,
                      child: SizedBox(
                        height: 300,
                        child: LineChart(
                          LineChartData(
                            backgroundColor: Colors.white,
                            gridData: const FlGridData(show: true),
                            titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    const months = [
                                      'Jan',
                                      'Feb',
                                      'Mar',
                                      'Apr',
                                      'May',
                                      'Jun'
                                    ];
                                    if (value >= 0 && value < months.length) {
                                      return Text(months[value.toInt()]);
                                    }
                                    return const Text('');
                                  },
                                ),
                              ),
                            ),
                            borderData: FlBorderData(show: true),
                            lineBarsData: [
                              LineChartBarData(
                                spots: const [
                                  FlSpot(0, 3000),
                                  FlSpot(1, 4200),
                                  FlSpot(2, 3800),
                                  FlSpot(3, 5000),
                                  FlSpot(4, 4800),
                                  FlSpot(5, 6000),
                                ],
                                isCurved: true,
                                color: Colors.blue,
                                barWidth: 3,
                                belowBarData: BarAreaData(
                                  show: true,
                                  color: Colors.blue.withOpacity(0.1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
