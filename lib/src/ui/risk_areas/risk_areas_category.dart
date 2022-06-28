import 'package:flutter/material.dart';
import 'package:micro_digital/src/data/bloc/master_bloc.dart';
import 'package:micro_digital/src/ui/risk_areas/risk_area_detailed_view_arguments.dart';

import '../../common/styles.dart';
import '../../constants/assets.dart';
import '../../data/model/dashboard/dashboard_response.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../widgets/risk_areas_category_tile.dart';

class RiskAreasCategoryPage extends StatefulWidget {
  @override
  State<RiskAreasCategoryPage> createState() => _RiskAreasCategoryPageState();
}

class _RiskAreasCategoryPageState extends State<RiskAreasCategoryPage> {
  Orientation? orientation;
  final masterBloc = MasterBloc();
  List<CategoryList> riskAreas = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    masterBloc.getDashboardData();
    // Add code after super
    // paginationController = ScrollController();
    // masterBloc.categoriesRequest(CategoriesRequest(query: "399", pageNo: "1"));
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    masterBloc.getDashboardSCListener.listen((event) {
      setState(() {
        riskAreas = event.riskAreas;
        // loading = false;
      });
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/background.jpg',
                  ).image,
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                        child: Image.asset(
                          'assets/images/TOP_BAR.png',
                          width: double.infinity,
                          height: 155,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.chevron_left_rounded,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            Text(
                              'Risk Areas',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Titillium Web',
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/cart');
                              },
                              icon: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.asset(Assets.iconCart),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: riskAreas.isNotEmpty
                        ? GridView.builder(
                            padding: EdgeInsets.all(8),
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            addAutomaticKeepAlives: true,
                            itemCount: riskAreas.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        (orientation == Orientation.portrait)
                                            ? 2
                                            : 3),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/riskAreas_Category_listView',
                                      arguments: RiskAreaDetailedViewArguments(
                                        riskAreaCategoryId:
                                            riskAreas[index].categoryId,
                                        riskAreaCategoryName:
                                            riskAreas[index].category,
                                      ),
                                    );
                                  },
                                  child: CategoryTileWidget(
                                    riskAreaTitle: riskAreas[index].category,
                                    riskAreaImageWidget:
                                        riskAreas[index].imageDir,
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(
                            child: RefreshProgressIndicator(
                            backgroundColor: Colors.white,
                            color: mainBlueShade,
                          )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
