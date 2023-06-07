import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/dummy_data.dart';
import '../../../../../core/utils/mixins/theme_mixins.dart';
import '../../../../shared/widgets/app_sliver_persistent_header_delegate.dart';

class Categories extends StatefulWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> with TextThemeMixin {
  final double height = 32;

  final double itemPadding = 8;

  String _selectedCategory = DummyData.bookCategories.first;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: AppSliverPersistentDelegate(
        child: Container(
          color: AppColors.white,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(itemPadding),
            children: [
              ...DummyData.bookCategories.map(
                (category) => InkWell(
                  onTap: () {
                    // TODO:
                    // locator<HomeBloc>().add(OnLoadProduct(q: category));
                    _selectedCategory = category;
                    setState(() {});
                  },
                  child: Container(
                    height: height,
                    // width: 56,
                    margin: const EdgeInsets.only(right: 8),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          // offset: Offset(1, 3),
                          spreadRadius: 1,
                          color: Colors.black12,
                          blurRadius: 1,
                        )
                      ],
                    ),
                    child: Text(
                      category == DummyData.bookCategories.first ? 'Tất cả' : category,
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: _selectedCategory == category ? AppColors.primary : AppColors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        height: height + itemPadding * 2,
      ),
      pinned: true,
    );
  }
}
