# 🎮 Game2048 - A Clean Architecture Flutter Clone of 2048

![Game2048 Banner](assets/images/banner.png)

Game2048 is a **modern, high-performance** Flutter-based clone of the classic **2048** game. Built with **clean architecture principles**, it ensures **scalability, maintainability, and performance optimization**.

🔥 **Why this 2048 clone stands out?**\
✅ **Built with Flutter** - Fast, smooth, and cross-platform.\
✅ **Clean Architecture** - Well-structured codebase for scalability.\
✅ **State Management** - Uses **Riverpod/Bloc** for performance and maintainability.\
✅ **Custom Animations** - Smooth tile movements & transitions.\
✅ **Dark Mode Support** - Seamless switching between light/dark themes.\
✅ **Leaderboard & High Scores** - Persistent local storage for tracking best plays.

---

## 📸 Screenshots

| Light Mode                                  | Dark Mode                                 |
| ------------------------------------------- | ----------------------------------------- |
| ![Light Mode](assets/screenshots/light.png) | ![Dark Mode](assets/screenshots/dark.png) |

---

## 🎯 Features

✔️ **Classic 2048 Gameplay** - Swipe to combine tiles and reach 2048!\
✔️ **Adaptive UI** - Works smoothly on **mobile, tablet, and web**.\
✔️ **Undo Feature** - Take back a wrong move!\
✔️ **Local Storage** - Saves progress & high scores.\
✔️ **Haptic Feedback & Sound Effects** - Enhancing the user experience.\
✔️ **Customizable Themes** - Light, Dark, and even custom colors.\
✔️ **Performance Optimized** - Uses Flutter best practices for efficiency.

---

## ⚙️ Tech Stack

- **Flutter** (Dart)\
- **State Management:** Riverpod / Bloc\
- **Animations:** Flutter’s built-in animation framework\
- **Storage:** SharedPreferences / Hive\
- **Architecture:** Clean Architecture (Presentation, Data layers)

---

## 📥 Installation & Running the App

### **📌 Clone the repository**

```bash
git clone https://github.com/lagcleaner/game2048.git
cd game2048
```

### **📌 Install dependencies**

```bash
flutter pub get
```

### **📌 Run the app**

```bash
flutter run
```

💡 **Want to run it on the web?**

```bash
flutter run -d chrome
```

---

## 🛠️ Project Structure

Following a **Flutter-optimized Clean Architecture**, the code is structured as:

```
lib/
│── core/              # Configurations and global definitions
│   │── constants/     # Constants values used all across the app
│   │
│── data/              # Business logic & services
│   │── entities/      # Core data models
│   │── services/      # API handling, local storage
│   │
│── presentation/      # UI & State management
│   │── components/    # Reusable widgets
│   │── controllers/   # Logic controllers for screens
│   │── misc/          # Miscellaneous utilities (themes, helpers, etc.)
│   │── screens/       # Screens of the app
│   │   │── board/     # Board screen + components & controllers
│   │   │── home/      # Home screen + components & controllers
│   │   │── not_found/ # 404 or error screen
│   │
│── main.dart          # Entry point
```

This structure ensures **better separation of concerns**, making the app **scalable and maintainable**.

---

## 📌 Contributing

🙌 Contributions are welcome! Feel free to fork this repo and submit a PR.

1. Fork the repository 🍴
2. Create a new branch (`git checkout -b feature-xyz`)
3. Commit your changes (`git commit -m 'Add feature xyz'`)
4. Push the branch (`git push origin feature-xyz`)
5. Open a Pull Request 🚀

---

## 📜 License

📝 Game2048 is **open-source** and available under the **MIT License**.

---

## 📫 Contact

💡 Have suggestions or feedback? Let’s connect!

📧 **Email:** [lagcleaner@gmail.com](mailto:lagcleaner@gmail.com)\
📲 **Telegram:** [@lagcleaner](https://t.me/lagcleaner)\
🔗 **LinkedIn:** [linkedin.com/in/lagcleaner](https://www.linkedin.com/in/lagcleaner)

⭐ **If you like this project, don’t forget to give it a star!** ⭐
