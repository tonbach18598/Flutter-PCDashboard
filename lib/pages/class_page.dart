import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/class_bloc/class_bloc.dart';
import 'package:flutter_pcdashboard/blocs/class_bloc/class_event.dart';
import 'package:flutter_pcdashboard/blocs/class_bloc/class_state.dart';
import 'package:flutter_pcdashboard/models/responses/class_response.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:flutter_pcdashboard/utilities/router.dart';
import 'package:flutter_pcdashboard/utilities/toast.dart';
import 'package:flutter_pcdashboard/utilities/value.dart';
import 'package:flutter_pcdashboard/widgets/loading_post.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ClassPage extends StatefulWidget {
  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  SelfResponse self;
  List<ClassResponse> posts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    self = SelfResponse(avatar: '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ClassBloc()..add(InitSelfEvent())..add(FetchListEvent(10)),
      child: BlocListener<ClassBloc, ClassState>(
        listener: (context, state) {
          if (state is InitSelfState) {
            self = state.self;
          } else if (state is SuccessFetchListState) {
            posts = state.posts;
          } else if (state is FailureFetchListState) {
            ToastUtil.showFailureToast('Tải bảng tin thất bại');
          } else if (state is TapPostState) {
            Navigator.of(context).pushNamed(Router.postRoute);
          } else if (state is TapCommentState) {
            Navigator.of(context)
                .pushNamed(Router.commentRoute, arguments: state.post);
          } else if (state is PressMoreState) {
            showActionSheet(context,state.post);
          } else if (state is PressCancelState) {
            Navigator.of(context).pop();
          } else if(state is SuccessPressDeleteState){
            Navigator.of(context).pop();
            posts.remove(state.post);
            ToastUtil.showSuccessToast('Xoá bài viết thành công');
          } else if(state is FailurePressDeleteState){
            Navigator.of(context).pop();
            ToastUtil.showFailureToast('Xoá bài viết thất bại');
          }
        },
        child: BlocBuilder<ClassBloc, ClassState>(
            builder: (context, state) => Stack(
                  children: <Widget>[
                    CustomScrollView(
                      slivers: <Widget>[
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          expandedHeight: 0,
                          backgroundColor: Colors.grey[200],
                          floating: true,
                          pinned: false,
                          snap: true,
                          centerTitle: true,
                          title: Container(
                            child: InkWell(
                              onTap: () {
                                BlocProvider.of<ClassBloc>(context)
                                    .add(TapPostEvent());
                              },
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 55,
                                    height: 55,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: CachedNetworkImage(
                                        imageUrl: self.avatar,
                                        imageBuilder: (context, imageProvider) =>
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
                                          color: Colors.orange,
                                        )),
                                        errorWidget: (context, url, error) =>
                                            Icon(
                                          Icons.error,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 10, 20, 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Center(
                                          child: Text(
                                            Value.SHARE_YOUR_THINKING,
                                            style: TextStyle(
                                                color: Colors.grey, fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SliverList(
                          delegate:
                              SliverChildBuilderDelegate(
                                  (context,index)=>Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Stack(
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  10, 10, 10, 0),
                                              child: Row(
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 40,
                                                    height: 40,
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                      posts[index].userAvatar,
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
                                                      placeholder: (context, url) =>
                                                          Center(
                                                              child: SpinKitDualRing(
                                                                color: Colors.orange,
                                                              )),
                                                      errorWidget:
                                                          (context, url, error) =>
                                                          Icon(
                                                            Icons.error,
                                                            color: Colors.orange,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          posts[index].userName,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                              Colors.deepOrange,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                          child: Text(
                                                            posts[index].time,
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors.grey),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  10, 10, 10, 5),
                                              child: Text(
                                                posts[index].content,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            posts[index].image != null
                                                ? Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                    posts[index].image,
                                                    placeholder: (context,
                                                        url) =>
                                                        Center(
                                                            child:
                                                            SpinKitCircle(
                                                              color: Colors.orange,
                                                            )),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                        Icon(
                                                          Icons.error,
                                                          color: Colors.orange,
                                                        ),
                                                  )),
                                            )
                                                : Container(),
                                            InkWell(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(10),
                                                  bottomRight: Radius.circular(10)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, bottom: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          right: 5),
                                                      child: Icon(
                                                        Icons.comment,
                                                        color: Colors.orange,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        Value.COMMENT,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              onTap: () {
                                                BlocProvider.of<ClassBloc>(context)
                                                    .add(TapCommentEvent(
                                                    posts[index]));
                                              },
                                            )
                                          ],
                                        ),
                                        Positioned(
                                          right: 0,
                                          top: 0,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.more_horiz,
                                              color: Colors.orange,
                                            ),
                                            onPressed: () {
                                              BlocProvider.of<ClassBloc>(context)
                                                  .add(PressMoreEvent(posts[index]));
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                childCount:posts.length,
                              ),
                        )
                      ],
                    ),
                    state is LoadingState ? LoadingPost() : Container()
                  ],
                )),
      ),
    );
  }

  Future<void> showActionSheet(BuildContext blocContext,ClassResponse post) async {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text(
            Value.OPTION.toUpperCase(),
            style: TextStyle(color: Colors.blueAccent),
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text(
                Value.EDIT,
                style: TextStyle(color: Colors.orange),
              ),
              onPressed: () {
                /** */
              },
            ),
            CupertinoActionSheetAction(
              child: Text(Value.DELETE,
                  style: TextStyle(color: Colors.orange)),
              onPressed: () {
                BlocProvider.of<ClassBloc>(blocContext).add(PressDeleteEvent(post));
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            child:
                Text(Value.CANCEL, style: TextStyle(color: Colors.deepOrange)),
            onPressed: () {
              BlocProvider.of<ClassBloc>(blocContext).add(PressCancelEvent());
            },
          ),
        );
      },
    );
  }
}
