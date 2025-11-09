# 🎉 Hotspot Host Onboarding – Flutter Assignment (8Club)

This project is part of the **Hotspot Host Onboarding Assignment** for the 8Club Internship.  
It provides a **two-step onboarding flow** for users who want to become hosts and manage social hotspot experiences.

The UI focuses on being **simple, modern, and welcoming**, while capturing the necessary host information through **experience selection**, **text input**, **audio recording**, and **video recording**.

---

## ✨ Demo Preview

| Experience Selection | Host Answer Screen |
|---|---|
| Users select what type of hotspots they want to host | Users answer "Why do you want to host?" via text/audio/video |

*(Screen recording will be attached in submission)*

---

## 🚀 Features Implemented

### **1. Experience Selection Screen**
- Fetches experience list dynamically from the **Public API**
- Displays experiences as **elegant stamp-style cards**
- **Multi-select support** for choosing multiple experience types
- **Grayscale effect on unselected cards**
- **Purple glow highlight** on selected cards
- Collects a **multi-line input (max 250 chars)** describing the host’s style
- State is stored and passed to the next screen

### **2. Onboarding Question Screen**
- User writes a **long-form answer (max 600 chars)** explaining motivation
- **Audio Recording Support**
  - Start/stop recording
  - Delete recorded audio
- **Video Recording Support**
  - Record short video through camera
  - Delete recorded video
- Recording buttons automatically disappear once media is captured

---

## 🌟 Brownie Points (Extra Enhancements Applied)

| Enhancement | Status | Description |
|---|:---:|---|
| Premium UI & Layout | ✅ | Center-aligned, minimal dark theme with luxury gradients |
| Smooth Interaction | ✅ | Animated card selection with soft glow effect |
| Clean State Handling | ✅ | Straightforward and predictable using `setState` |
| Compact Experience Tiles | ✅ | Matches the refinement shown in real product UIs |

---

## 💡 Additional Feature (Extra for Internship Impact)

### **Host Personality Insight (Concept Added)**
After capturing:
- Experience selections
- Text motivation response
- Voice tone patterns (future model use)

The system can **infer the host’s personality style** such as:
> *“Warm Social Connector”*, *“Creative Experience Curator”*, *“Chill Community Anchor”*, etc.

This helps the platform:
- Recommend better event types
- Match hosts with audiences that fit their vibe
- Improve overall community engagement

This shows **forward-thinking design & product awareness**, not just coding.

---

## 🛠️ Tech Stack

| Layer | Tools Used |
|---|---|
| Framework | Flutter (Dart) |
| API | HTTP GET via `http` package |
| Media Capture | `flutter_sound` & `image_picker` |
| Permission Handling | `permission_handler` |
| UI Styling | Custom gradients, typography, and layout spacing |

---

## 📦 Project Structure

lib/
├─ screens/
│ ├─ experience_screen.dart
│ └─ question_screen.dart
├─ services/
│ └─ api_service.dart
├─ models/
│ └─ experience.dart
└─ main.dart

yaml
Copy code

---

## ▶️ How to Run

```sh
flutter pub get
flutter run
For APK:

sh
Copy code
flutter build apk --release
❤️ Made by
Sarvesh Upasani
Flutter • Full Stack • AI Engineering
Eager to contribute & grow with the 8Club community.

If you like the project, kindly ⭐ the repo.
yaml
Copy code

---

## ✅ Your README is now:
✔ Internship-ready  
✔ Professional  
✔ Polished  
✔ Shows product thinking  
✔ Shows UI judgement  
✔ Shows you care about user experience  

---

### Want me to now:
1. **Generate your screen recording narration script** (so you speak confidently)
2. **Create a polished GitHub repository description + tags**
3. **Generate LinkedIn post text to announce your submission**

Reply with one word:

**`demo`** — For screen recording script  
**`linkedin`** — For LinkedIn announcement  
**`repo polish`** — For final GitHub finishing touches
