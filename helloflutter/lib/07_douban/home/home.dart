
import 'package:flutter/material.dart';
import 'package:helloflutter/06_service/home_request.dart';
import 'package:helloflutter/06_service/http_request.dart';
import 'package:helloflutter/07_douban/model/home_model.dart';
import 'package:helloflutter/07_douban/widgets/dashed_line.dart';
import 'package:helloflutter/07_douban/widgets/star_rating.dart';

class KYHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: KYHomeContent(),
    );
  }
}

class KYHomeContent extends StatefulWidget {
  const KYHomeContent({super.key});
  @override
  State<KYHomeContent> createState() => _KYHomeContentState();
}

class _KYHomeContentState extends State<KYHomeContent> {
  final List<MovieItem> movies = [];
  @override
  void initState() {
    super.initState();
    HomeReqest.requestMoviesList(0).then((res) {
      setState(() {
        movies.addAll(res);
      });
    });
    // success - https://httpbin.org/get
    // HttpRequest.getHttp("https://frodo.douban.com/api/v2/subject_collection/movie_hot_gaia/items?start=NaN&count=20&apiKey=0ac44ae016490db2204ce0a042db2916").then((value) {
    //   print("------$value");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (cxt, index) {
        if (movies.length > 0) {
          return KYHomeMovieItem(movies[index]);
        } 
        return SizedBox();
    });
  }
}

class KYHomeMovieItem extends StatelessWidget {
  final MovieItem movie;
  KYHomeMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 8, color: Color(0xffcccccc)))
      ),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeader(),
        SizedBox(height: 8),
        buildContent(),
        SizedBox(height: 8),
        buildFooter()
      ],
    ),
    );
  }

  // 1.头部布局
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3)
      ),
      child: Text(
        "No.${movie.rank}",
        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }

  // 2.中间布局
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildContentImage(),
        const SizedBox(width: 8),
        buildContentInfo(),
        const SizedBox(width: 8),
        buildContentLine(),
        const SizedBox(width: 8),
        buildContentWish()
      ],
    );
  }

  // 2.1
  Widget buildContentImage() {
    return Container(
      color: Colors.grey,
        width: 90,
        height: 150,
      // child: SizedBox(width: 100, height: 150,)
      child: Image.network(
        'https://c-ssl.duitang.com/uploads/item/202004/21/20200421010648_KiuRz.jpeg',
        scale: 0.1
      ),
    );
  }

  // 2.2
  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildContentInfoTitle(),
          const SizedBox(height: 8),
          buildContentInfoRate(),
          const SizedBox(height: 8),
          buidContentInfoDesc()
        ],
      ),
    );
  }

  // 2.2.1
  Widget buildContentInfoTitle() {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.pink,
              size: 40,
            ),
            baseline: TextBaseline.ideographic,
            alignment: PlaceholderAlignment.middle
          ),
          WidgetSpan(
            child: Text(movie.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            alignment: PlaceholderAlignment.middle
          ),
          WidgetSpan(
            child: Text("(${movie.playDate})", style: TextStyle(fontSize: 18, color: Colors.grey)),
            alignment: PlaceholderAlignment.bottom
          )
        ]
      )
    );
  }

  // 2.2.2
  Widget buildContentInfoRate() {
    return Row(
      children: [
        StarRating(
          rating: movie.rating,
          size: 20,
        ),
        Text('${movie.rating}', style: TextStyle(fontSize: 16),)
      ],
    );
  }

  // 2.2.3
  Widget buidContentInfoDesc() {
    final genresString = movie.genres.map((e) => e).join(' ');
    final directorString = movie.director;
    final actorString = movie.casts.map((item) => item.name).join(' ');
    return Text(
      "$genresString / $directorString / $actorString",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }

  // 2.3
  Widget buildContentLine() {
    return Container(
      height: 80,
      child: KYDashedLine(
        axis: Axis.vertical,
        width: .4,
        height: 6,
        count: 10,
        color: Colors.pink,
      ),
    );
  }

  // 2.4
  Widget buildContentWish() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star_border, color: Colors.orange),
          Text("想看", style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 235, 170, 60)),)
        ],
      ),
    );
  }


  // 3.尾部布局
  Widget buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(6)
      ),
      child: Text(
        movie.title,
        style: TextStyle(fontSize: 20, color: Color(0xff666666)),
      ),
    );
  }
}