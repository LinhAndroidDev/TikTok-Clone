import 'package:tiktok_clone/constants/app_url.dart';
import 'package:tiktok_clone/model/video_model.dart';
import 'package:tiktok_clone/net_work/api_service.dart';
import 'package:tiktok_clone/net_work/entity/video_response.dart';

class VideoRepository {
  final ApiService _apiService = ApiService();

  Future<List<VideoModel>> fetchVideos() async {
    try {
      final response = await _apiService.get(AppUrl.videos, queryParameters: {
        'alt': 'media',
        'token': '631a5739-03f6-4836-9aa0-4a3d8681b2c0'
      });
      final data = response.data as List;
      final videos = <VideoModel>[];
      final videoResponses = data.map((json) => VideoResponse.fromJson(json)).toList();
      for (var video in videoResponses) {
        videos.add(VideoModel.toVideoModel(video));
      }
      return videos;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}