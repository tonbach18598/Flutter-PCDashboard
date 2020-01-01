import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/chat_bloc/chat_bloc.dart';
import 'package:flutter_pcdashboard/blocs/chat_bloc/chat_event.dart';
import 'package:flutter_pcdashboard/blocs/chat_bloc/chat_state.dart';
import 'package:flutter_pcdashboard/models/responses/chat_response.dart';
import 'package:flutter_pcdashboard/utilities/config.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';
import 'package:flutter_pcdashboard/utilities/toast.dart';
import 'package:flutter_pcdashboard/utilities/value.dart';
import 'package:flutter_pcdashboard/widgets/loading_comment.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatResponse> messages = [];
  TextEditingController contentController;
  ScrollController scrollController;
  SocketIOManager manager;
  SocketIO socket;
  String id = '1613013';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contentController = TextEditingController();
    scrollController = ScrollController();
    manager = SocketIOManager();
    connectSocket();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    disconnectSocket();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChatBloc()..add(ConnectSocketEvent())..add(FetchListEvent(100)),
      child: BlocListener<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state is SuccessFetchListState) {
            messages = state.messages;
            SchedulerBinding.instance.addPostFrameCallback((_) {
              scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 10),
              );
            });
          } else if (state is FailureFetchListState) {
            ToastUtil.showFailureToast('Tải tin nhắn thất bại');
          } else if (state is SuccessPressSendState) {
            contentController.text = '';
          } else if (state is WarningPressSendState) {
            ToastUtil.showWarningToast('Nội dung tin nhắn không được để trống');
          } else if (state is FailurePressSendState) {
            ToastUtil.showFailureToast('Gửi tin nhắn thất bại');
          }
        },
        child: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) => Scaffold(
            appBar: GradientAppBar(
              title: Text(
                Value.CHAT.toUpperCase(),
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
                            controller: scrollController,
                            itemCount: messages.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => messages[index]
                                        .userId ==
                                    id
                                ? Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Container(
                                          constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.deepOrange),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 10, 15, 10),
                                            child: Text(
                                              '${messages[index].content}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10),
                                          child: SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  messages[index].userAvatar,
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
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 5),
                                              child: Text(
                                                '${messages[index].userName}',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                            ),
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
                                                  color: Colors.white),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        15, 10, 15, 10),
                                                child: Text(
                                                  '${messages[index].content}',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.deepOrange),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
                                  contentController.text.isNotEmpty
                                      ? haveMessage()
                                      : ToastUtil.showWarningToast(
                                          'Nội dung tin nhắn không được để trống');
                                  ;
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

  Future<void> connectSocket() async {
    socket = await manager.createInstance(SocketOptions(Config.socketUrl));
    socket.connect();
    socket.onConnect((data) async {
      socket.emit('join', [(await PreferencesUtil.loadSelf()).classId]);
    });
    socket.on('message', (data) {
      ChatResponse message = ChatResponse.fromJson(data);
      setState(() {
        messages.add(message);
        SchedulerBinding.instance.addPostFrameCallback((_) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 10),
          );
        });
      });
    });
  }

  Future<void> haveMessage() async {
    socket.emit('haveMessage',
        [contentController.text.trim(), await PreferencesUtil.loadToken()]);
    setState(() {
      contentController.text = '';
    });
  }

  void disconnectSocket() {
    manager.clearInstance(socket);
  }
}
