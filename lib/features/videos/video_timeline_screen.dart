import 'package:flutter/material.dart';
import 'package:tictok/features/videos/widgets/video_post.dart';

class VideoTimeLineScreen extends StatefulWidget {
  const VideoTimeLineScreen({super.key});

  @override
  State<VideoTimeLineScreen> createState() => _VideoTimeLineScreenState();
}

class _VideoTimeLineScreenState extends State<VideoTimeLineScreen> {
  final PageController _pageController = PageController();
  final Duration _scrollDuration = Duration(milliseconds: 200);
  final Curve _scrollCurve = Curves.linear;

  int _itemCount = 4;
  void _onPageChange(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      setState(() {});
    }
  }

  void _onVideoFinish() {
    _pageController.nextPage(
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: _onPageChange,
      scrollDirection: Axis.vertical,
      itemCount: _itemCount,
      itemBuilder: (context, index) {
        return VideoPost(
          onVideoFinished: _onVideoFinish,
        );
      },
    );
  }
}
