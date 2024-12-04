import 'package:flutter/material.dart';

import '../../gen/assets.dart';
import '../../gen/colors.dart';
import '../../style/text_style.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 60,),
            _buildHeader(),
            const SizedBox(height: 20,),
            _buildSearchView(),
            const SizedBox(height: 15,),
            ..._buildListSearch()
          ],
        )
      ),
    );
  }

  Widget _buildSearchView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        textInputAction: TextInputAction.search,
        cursorWidth: 0.5,
        cursorColor: ColorName.black,
        cursorHeight: 20,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: textNormal.copyWith(color: ColorName.grey),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
              child: Assets.images.icSearchCheck.svg(width: 15, height: 15)),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 15,
            minHeight: 15
          ),
          isDense: true,
          filled: true,
          contentPadding: const EdgeInsets.all(0),
          fillColor: const Color(0xFFF1F1F2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none
          )
        ),
      ),
    );
  }

  Widget _buildItemSearch(
      {required SvgGenImage? imgSearch, required String title}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 15,
        ),
        (imgSearch != null)
            ? imgSearch.svg(width: 54, height: 54)
            : Container(
                alignment: Alignment.center,
                width: 54,
                height: 54,
                decoration: const BoxDecoration(
                    color: Color(0xFFED7360), shape: BoxShape.circle),
                child: Assets.images.icInviteFriend.svg(width: 22, height: 22),
              ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: textNormal,
        ),
        const Spacer(),
        const RotatedBox(
          quarterTurns: 90,
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 12,
            color: ColorName.black,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }

  List<Widget> _buildListSearch() {
    return [
      _buildItemSearch(imgSearch: null, title: 'Invite friends'),
      const SizedBox(height: 20,),
      _buildItemSearch(imgSearch: Assets.images.icSms, title: 'Find contacts'),
      const SizedBox(height: 20,),
      _buildItemSearch(imgSearch: Assets.images.icMessengerLogo, title: 'Find Message'),
      const SizedBox(height: 20,),
      _buildItemSearch(imgSearch: Assets.images.icInstagram, title: 'Find Instagram'),
    ];
  }

  Widget _buildHeader() {
    return Stack(
      fit: StackFit.loose,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text('Find friends', style: text16bold,),
        ),
        Positioned(
            right: 15,
            child: Assets.images.icScan.svg(width: 20, height: 20))
      ],
    );
  }
}
