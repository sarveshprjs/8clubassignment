import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class QuestionScreen extends StatefulWidget {
  final List<int> selectedIds;
  final String description;

  QuestionScreen({required this.selectedIds, required this.description});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  TextEditingController answerController = TextEditingController();

  FlutterSoundRecorder recorder = FlutterSoundRecorder();
  bool isRecording = false;
  String? audioPath;

  XFile? videoFile;

  @override
  void initState() {
    super.initState();
    initAudio();
  }

  Future<void> initAudio() async {
    await Permission.microphone.request();
    await recorder.openRecorder();
  }

  Future<void> recordAudio() async {
    final dir = await getTemporaryDirectory();
    audioPath = "${dir.path}/host_audio.aac";

    await recorder.startRecorder(
      codec: Codec.aacMP4,
      toFile: audioPath,
    );

    setState(() => isRecording = true);
  }

  Future<void> stopAudio() async {
    await recorder.stopRecorder();
    setState(() => isRecording = false);
  }

  Future<void> recordVideo() async {
    final picker = ImagePicker();
    videoFile = await picker.pickVideo(source: ImageSource.camera);
    setState(() {});
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Why do you want to host with us?",
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16),

            TextField(
              controller: answerController,
              maxLength: 600,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Explain your motivation...",
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              maxLines: 6,
            ),

            SizedBox(height: 16),

            // AUDIO SECTION
            if (audioPath == null && !isRecording)
              ElevatedButton.icon(
                onPressed: recordAudio,
                icon: Icon(Icons.mic),
                label: Text("Record Audio"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              )
            else
              Row(
                children: [
                  if (isRecording)
                    ElevatedButton.icon(
                      onPressed: stopAudio,
                      icon: Icon(Icons.stop),
                      label: Text("Stop Recording"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    )
                  else
                    Text("Audio Recorded ✅", style: TextStyle(color: Colors.white)),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => setState(() => audioPath = null),
                  )
                ],
              ),

            SizedBox(height: 16),

            // VIDEO SECTION
            if (videoFile == null)
              ElevatedButton.icon(
                onPressed: recordVideo,
                icon: Icon(Icons.videocam),
                label: Text("Record Video"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              )
            else
              Row(
                children: [
                  Text("Video Recorded ✅", style: TextStyle(color: Colors.white)),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => setState(() => videoFile = null),
                  )
                ],
              ),

            Spacer(),

            ElevatedButton(
              onPressed: () {
                print("====== FINAL SUBMISSION DATA ======");
                print("Selected Experience IDs: ${widget.selectedIds}");
                print("Experience Text: ${widget.description}");
                print("Answer: ${answerController.text}");
                print("Audio File: $audioPath");
                print("Video File: ${videoFile?.path}");
                print("==================================");
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: Center(child: Text("Submit")),
            )
          ],
        ),
      ),
    );
  }
}
