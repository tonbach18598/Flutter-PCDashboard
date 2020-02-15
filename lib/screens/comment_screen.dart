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
import 'package:flutter_pcdashboard/utilities/toasts.dart';
import 'package:flutter_pcdashboard/utilities/values.dart';
import 'package:flutter_pcdashboard/widgets/loading_comment.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class CommentScreen extends StatefulWidget {
  final arguments;

  CommentScreen(this.arguments);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<CommentResponse> comments;
  ClassResponse post;
  TextEditingController contentController;
  ScrollController scrollController;
  TextEditingController editController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    post = widget.arguments;
    contentController = TextEditingController();
    scrollController = ScrollController();
    editController = TextEditingController();
    comments = [];
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
            Toasts.showFailureToast('Tải bình luận thất bại');
          } else if (state is SuccessPressConfirmState) {
            Toasts.showSuccessToast('Sửa bình luận thành công');
            Navigator.of(context).pop();
            BlocProvider.of<CommentBloc>(context).add(FetchListEvent(post.id));
          } else if (state is WarningPressConfirmState) {
            Toasts.showWarningToast('Nội dung bình luận không được để trống');
          } else if (state is FailurePressConfirmState) {
            Toasts.showFailureToast('Sửa bình luận thất bại');
          } else if (state is SuccessPressCancelState) {
            Navigator.of(context).pop();
          } else if (state is SuccessPressSendState) {
            contentController.text = '';
            BlocProvider.of<CommentBloc>(context).add(FetchListEvent(post.id));
          } else if (state is WarningPressSendState) {
            Toasts.showWarningToast('Nội dung bình luận không được để trống');
          } else if (state is FailurePressSendState) {
            Toasts.showFailureToast('Gửi bình luận thất bại');
          } else if (state is SuccessPressEditState) {
            editController.text = state.comment.content;
            showEditDialog(context, state.comment);
          } else if (state is FailurePressEditState) {
            Toasts.showFailureToast('Sửa bình luận thất bại');
          } else if (state is SuccessPressDeleteState) {
            comments.remove(state.comment);
            Toasts.showSuccessToast('Xoá bình luận thành công');
          } else if (state is FailurePressDeleteState) {
            Toasts.showFailureToast('Xoá bình luận thất bại');
          }
        },
        child: BlocBuilder<CommentBloc, CommentState>(
          builder: (context, state) => Scaffold(
            appBar: GradientAppBar(
              title: Text(
                Values.COMMENT.toUpperCase(),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                                            child: comments[index].userAvatar !=
                                                    null
                                                ? CachedNetworkImage(
                                                    imageUrl: comments[index]
                                                        .userAvatar,
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Container(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    placeholder: (context,
                                                            url) =>
                                                        Center(
                                                            child:
                                                                SpinKitDualRing(
                                                      color: Colors.orange,
                                                    )),
                                                    errorWidget:
                                                        (context, url, error) =>
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.7),
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
                                      caption: Values.EDIT,
                                      color: Colors.lightBlueAccent,
                                      icon: Icons.edit,
                                      onTap: () {
                                        BlocProvider.of<CommentBloc>(context)
                                            .add(PressEditEvent(
                                                comments[index]));
                                      },
                                    ),
                                    IconSlideAction(
                                      caption: Values.DELETE,
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
                                    padding: const EdgeInsets.only(left: 20, right: 20),
                                    child: TextField(
                                      controller: contentController,
                                      cursorColor: Colors.lightBlue,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 3,
                                      minLines: 1,
                                      style: TextStyle(fontSize: 16),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: Values.ENTER_CONTENT,
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

  Future<void> showEditDialog(
      BuildContext blocContext, CommentResponse comment) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            Values.EDIT_COMMENT.toUpperCase(),
            style: TextStyle(color: Colors.blueAccent),
          ),
          content: CupertinoTextField(
            controller: editController,
            cursorColor: Colors.lightBlue,
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(Values.CANCEL,
                  style: TextStyle(color: Colors.deepOrange)),
              onPressed: () {
                BlocProvider.of<CommentBloc>(blocContext)
                    .add(PressCancelEvent());
              },
            ),
            CupertinoDialogAction(
              child: Text(
                Values.CONFIRM,
                style: TextStyle(color: Colors.orange),
              ),
              onPressed: () {
                BlocProvider.of<CommentBloc>(blocContext).add(
                    PressConfirmEvent(comment, editController.text.trim()));
              },
            ),
          ],
        );
      },
    );
  }
}
