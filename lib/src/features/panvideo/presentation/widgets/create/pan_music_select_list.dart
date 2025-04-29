// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panmusic_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/create/pan_music_item.dart';
import 'package:flutter/material.dart';

class PanMusicSelectList extends StatelessWidget {
  const PanMusicSelectList({
    super.key,
    required this.panMusics,
  });
  final List<PanMusicDto> panMusics;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 16.0,
      ),
      itemCount: panMusics.length,
      itemBuilder: (context, index) {
        final PanMusicDto music = panMusics[index];
        return PanMusicItem(music: music);
      },
      separatorBuilder: (_, __) {
        return 12.shb;
      },
    );
  }
}
