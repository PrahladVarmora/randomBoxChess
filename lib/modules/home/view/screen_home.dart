import 'package:bytes_task_darshan/modules/core/utils/core_import.dart';
import 'package:bytes_task_darshan/modules/home/bloc/home_bloc.dart';

class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({super.key});

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  late final HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(Dimens.margin16),
          child: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) {
              return current is TapButtonHomeState;
            },
            builder: (context, state) {
              return Column(
                children: [
                  if (homeBloc.currentIndex == -1) ...[
                    ElevatedButton(
                        onPressed: () {
                          homeBloc.add(const ResetHomeEvent());
                        },
                        child: const Text("Reset")),
                    const SizedBox(height: Dimens.margin10)
                  ],
                  Expanded(
                    child: GridView.builder(
                        itemCount: homeBloc.itemsList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: (MediaQuery.of(context).size.width -
                                  Dimens.margin55) /
                              4,
                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: Dimens.margin10,
                        ),
                        itemBuilder: (_, index) => GridWidget(
                              color: homeBloc.currentIndex == index
                                  ? AppColors.colorDefault
                                  : (homeBloc.selectedList.contains(index)
                                      ? AppColors.colorOther
                                      : AppColors.color7E7E7E),
                              onTap: homeBloc.currentIndex == index
                                  ? () {
                                      homeBloc.add(
                                          TapButtonHomeEvent(index: index));
                                    }
                                  : null,
                            )),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class GridWidget extends StatelessWidget {
  final Color color;
  final Function()? onTap;

  const GridWidget({super.key, required this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: color,
      ),
    );
  }
}
