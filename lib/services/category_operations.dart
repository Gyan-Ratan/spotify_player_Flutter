import 'package:spotify_player/models/category.dart';

class CategoryOperations {
  CategoryOperations._() {}
  static List<Category> getCategories() {
    return <Category>[
      Category('Top Songs',
          'https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/44/17/3c/44173c67-fc77-2bc3-a54e-c275c89f71bd/AppIcon-0-1x_U007emarketing-0-7-0-85-220.png/256x256bb.jpg'),
      Category('Trending',
          'https://pbs.twimg.com/profile_images/643472392992505856/wJ6I99cZ_400x400.png'),
      Category('The Classics',
          'https://is4-ssl.mzstatic.com/image/thumb/Purple49/v4/70/f4/10/70f410a6-f7da-38d5-ee43-95dfd2965608/source/256x256bb.jpg'),
      Category('POP HITS',
          'https://is2-ssl.mzstatic.com/image/thumb/Purple123/v4/da/36/e8/da36e892-c2b6-d84a-66e1-fdb195d57f30/source/256x256bb.jpg'),
    ];
  }
}
