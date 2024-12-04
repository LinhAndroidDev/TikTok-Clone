import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final currentTab = 0.obs;
  final videos = [
    'https://i.pinimg.com/originals/41/86/1c/41861c82ae0fbdcc797e40a27e2de7f6.jpg',
    'https://toigingiuvedep.vn/wp-content/uploads/2021/07/thien-nhien-viet-nam-tuyet-dep.jpg',
    'https://toanthaydinh.com/wp-content/uploads/2020/04/cau-noi-hay-ve-cuoc-song-6.jpg',
    'https://i.ytimg.com/vi/3JLLLFW2uaI/maxresdefault.jpg',
    'https://wallpapercave.com/wp/wp9142916.jpg',
    'https://cdn.theathletic.com/app/uploads/2023/01/14163508/GettyImages-1456427491-scaled-e1673732135226-1024x682.jpg',
    'https://cdn.tuoitre.vn/471584752817336320/2024/2/15/cristiano-ronaldo-al-fayha-v-al-nassr-1707952110553879513339.jpg',
    'https://wallpapercave.com/wp/wp7245862.jpg',
    'https://scr.vn/wp-content/uploads/2020/07/%E1%BA%A2nh-Li%C3%AAn-Qu%C3%A2n-Mobile-Tulen-scaled.jpg',
    'https://reviewdoan.com/wp-content/uploads/2019/03/Zhengxin_Chicken.jpg',
    'https://khoinguonsangtao.vn/wp-content/uploads/2021/12/hinh-nen-may-tinh-780x439.jpg',
    'https://toquoc.mediacdn.vn/Uploaded/myda/2017_07_17/nhungbaibientrentg/11_EKDF.jpg',
    'https://frontofficesports.com/wp-content/uploads/2022/08/FOS-Sunday-8.7-Premier-League.jpg'
  ];

  final videoFavourites = [
    'https://symbols.vn/wp-content/uploads/2021/11/Hinh-game-PUBG-3D.jpg',
    'https://hinhanhonline.com/Images/Album/Hinhanhdongvatsinhdong/hinh-anh-dong-vat-sinh-dong-de-thuong-hinhanhonline-3.jpg',
    'https://anhdepbonphuong.com/wp-content/uploads/2016/11/hinh-phong-canh-dep-nhat-the-gioi-1.jpg',
    'https://mega.com.vn/media/news/0107_hinh-nen-may-tinh-4k47.jpg',
    'https://i.ex-cdn.com/mgn.vn/files/content/2022/10/21/aya-0900.jpg',
    'https://cdn.popsww.com/blog/sites/2/2022/03/Ca-Muc-Ham-Mat-hua-hen-se-la-mot-tinh-yeu-dang-yeu-cua-doi-tre.jpg',
    'https://st.quantrimang.com/photos/image/2019/09/26/ran-doc-nhat-the-gioi-7.jpg',
    'https://khoinguonsangtao.vn/wp-content/uploads/2022/09/anh-gai-xinh-facebook-tiktok.jpg',
    'https://i.pinimg.com/originals/69/ee/ba/69eebaa5bf49f2bf862ab335144381bd.jpg',
    'https://lienhehotro.vn/uploads/ran-1.jpg',
    'https://www.mordeo.org/files/uploads/2022/06/Lim-PUBG-Mobile-Character-4K-Ultra-HD-Mobile-Wallpaper.jpg',
    'https://inkythuatso.com/uploads/thumbnails/800/2022/05/hinh-nen-vu-tru-huyen-ao-dep-1-30-10-25-12.jpg',
    'https://khoinguonsangtao.vn/wp-content/uploads/2022/10/hinh-vu-tru-nha-phi-hanh-gia.jpg',
    'https://cdn.voh.com.vn/voh/Image/2020/09/01/893fcf51743c467dab039c28a7a068a5_20200901140243.jpeg',
    'https://gonatour.vn/vnt_upload/news/09_2020/dao_yen_nha_trang_gonatour.jpg',
    'https://wallpapers.com/images/hd/pubg-assembly-4k-mp3u9g4wybd8413p.jpg',
    'https://kenh14cdn.com/203336854389633024/2022/10/16/photo-15-16658842502742018626054.jpg',
    'https://bazaarvietnam.vn/wp-content/uploads/2023/01/harper-bazaar-nhung-bo-phim-ngon-tinh-nhat-ban-1-e1674733846506.jpg',
    'https://khoinguonsangtao.vn/wp-content/uploads/2022/09/hinh-anh-gai-xinh-facebook-tiktok-de-thuong.jpg',
    'http://4.bp.blogspot.com/-SLNmVfUj7cY/UwTaZCmJZsI/AAAAAAAADHI/y_9674XsNP8/s1600/3.jpg',
    'https://bloganchoi.com/wp-content/uploads/2021/12/fu8tcyb.jpg',
    'https://hanoispiritofplace.com/wp-content/uploads/2016/06/hinh-anh-dong-vat-hoang-da-6-1.jpg',
    'https://3.bp.blogspot.com/-XkCKG5htjes/URvyYoXrOcI/AAAAAAAAANE/0dCMdidV4U4/s1600/Plants+vs+Zombies+[1200+by+900].png',
    'https://img.9gate.net/files/4148393882/2016/11/13/1479040171-01-lien-quan-mobile-9gate.jpg',
    'https://genk.mediacdn.vn/139269124445442048/2022/1/27/caspian-sea-3d-1643254016262356034141.jpg',
    'https://1.bp.blogspot.com/-7x4NxuFXeFs/UFVSqduBlPI/AAAAAAAADdk/rw8kVmBBqUI/s1600/Th%E1%BA%BF+gi%E1%BB%9Bi+%C4%91%E1%BB%99ng+v%E1%BA%ADt+-+c%C3%A1c+lo%C3%A0i+b%C6%B0%E1%BB%9Bm+%C4%91%E1%BA%B9p+(15).jpg',
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