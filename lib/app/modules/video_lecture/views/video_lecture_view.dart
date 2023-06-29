import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/firebase/model/lecture_model.dart';
import '../controllers/video_lecture_controller.dart';

class VideoLectureView extends GetView<VideoLectureController> {
  const VideoLectureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: FutureBuilder<List<Subject>>(
          future: controller.getDemoLecture(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final subjectList = snapshot.data ?? [];

              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: subjectList.length, // Replace with your own data
                itemBuilder: (BuildContext context, int index) =>
                    subjectWidget(subjectList[index], index),
              );
            } else if (!snapshot.hasData) {
              return const LinearProgressIndicator();
            } else {
              return const Center(child: Text('No data found'));
            }
          }),
    );
  }

  Widget subjectWidget(Subject subject, int chapterIndex) => InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                subject.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 150, // Replace with your own height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    subject.playlists.length, // Replace with your own data
                itemBuilder: (BuildContext context, int index) {
                  return playlistWidget(subject.playlists[index]);
                },
              ),
            ),
          ],
        ),
      );

  Widget playlistWidget(Playlist playlist) => InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () => controller.launchURL(playlist.url),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: SizedBox(
                      width: 150,
                      height: 84,
                      child: CachedNetworkImage(
                        imageUrl: playlist.thumbnailUrl ?? '',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  playlist.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  AppBar appBar(BuildContext context) => AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text("Video Lecture",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                )),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0072B5), Color(0xff3B3B98)],
              stops: [0.5, 1.0],
            ),
          ),
        ),
      );
}
