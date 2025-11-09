import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/experience.dart';
import 'question_screen.dart';

class ExperienceScreen extends StatefulWidget {
  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  List<Experience> experiences = [];
  List<int> selectedIds = [];
  TextEditingController descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadExperiences();
  }

  loadExperiences() async {
    experiences = await ApiService.fetchExperiences();
    setState(() {});
  }

  toggleSelection(int id) {
    setState(() {
      selectedIds.contains(id) ? selectedIds.remove(id) : selectedIds.add(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center( // <--- Center everything
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // <--- Middle of screen
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // Title
                Text(
                  "What kind of hotspots do you want to host?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    height: 1.35,
                  ),
                ),

                SizedBox(height: 32),

                // Stamp-style cards
                SizedBox(
                  height: 95,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (_, __) => SizedBox(width: 18),
                    itemCount: experiences.length,
                    itemBuilder: (context, index) {
                      final exp = experiences[index];
                      final isSelected = selectedIds.contains(exp.id);

                      return GestureDetector(
                        onTap: () => toggleSelection(exp.id),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: 74,
                          height: 74,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2.4,
                            ),
                            boxShadow: isSelected
                                ? [
                              BoxShadow(
                                color: Colors.purpleAccent.withOpacity(0.6),
                                blurRadius: 10,
                                spreadRadius: 1.4,
                              )
                            ]
                                : [],
                            image: DecorationImage(
                              image: NetworkImage(exp.imageUrl),
                              fit: BoxFit.cover,
                              colorFilter: isSelected
                                  ? null
                                  : ColorFilter.mode(
                                Colors.black.withOpacity(0.52),
                                BlendMode.saturation,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 36),

                // Text box
                TextField(
                  controller: descController,
                  maxLength: 250,
                  maxLines: 4,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Describe your perfect hotspot...",
                    hintStyle: TextStyle(color: Colors.white38),
                    filled: true,
                    fillColor: Colors.white10,
                    counterStyle: TextStyle(color: Colors.white30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.white24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.purpleAccent),
                    ),
                  ),
                ),

                SizedBox(height: 24),

                // Next Button (centered premium style)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuestionScreen(
                          selectedIds: selectedIds,
                          description: descController.text,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 52,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.white24),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.17),
                          Colors.white.withOpacity(0.04),
                        ],
                      ),
                    ),
                    child: Text(
                      "Next   →",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
