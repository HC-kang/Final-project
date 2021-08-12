import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('분리수거 정보', style: TextStyle(
            color: Color(0xFF00BFA5),fontWeight: FontWeight.bold
        ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications_none),
            color: Color(0xFF00BFA5), onPressed: () {  },
          )
        ],
      ),
      // body: Center(
      //   child: MaterialButton(
      //     child: Text('Go to Page1'),
      //     onPressed: (){
      //       Navigator.pop(context);
      //     },
      //   ),
      //
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('   분리수거 헷갈린다면?',
              style: TextStyle(
                  color: Color(0xFF00BFA5),
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),
            ),
          ),
          // 검색창
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black12),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0,10),
                    blurRadius: 50,
                    color: Color(0xFF00BFA5).withOpacity(0.23)
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: ' 찾고 싶은 품목을 검색해보세요!',
                hintStyle: TextStyle(
                  color: Colors.black45.withOpacity(0.5),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
            // child: Icon(
            //   Icons.search
            // ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                recycling(
                  title: '플라스틱',
                  image: 'images/plastic.png',
                  ingredient: ' 내용물은 비우고, \n 라벨은 제거하고, \n 찌그러트려 버려주세요!',
                ),
                recycling(
                  title: '신문&책',
                  image: 'images/paper.png',
                  ingredient: ' 스프링 등 종이류와 다른 재질은 \n 제거 후 버려주세요!',
                ),
                recycling(
                  title: '박스',
                  image: 'images/box.png',
                  ingredient: ' 테이프 등 종이류와 다른 재질은 \n 제거하고, 이물질 혼합 방지를 위해 \n 접어서 버려주세요! ',
                ),
                recycling(
                  title: '비닐',
                  image: 'images/vinil.png',
                  ingredient: ' 이물질은 깨끗하게 비우고, \n 물기를 제거하여 버려주세요!',
                ),
                recycling(
                  title: '금속캔',
                  image: 'images/metal.png',
                  ingredient: ' 플라스틱 뚜껑 및 내용물은 비우고, \n 부탄가스, 살충제 용기 등은 \n 구멍을 뚫어 버려주세요!',
                ),
                SizedBox(width: 20),
              ],
            ),
          )



        ],
      ),
    );
  }
}

class recycling extends StatelessWidget {
  //final String title;
  final String title;
  final String image;
  final String ingredient;
  //final String description;

  const recycling({
    Key key,
    //required this.title,
    this.title,
    this.image,
    this.ingredient,
    //required this.description;,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 380,
      width: 270,
      child: Stack(
        children: <Widget>[
          Positioned( //bigbox
            right: 0,
            left: 0,
            child: Container(
              height: 380,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34),
                color: Color(0xFF00BFA5).withOpacity(0.2),
              ),
            ),
          ),
          Positioned(
            left: 50,
            top: 20,
            child: Container(
              width: 181,
              height: 181,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF00BFA5).withOpacity(0.5),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 8,
            child: Container(
              height: 184,
              width: 276,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image))),
            ),
          ),
          Positioned(
            left: 40,
            top: 230,
            child: Text(title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Color(0xFF00BFA5),
              ),
            ),
          ),
          Positioned(
              top: 280,
              left: 40,
              child: Column(
                children: <Widget>[
                  Text(ingredient,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
