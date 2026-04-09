# 📚 Flutter LMS Mobile App - 7 Day Challenge

A comprehensive Learning Management System (LMS) mobile application UI built exclusively using **Flutter fundamentals**. This project was developed as part of a 7-day intensive development challenge to master UI/UX design, navigation, and state management in Flutter.

---

## ✨ Project Features

### 🛠️ Day 1-3: UI Foundation & Auth
- **Branded Splash Screen:** Professional entry point with a timed transition and brand logo.
- **Onboarding Experience:** Interactive introduction flow using `PageView` with smooth transitions.
- **Form Validation:** Secure Login system with integrated `TextEditingControllers` and Regex email validation.

### 📖 Day 4-5: Content & Reusability
- **Dynamic Dashboard:** Personalized user greeting with course progress tracking cards and linear indicators.
- **Course Catalog:** Efficient list of courses using `ListView.builder` with detailed information for each course.
- **Assignment Tracker:** Dedicated screen to monitor assignment status with "Submitted" and "Pending" status indicators.
- **Reusable Widgets:** Implementation of custom buttons and cards to reduce code duplication and maintain UI consistency.

### ⚙️ Day 6-7: Logic, Animation & Responsiveness
- **Bottom Navigation Bar:** Seamless navigation shell allowing users to switch between Home, Courses, Tasks, and Profile.
- **State Management:** Utilized `setState` to manage application states such as lesson completion and active tabs.
- **Animations:** Integrated `AnimatedOpacity` for smooth visual feedback on user interactions.
- **Responsive Design:** Fully adaptive user interface implemented using `MediaQuery` to support various mobile screen sizes.

---

## 📂 Project Folder Structure

```text
lib/
├── models/      # Data models (Course, Assignment)
├── screens/     # Functional screens (Login, Home, Profile, etc.)
├── widgets/     # Reusable UI components (CustomButton)
└── main.dart    # App entry point & Global Theme configuration

🛠️ Technology Stack

Framework: Flutter
Language: Dart
Design System: Material Design 3
Tools: VS Code, Git, Android Studio

📝 Task Plan Compliance

Daily commits pushed to GitHub with Conventional Commit messages.

Clean folder structure and organized code architecture.

UI-only implementation using Material UI components (No Backend).

Responsive layouts for multiple mobile screen sizes.

👤 Author
Sandaru Perera
Developed during the 7-Day Flutter Internship Task Plan.