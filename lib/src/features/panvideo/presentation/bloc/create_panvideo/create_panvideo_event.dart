// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_panvideo_bloc.dart';

class OnCreatePanvideo extends BaseEvent {
  OnCreatePanvideo(
    this.video,
    this.description,
    this.title,
    this.durationInSecs,
  );
  final File video;
  final String? description;
  final String title;
  final int durationInSecs;

  @override
  List<Object?> get props => [
        title,
        video.path,
        description,
        durationInSecs,
      ];
}
