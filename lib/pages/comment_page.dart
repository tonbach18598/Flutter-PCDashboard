import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/comment_bloc/comment_bloc.dart';
import 'package:flutter_pcdashboard/blocs/comment_bloc/comment_event.dart';
import 'package:flutter_pcdashboard/blocs/comment_bloc/comment_state.dart';
import 'package:flutter_pcdashboard/models/responses/class_response.dart';
import 'package:flutter_pcdashboard/models/responses/comment_response.dart';
import 'package:flutter_pcdashboard/utilities/toast.dart';
import 'package:flutter_pcdashboard/utilities/value.dart';
import 'package:flutter_pcdashboard/widgets/loading_comment.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class CommentPage extends StatefulWidget {
  final arguments;

  CommentPage(this.arguments);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<CommentResponse> comments = [];
  ClassResponse post;
  TextEditingController contentController;
  ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    post = widget.arguments;
    contentController = TextEditingController();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentBloc()..add(FetchListEvent(post.id)),
      child: BlocListener<CommentBloc, CommentState>(
        listener: (context, state) {
          if (state is SuccessFetchListState) {
            comments = state.comments;
            SchedulerBinding.instance.addPostFrameCallback((_) {
              scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 10),
              );
            });
          } else if (state is FailureFetchListState) {
            ToastUtil.showFailureToast('Tải bình luận thất bại');
          } else if (state is SuccessPressSendState) {
            contentController.text = '';
            BlocProvider.of<CommentBloc>(context).add(FetchListEvent(post.id));
          } else if (state is WarningPressSendState) {
            ToastUtil.showWarningToast(
                'Nội dung bình luận không được để trống');
          } else if (state is FailurePressSendState) {
            ToastUtil.showFailureToast('Gửi bình luận thất bại');
          } else if (state is SuccessPressDeleteState) {
            comments.remove(state.comment);
            ToastUtil.showSuccessToast('Xoá bình luận thành công');
          } else if (state is FailurePressDeleteState) {
            ToastUtil.showFailureToast('Xoá bình luận thất bại');
          }
        },
        child: BlocBuilder<CommentBloc, CommentState>(
          builder: (context, state) => Scaffold(
            appBar: GradientAppBar(
              title: Text(
                Value.COMMENT.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
            ),
            body: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                            itemCount: comments.length,
                            physics: BouncingScrollPhysics(),
                            controller: scrollController,
                            itemBuilder: (context, index) => Slidable(
                                  actionPane: SlidableDrawerActionPane(),
                                  actionExtentRatio: 0.25,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(10,5,10,5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 10, 0),
                                          child: SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  comments[index].userAvatar,
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
                                                  (context, url, error) => Icon(
                                                Icons.error,
                                                color: Colors.orange,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.7),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.grey[300]),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        15, 10, 15, 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '${comments[index].userName}',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .deepOrange),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: Text(
                                                        '${comments[index].content}',
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5, left: 15),
                                              child: Text(
                                                '${comments[index].time}',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    IconSlideAction(
                                      caption: Value.EDIT,
                                      color: Colors.lightBlueAccent,
                                      icon: Icons.edit,
                                      onTap: () {
                                        BlocProvider.of<CommentBloc>(context)
                                            .add(PressEditEvent(
                                                comments[index]));
                                      },
                                    ),
                                    IconSlideAction(
                                      caption: Value.DELETE,
                                      color: Colors.blueAccent,
                                      icon: Icons.delete,
                                      onTap: () {
                                        BlocProvider.of<CommentBloc>(context)
                                            .add(PressDeleteEvent(
                                                comments[index]));
                                      },
                                    ),
                                  ],
                                )),
                      ),
                      Container(
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
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 0, 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: TextField(
                                      controller: contentController,
                                      cursorColor: Colors.lightBlue,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 3,
                                      minLines: 1,
                                      style: TextStyle(fontSize: 16),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: Value.ENTER_CONTENT,
                                          hintStyle: TextStyle(fontSize: 16)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                icon: Icon(
                                  Icons.send,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  BlocProvider.of<CommentBloc>(context).add(
                                      PressSendEvent(post.id,
                                          contentController.text.trim()));
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                state is LoadingState ? LoadingComment() : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
