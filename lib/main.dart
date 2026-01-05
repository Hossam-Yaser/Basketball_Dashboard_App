import 'package:basketball_dashborad_app/cubits/counter_cubit.dart';
import 'package:basketball_dashborad_app/cubits/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BasketballDashBoard());
}

class BasketballDashBoard extends StatelessWidget {
  const BasketballDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Points Counter"),
            backgroundColor: Colors.amber,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TeamColumn(
                      teamName: "Team A",
                      numberOfPoints: BlocProvider.of<CounterCubit>(
                        context,
                      ).teamAPoints,
                      onAddPoints: (points) {
                        BlocProvider.of<CounterCubit>(
                          context,
                        ).teamIncreament(team: 'A', buttonNumber: points);
                      },
                    ),
                    VerticalDivider(
                      color: Colors.grey,
                      thickness: 2,
                      indent: 20,
                      endIndent: 10,
                    ),
                    TeamColumn(
                      teamName: "Team B",
                      numberOfPoints: BlocProvider.of<CounterCubit>(
                        context,
                      ).teamBPoints,
                      onAddPoints: (points) {
                        BlocProvider.of<CounterCubit>(
                          context,
                        ).teamIncreament(team: 'B', buttonNumber: points);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).resetCounter();
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(5)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  child: Text(
                    "Reset",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TeamColumn extends StatelessWidget {
  final String teamName;
  final int numberOfPoints;
  final void Function(int) onAddPoints;

  const TeamColumn({
    required this.teamName,
    required this.numberOfPoints,
    required this.onAddPoints,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          teamName,
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),

        Text(
          '$numberOfPoints',
          style: TextStyle(
            fontSize: 150,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
          ),
        ),
        ElevatedButton(
          onPressed: () => onAddPoints(1),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          child: Text(
            'Add 1  Point',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => onAddPoints(2),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          child: Text(
            'Add 2 Points',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => onAddPoints(3),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          child: Text(
            'Add 3 Points',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
