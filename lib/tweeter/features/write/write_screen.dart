import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/tweeter/features/write/camera_screen.dart';
import 'package:tiktok_clone/tiktok/textstyle/style_guide.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final TextEditingController _textController = TextEditingController();

  void _onCancleTap() {
    Navigator.of(context).pop();
  }

  final FocusNode _focusNode = FocusNode();
  final List<String> _selectedList = [];

  Future<void> _onAttachTap() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CameraScreen(),
      ),
    ).then(
      (value) {
        if (value != null && mounted) {
          for (var item in value) {
            _selectedList.add(item.path);
          }

          setState(() {});
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: _focusNode.unfocus,
      child: Container(
        height: size.height * 0.9,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Stack(
              children: [
                const Center(
                  child: Text(
                    "New Thread",
                  ),
                ),
                GestureDetector(
                  onTap: _onCancleTap,
                  child: const Text(
                    "Cancle",
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              const CircleAvatar(
                                backgroundColor: null,
                                radius: 20,
                                backgroundImage: NetworkImage(
                                  "https://avatars.githubusercontent.com/u/88703915",
                                ),
                              ),
                              const Gap(5),
                              Expanded(
                                child: SizedBox(
                                  width: 3,
                                  child: ColoredBox(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              const Gap(5),
                              const Opacity(
                                opacity: 0.5,
                                child: CircleAvatar(
                                  backgroundColor: null,
                                  radius: 13,
                                  backgroundImage: NetworkImage(
                                    "https://avatars.githubusercontent.com/u/88703915",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "hary_maybe",
                                        style: StyleGuide.threadTitleStyle(),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: TextField(
                                      expands: true,
                                      minLines: null,
                                      maxLines: null,
                                      cursorColor: Colors.blue,
                                      scrollPadding: const EdgeInsets.symmetric(
                                        vertical: 96,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "Start a thread...",
                                        hintStyle: TextStyle(
                                          color: Colors.grey.shade400,
                                        ),
                                        border: const UnderlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(6),
                                  IconButton(
                                    onPressed: _onAttachTap,
                                    icon: const Icon(
                                      FontAwesomeIcons.paperclip,
                                      size: 20,
                                    ),
                                    color: Colors.grey,
                                  ),
                                  const Gap(40),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '   Anyone can reply',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                  ),
                  const Opacity(
                    opacity: 0.7,
                    child: Text(
                      "POST  ",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}
