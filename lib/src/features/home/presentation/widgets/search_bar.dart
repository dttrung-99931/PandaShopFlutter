import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../config/theme.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          border: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 6),
            child: Icon(
              Icons.search,
              size: 20,
              color: Colors.black45,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            maxWidth: 36,
            minWidth: 36,
          ),
          isDense: true,
          hintText: 'Tên sách, tác giả, nội dung...',
          hintStyle: textTheme.bodyMedium?.copyWith(fontSize: 15),
        ),
        style: textTheme.bodyMedium?.copyWith(fontSize: 15, fontWeight: FontWeight.normal),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
