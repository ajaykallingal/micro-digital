import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micro_digital/src/data/model/categories/categories_request.dart';
import 'package:micro_digital/src/data/model/categories/categories_response.dart';

import '../../constants/assets.dart';
import '../../data/bloc/master_bloc.dart';
import '../../data/model/dashboard/dashboard_response.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../widgets/risk_areas_category_tile.dart';
import 'components/categories_detailed_page_arguments.dart';

class CategoriesViewScreen extends StatefulWidget {
  const CategoriesViewScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesViewScreen> createState() => _CategoriesViewScreenState();
}

class _CategoriesViewScreenState extends State<CategoriesViewScreen> {
  Orientation? orientation;
  final masterBloc = MasterBloc();
  List<CategoryList> categoriesList = List.empty(growable: true);
  CategoriesResponse? categoriesResponse;
  ScrollController? paginationController;
  bool loading = true;

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
        categoriesList = event.categoryList;
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
                              'Categories',
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
                    child: categoriesList.isNotEmpty
                        ? GridView.builder(
                            // controller: paginationController,
                            padding: EdgeInsets.all(8),
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            addAutomaticKeepAlives: true,
                            itemCount: categoriesList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            // (orientation == Orientation.portrait) ? 3 : 3),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    masterBloc.categoriesRequest(
                                      CategoriesRequest(
                                        query: categoriesList[index].categoryId,
                                        pageNo: "1",
                                      ),
                                    );
                                    Navigator.pushNamed(
                                      context,
                                      '/category_detailed_view',
                                      arguments:
                                          CategoriesDetailedViewPageArguments(
                                        categoryId:
                                            categoriesList[index].categoryId,
                                        categoryName:
                                            categoriesList[index].category,
                                      ),
                                    );
                                  },
                                  child: CategoryTileWidget(
                                    riskAreaTitle:
                                        '${categoriesList[index].category}',
                                    // categoriesResponse!
                                    //     .packages![index].category,
                                    riskAreaImageWidget:
                                        categoriesList[index].imageDir,

                                    // categoriesResponse!
                                    //     .packages![index].imageDir,
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(
                            child: RefreshProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.blue,
                              backgroundColor: Colors.white,
                            ),
                          ),
                  ),

                  // : Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
