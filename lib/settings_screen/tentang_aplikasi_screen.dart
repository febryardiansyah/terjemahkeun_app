import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:terjemahkeun_app/widget/custom_expand_tile.dart';

class TentangAplikasi extends StatefulWidget {
  @override
  _TentangAplikasiState createState() => _TentangAplikasiState();
}

class _TentangAplikasiState extends State<TentangAplikasi> {
  bool tutup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool scrolled){
          return <Widget> [
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Tentang Aplikasi',style: TextStyle(fontWeight: FontWeight.bold),),
                centerTitle: true,
                background: Image.asset('images/forestSunset.jpg',fit: BoxFit.cover,),
                collapseMode: CollapseMode.parallax,
              ),
              backgroundColor: Color(0xFF33B6FF),
            )
          ];
        },
        body: ListView(
          children: <Widget>[
            CustomExpandTile(
              icon: Icons.live_help,
              judul: 'Apa itu TerjemahKeun ?',
              desk: 'Adalah aplikasi untuk membaca teks didalam gambar dan dapat menerjemahkannya'
                  ' dari bahasa indonesia ke bahasa inggris atau sebaliknya',
            ),
            CustomExpandTile(
              icon: Icons.text_fields,
              judul: 'Kenapa namanya TerjemahKeun ?',
              desk: 'Sebenernya saya buat namanya cuma iseng-iseng pelesetan dari Terjemahkan yang dibikin jadi bahasa sunda, '
                  'makanya namanya jadi TerjemahKeun'
            ),
            CustomExpandTile(
              icon: Icons.playlist_add_check,
              judul: 'Aplikasi ini dibuat menggunakan apa saja?',
              desk: 'Aplikasi ini dibuat menggunakan produk dari google antara lain Framework Flutter'
                  ' dan juga ML Kit Text Recognizer untuk mendeteksi teks didalam gambar '
            ),
            CustomExpandTile(
              icon: Icons.people,
              judul: 'Siapa saja yang berkontribusi ?',
              desk: 'Dari mulai desain aplikasi, Firebase ML kit, dan juga FrontEnd dikerjakan oleh saya sendiri'
            ),
            CustomExpandTile(
              icon: Icons.update,
              judul: 'Berapa lama pengerjaan ?',
              desk: 'Untuk pengerjaan sendiri kurang lebih memakan waktu satu minggu'
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text('versi 0.1 beta rilis',style: TextStyle(color: Colors.grey),),
            )
          ],
        ),
      ),
    );
  }
}
