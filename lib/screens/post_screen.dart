import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/post_bloc/post_bloc.dart';
import 'package:flutter_pcdashboard/blocs/post_bloc/post_event.dart';
import 'package:flutter_pcdashboard/blocs/post_bloc/post_state.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:flutter_pcdashboard/utilities/toasts.dart';
import 'package:flutter_pcdashboard/utilities/values.dart';
import 'package:flutter_pcdashboard/widgets/loading_post.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController contentController;
  SelfResponse self;
  File image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contentController = TextEditingController();
    self = SelfResponse(name: '', classId: '', avatar: '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc()..add(InitializeSelfEvent()),
      child: BlocListener<PostBloc, PostState>(
        listener: (context, state) {
          if (state is InitializeSelfState) {
            self = state.self;
          } else if (state is SuccessPressPostState) {
            Toasts.showSuccessToast('Đăng bài thành công');
            Navigator.of(context).pop();
          } else if (state is WarningPressPostState) {
            Toasts.showWarningToast('Nội dung bài đăng không được để trống');
          } else if (state is FailurePressPostState) {
            Toasts.showFailureToast('Đăng bài thất bại');
          } else if (state is SuccessTapImageState) {
            image = state.image;
          }
        },
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) => Scaffold(
            appBar: GradientAppBar(
              title: Text(
                Values.POST_POST.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              elevation: 0,
              automaticallyImplyLeading: true,
              gradient: LinearGradient(
                  colors: [
                    Colors.deepOrange,
                    Colors.deepOrangeAccent,
                    Colors.orange,
                    Colors.orangeAccent,
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.file_upload,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    BlocProvider.of<PostBloc>(context).add(
                        PressPostEvent(contentController.text.trim(), image));
                  },
                ),
              ],
            ),
            body: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: self.avatar != null
                                      ? CachedNetworkImage(
                                          imageUrl: self.avatar,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) => Center(
                                              child: SpinKitDualRing(
                                            color: Colors.blue,
                                          )),
                                          errorWidget: (context, url, error) =>
                                              Icon(
                                            Icons.error,
                                            color: Colors.orange,
                                          ),
                                        )
                                      : Icon(
                                          Icons.error,
                                          color: Colors.orange,
                                        ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(self.name,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepOrange)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      Values.MEMBER_OF + self.classId,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          child: TextField(
                            controller: contentController,
                            cursorColor: Colors.lightBlue,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: Values.YOUR_THINKING,
                                hintStyle: TextStyle(fontSize: 20)),
                          ),
                        ),
                      ),
                      image != null ? Image.file(image) : Container(),
                    ],
                  ),
                ),
                state is LoadingState ? LoadingPost() : Container()
              ],
            ),
            bottomNavigationBar: InkWell(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                      Colors.deepOrange,
                      Colors.deepOrangeAccent,
                      Colors.orange,
                      Colors.orangeAccent,
                    ],
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                          child: Text(
                            Values.ADD_IMAGE,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: IconButton(
                            icon: Icon(
                          Icons.image,
                          size: 30,
                          color: Colors.white,
                        )))
                  ],
                ),
              ),
              onTap: () {
                BlocProvider.of<PostBloc>(context).add(TapImageEvent());
              },
            ),
          ),
        ),
      ),
    );
  }
}
