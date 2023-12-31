import 'package:certification_cources/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'firstScreen.dart';

class Cources extends StatefulWidget {
  final int index;
  var videourl = [
    "https://youtu.be/yGB9jhsEsr8?si=d4CWfzCierdmXtc8",
    "https://youtu.be/bSrm9RXwBaI?si=SzgQtnN9RYmZB18X",
    "https://youtu.be/XnSasPR2KJI?si=AmFIAUYcqiAFfMit",
    "https://youtu.be/irqbmMNs2Bo?si=x6wQdAVtSg1Mfep0",
    "https://youtu.be/HcOc7P5BMi4?si=2C8Fq6V5dRifvswa",
    "https://youtu.be/ESnrn1kAD4E?si=vw-Tk9uGths6zb8S",
    "https://youtu.be/hKB-YGF14SY?si=M-6M0PeYFXip0Foy",
    "https://youtu.be/542oAYLGMNA?si=3BY319GPaqy-tF8k",
    "https://youtu.be/dl00fOOYLOM?si=yMDeqnJGjUs0eCdh",
    "https://youtu.be/j-LOab_PzzU?si=Hu-INI3Sj5IDCZme",
    "https://youtu.be/mJ3bGvy0WAY?si=kGnJmVZkkW9HXtkL",
  ];
  void addcource(String a)async {
    videourl.add(a);
    for(int i=0; i<videourl.length;i++){
      print(videourl[i]);
    }
  }
  @override
  Cources({required this.index});
  @override
  State<Cources> createState() => _CourcesState();
}

class _CourcesState extends State<Cources> {

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.videourl[widget.index]);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        hideControls: false,
        controlsVisibleAtStart: false,
        autoPlay: true,
        mute: false,
        // isLive :true,
        hideThumbnail: false,
        disableDragSeek: false,
        loop: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    if (isLandscape) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
          isLandscape =
              MediaQuery.of(context).orientation == Orientation.values;
          print("poped");
        });

        return false;
      },
      child: Scaffold(
          appBar: isLandscape
              ? null
              : AppBar(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  title: Text('course'),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        icon: Icon(Icons.home))
                  ],
                ),
          body: isLandscape
              ? YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  controlsTimeOut: const Duration(seconds: 3),
                  aspectRatio: 16 / 10,
                )
              : Stack(
              alignment: Alignment.bottomRight,
                children:[ ListView(
                    children: [
                      YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        controlsTimeOut: const Duration(seconds: 3),
                        aspectRatio: 16 / 10,
                      ),
                      Stack(alignment: Alignment.bottomRight, children: [
                        Container(
                          // height: double.infinity,
                          height: 8000,
                          child: InAppWebView(
                            initialUrlRequest: URLRequest(
                              url: Uri.parse(
                                  "https://practice.geeksforgeeks.org/courses?source=google&medium=cpc&device=c&keyword=gfg&matchtype=b&campaignid=20039445781&adgroup=147845288105&gad=1&gclid=CjwKCAjw-KipBhBtEiwAWjgwrG1fYiqVqMdIID2QFzv-9JkaOL0AE6WUMgzRY01DFY7__vMFPWsa2RoCDVoQAvD_BwE"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FilledButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserName()));
                              },
                              child: const Text(
                                "Certificate",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                        )
                      ]),
                    ],
                  ),
                  Padding(

                    padding: const EdgeInsets.all(8.0),
                    child: FilledButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserName()));
                        },
                        child: const Text(
                          "Certificate",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                  ),
      ]

              )
    ),
    );
  }
}
