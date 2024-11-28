import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final currentTab = 0.obs;
  final videos = [
    'https://i.pinimg.com/originals/41/86/1c/41861c82ae0fbdcc797e40a27e2de7f6.jpg',
    'https://toigingiuvedep.vn/wp-content/uploads/2021/07/thien-nhien-viet-nam-tuyet-dep.jpg',
    'https://toanthaydinh.com/wp-content/uploads/2020/04/cau-noi-hay-ve-cuoc-song-6.jpg',
    'https://cdn.tuoitre.vn/471584752817336320/2024/2/15/cristiano-ronaldo-al-fayha-v-al-nassr-1707952110553879513339.jpg',
    'https://wallpapercave.com/wp/wp7245862.jpg',
    'https://reviewdoan.com/wp-content/uploads/2019/03/Zhengxin_Chicken.jpg',
    'https://khoinguonsangtao.vn/wp-content/uploads/2021/12/hinh-nen-may-tinh-780x439.jpg',
    'https://img2.thuthuatphanmem.vn/uploads/2019/01/26/anh-lien-quan_012323782.jpg',
  ];

  final videoFavourites = [
    'https://symbols.vn/wp-content/uploads/2021/11/Hinh-game-PUBG-3D.jpg',
    'https://anhdepbonphuong.com/wp-content/uploads/2016/11/hinh-phong-canh-dep-nhat-the-gioi-1.jpg',
    'https://mega.com.vn/media/news/0107_hinh-nen-may-tinh-4k47.jpg',
    'https://phunugioi.com/wp-content/uploads/2020/02/anh-phong-canh-thien-nhien-dep.jpg',
    'https://i.pinimg.com/originals/69/ee/ba/69eebaa5bf49f2bf862ab335144381bd.jpg',
    'https://inkythuatso.com/uploads/thumbnails/800/2022/05/hinh-nen-vu-tru-huyen-ao-dep-1-30-10-25-12.jpg',
    'https://khoinguonsangtao.vn/wp-content/uploads/2022/10/hinh-vu-tru-nha-phi-hanh-gia.jpg',
    'https://assets.nintendo.com/image/upload/c_fill,w_1200/q_auto:best/f_auto/dpr_2.0/ncom/software/switch/70010000059297/e3d151c5aaf1d7fc78d1ac193d29bf5ff6755917c4d979b4124a43c8b345479b',
    'http://4.bp.blogspot.com/-SLNmVfUj7cY/UwTaZCmJZsI/AAAAAAAADHI/y_9674XsNP8/s1600/3.jpg',
    'https://3.bp.blogspot.com/-XkCKG5htjes/URvyYoXrOcI/AAAAAAAAANE/0dCMdidV4U4/s1600/Plants+vs+Zombies+[1200+by+900].png',
    'https://img.9gate.net/files/4148393882/2016/11/13/1479040171-01-lien-quan-mobile-9gate.jpg',
    'https://khoinguonsangtao.vn/wp-content/uploads/2022/09/hinh-anh-thien-nhien-buon-hoang-hon-vang-dep-nuc-long.jpg'
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      currentTab.value = tabController.index;
    });
  }
}