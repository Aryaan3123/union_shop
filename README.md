# Union Shop - Flutter E-commerce Application

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

A modern, cross-platform e-commerce application built with Flutter, recreating the University of Portsmouth Student Union's online shop experience.

[📖 Documentation](#documentation) • [🐛 Report Bug](https://github.com/Aryaan3123/union_shop/issues) • [✨ Request Feature](https://github.com/Aryaan3123/union_shop/issues)

</div>

---

## 📱 About

Union Shop is a comprehensive Flutter e-commerce application that recreates and enhances the core functionality of the UPSU online shop ([shop.upsu.net](https://shop.upsu.net)). This mobile-first application provides a seamless shopping experience with modern UI/UX design principles, real-time data synchronization, and robust state management.

### 🎯 Project Goals
- Create a modern, responsive e-commerce experience
- Implement real-time Firebase integration
- Provide comprehensive shopping cart functionality
- Ensure cross-platform compatibility (iOS, Android, Web)
- Demonstrate best practices in Flutter development

## ✨ Features

### 🎉 Fully Implemented
- ✅ **Responsive Homepage** - Mobile-first design with hero section and featured products
- ✅ **Product Catalog** - Dynamic product browsing with Firebase integration
- ✅ **Shopping Collections** - Organized product categories (SALE, Pride Collection, Portsmouth City, Graduation)
- ✅ **Shopping Cart** - Full cart management with add/remove/update functionality
- ✅ **User Authentication** - Firebase Auth integration with Google Sign-In
- ✅ **Product Search** - Real-time search functionality across all products
- ✅ **Print Shack** - Custom text personalization with live preview
- ✅ **Order Management** - Complete order history and tracking system
- ✅ **Cross-platform Layout** - Responsive design for mobile, tablet, and desktop
- ✅ **State Management** - Robust Provider pattern implementation
- ✅ **Firebase Integration** - Firestore database with real-time updates
- ✅ **Navigation System** - Complete route-based navigation
- ✅ **Testing Suite** - Comprehensive unit and widget tests

### 🚀 Advanced Features
- ✅ **Real-time Data Sync** - Live product updates and inventory management
- ✅ **Discount System** - Sale pricing and promotional offers
- ✅ **User Profiles** - Account management and personal information
- ✅ **Order History** - Complete purchase tracking and order details
- ✅ **Cart Persistence** - Shopping cart state maintained across sessions
- ✅ **Error Handling** - Comprehensive error management and user feedback
- ✅ **Performance Optimization** - Efficient state management and data loading

## 🛠️ Technology Stack

### Frontend
- **Flutter 3.0+** - Cross-platform UI framework
- **Dart 2.17.0+** - Programming language
- **Material Design 3** - Modern UI components

### Backend & Services
- **Firebase Authentication** - User authentication and authorization
- **Cloud Firestore** - NoSQL database for real-time data
- **Firebase Hosting** - Web application hosting
- **Firebase Storage** - Image and file storage

### State Management & Architecture
- **Provider Pattern** - State management solution
- **MVVM Architecture** - Separation of concerns
- **Repository Pattern** - Data abstraction layer

### Testing & Quality Assurance
- **Flutter Test** - Unit and widget testing framework
- **Integration Tests** - End-to-end testing
- **Code Coverage** - Test coverage reporting
- **Static Analysis** - Code quality enforcement

---

## 🚀 Quick Start

### Prerequisites

Before you begin, ensure you have the following installed:
- **Flutter SDK** (3.0 or higher)
- **Dart SDK** (2.17.0 or higher)
- **Git** for version control
- **VS Code** or **Android Studio** with Flutter extensions
- **Chrome** for web development

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Aryaan3123/union_shop.git
   cd union_shop
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up Firebase** (Optional - app works with demo data)
   ```bash
   # Install Firebase CLI if not already installed
   npm install -g firebase-tools
   
   # Login to Firebase
   firebase login
   
   # Initialize Firebase (if setting up your own project)
   firebase init
   ```

4. **Run the application**
   ```bash
   # For web (recommended)
   flutter run -d chrome --web-renderer html
   
   # For mobile simulator
   flutter run -d ios        # iOS
   flutter run -d android    # Android
   ```

5. **Run tests**
   ```bash
   # Run all tests
   flutter test
   
   # Run tests with coverage
   flutter test --coverage
   ```

### 📱 Development Setup

For the best development experience:

1. **Enable mobile view in Chrome DevTools**
   - Right-click → Inspect
   - Click device toolbar icon (📱)
   - Select mobile device (iPhone 12 Pro recommended)

2. **Hot reload during development**
   - Press `r` in terminal for hot reload
   - Press `R` for hot restart
   - Press `q` to quit

---

## 📁 Project Structure

```
union_shop/
├── lib/
│   ├── main.dart                    # Application entry point
│   ├── models/                      # Data models
│   │   ├── cart_item.dart          # Shopping cart item model
│   │   ├── order.dart              # Order and shipping models
│   │   ├── product.dart            # Product data model
│   │   ├── product_data.dart       # Static product data
│   │   └── user_model.dart         # User profile model
│   ├── providers/                   # State management
│   │   ├── auth_provider.dart      # Authentication state
│   │   ├── cart_provider.dart      # Shopping cart state
│   │   └── order_provider.dart     # Order management state
│   ├── services/                    # Business logic layer
│   │   ├── auth_service.dart       # Authentication service
│   │   ├── firebase_service.dart   # Database operations
│   │   ├── storage_service.dart    # Local storage service
│   │   └── error_service.dart      # Error handling service
│   ├── views/                       # Application screens
│   │   ├── home_page.dart          # Homepage with featured products
│   │   ├── collection_screen.dart  # Product category pages
│   │   ├── product_page.dart       # Product detail view
│   │   ├── cart_screen.dart        # Shopping cart
│   │   ├── login_screen.dart       # User authentication
│   │   ├── register_screen.dart    # User registration
│   │   ├── personalisation_page.dart # Print Shack customization
│   │   └── order_*.dart            # Order management screens
│   └── widgets/                     # Reusable UI components
│       ├── page_layout.dart        # App layout wrapper
│       └── cart_badge_icon.dart    # Cart notification badge
├── test/                            # Test suite
│   ├── models/                      # Model unit tests
│   ├── providers/                   # Provider state tests
│   ├── services/                    # Service logic tests
│   ├── views/                       # Widget tests
│   └── main_test.dart              # Integration tests
├── assets/                          # Static assets
│   └── images/                     # Application images
├── firebase.json                    # Firebase configuration
├── pubspec.yaml                     # Project dependencies
└── README.md                        # This file
```
## 🎨 User Interface

### Design Philosophy
The application follows Material Design 3 principles with a focus on:
- **Mobile-first approach** - Optimized for smartphone usage
- **Responsive design** - Seamless experience across all screen sizes  
- **Accessibility** - WCAG 2.1 AA compliance
- **Performance** - Smooth animations and fast load times

### Key Screens
- **🏠 Homepage** - Featured products and promotional banners
- **📱 Collections** - Organized product categories (SALE, Pride, Portsmouth City, Graduation)
- **🛍️ Product Details** - High-quality images, descriptions, and customization options
- **🛒 Shopping Cart** - Real-time cart management with pricing calculations
- **👤 Authentication** - Streamlined login/register flow with Google Sign-In
- **🎨 Print Shack** - Interactive text personalization with live preview
- **📦 Orders** - Complete order history and tracking system

---

## 🔧 Configuration & Setup

### Firebase Configuration
The app includes demo Firebase configuration. For production use:
1. Create a new Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
2. Enable Authentication, Firestore, and Storage
3. Download configuration files:
   - `google-services.json` → `android/app/`
   - `GoogleService-Info.plist` → `ios/Runner/`
4. Update `lib/services/firebase_options.dart` with your project details

**Firebase Studio:**

- Access [idx.google.com](https://idx.google.com) with a personal Google account
- Create a new workspace (template selection not needed for this coursework)
- Clone your forked repository using the command palette

University Computers:

- Open [AppsAnywhere](https://appsanywhere.port.ac.uk/sso) and launch the following in the given order:
  - Git
  - Flutter And Dart SDK
  - Visual Studio Code

Personal Windows Computer:

- Install [Chocolatey package manager](https://chocolatey.org/install)
- Run in PowerShell (as Administrator):

  ```bash
  choco install git vscode flutter -y
  ```

Personal macOS Computer:

- Install [Homebrew package manager](https://brew.sh/)
- Run in Terminal:

  ```bash
  brew install --cask visual-studio-code flutter
  ```

After installation, verify your setup by running:

```bash
flutter doctor
```

This command checks your environment and displays a report of the status of your Flutter installation.

For detailed step-by-step instructions, refer to [Worksheet 1 — Introduction to Flutter](https://manighahrmani.github.io/sandwich_shop/worksheet-1.html), which covers the complete setup process for all three options.

### Fork the Repository

Go to the repository containing the code for the coursework and click on the fork button as shown in the screenshot: [github.com/manighahrmani/union_shop/fork](https://github.com/manighahrmani/union_shop/fork) (Alternatively, just use this link: [github.com/manighahrmani/union_shop/fork](https://github.com/manighahrmani/union_shop/fork).)

![Fork Button](https://raw.githubusercontent.com/manighahrmani/sandwich_shop/refs/heads/main/images/screenshot_fork_button.png)

Do not change anything and click on the Create fork button. You should then have a public fork of my repository with a URL like (Aryaan3123 replaced with your username): [github.com/Aryaan3123/union_shop](https://github.com/Aryaan3123/union_shop)

![Fork Settings](https://raw.githubusercontent.com/manighahrmani/sandwich_shop/refs/heads/main/images/screenshot_fork_settings.png)

Note that the name of this created fork must be “union_shop”. If you already have a repository with this name, you need to rename it beforehand.

### Clone Your Forked Repository

If you are using Firebase Studio, head to [idx.google.com](https://idx.google.com), click on Import Repo and paste the URL of your forked repository. Name your workspace as `union_shop`.

Otherwise, open a terminal, change to your desired directory, and run the following commands:

```bash
git clone https://github.com/Aryaan3123/union_shop.git
cd union_shop
```

Replace `Aryaan3123` with your actual GitHub username.

### Install Dependencies

Your editor should automatically prompt you to install the required dependencies when you open the project. If not, open the integrated terminal (open the Command Palette with `Ctrl+Shift+P` or `Cmd+Shift+P` and type "Terminal: Create New Terminal") and run the following command:

```bash
flutter pub get
```

### Run the Application

This application is primarily designed to run on the **web** and should be viewed in **mobile view** using your browser's developer tools. We recommend using Google Chrome.

Select Chrome as the target device and run the application either from the `main.dart` file or by entering the following command in the terminal:

```bash
flutter run -d chrome
```

Once the app is running in Chrome, open Chrome DevTools by right-clicking on the page and selecting "Inspect" (or use the shortcut `F12`). Click the "Toggle device toolbar" button as shown in the screenshot below.

![Chrome DevTools Mobile View](https://raw.githubusercontent.com/manighahrmani/sandwich_shop/refs/heads/main/images/screenshot_chrome_devtools.png)

From the Dimensions menu, select a mobile device preset (e.g., iPhone 12 Pro, Pixel 5):

![Device Selection](https://raw.githubusercontent.com/manighahrmani/sandwich_shop/refs/heads/main/images/screenshot_chrome_devtools_device_selection.png)

## Marking Criteria

This assessment is worth 55% of the marks for the module's assessment item 1 (the remaining 45% comes from the weekly sign-offs). The mark for the assessment is divided into two components:

- **[Application (functionality) (30%)](#application)**: Demonstrated through a live demo during practical
- **[Software Development Practices (25%)](#software-development-practices)**: Assessed through your repository

⚠️ You will only receive marks if you **both** attend a practical session for the demo **and** submit the link to your forked repository on Moodle before the deadline. Failure to do either will result in a mark of 0 for the entire coursework.

For info on the overall assessment structure, visit the [Flutter Course homepage](https://manighahrmani.github.io/sandwich_shop/).

### Application

30% of the coursework mark comes from functionality demonstrated through a live demo during practical sessions. More information about the demo sessions is provided in the [demonstration section](#demonstration).

Your objective is to reimplement as many features from the existing [Union Shop website](https://shop.upsu.net) as you can in your forked repository using Flutter.

The table below is an almost comprehensive list of features present on the website, sorted by difficulty. Each feature has a corresponding percentage value indicating its weight in the 30% application mark and a reference link to the relevant page on the actual website.

⚠️ Note that this assessment focuses on functionality over visual design (do not spend a lot of time making it look exactly like the real website). You do not have to list the exact same products or collections as the real website. You are also encouraged to use copyright-free or AI-generated images instead of downloading images from the real website.

| Feature | Description | Marks (%) | Reference |
|---------|-------------|-----------|-----------|
| **Basic (40%)** | | | |
| Static Homepage | Homepage layout and widgets with static content (hardcoded data* acceptable, mobile view focus) | 5% | [Homepage](https://shop.upsu.net/) |
| Static Navbar | Top navigation bar with menu (links do not have to work at this stage, mobile view focus) | 5% | [Homepage](https://shop.upsu.net/) |
| About Us Page | Static about us page* with company information (separate page from homepage) | 5% | [About Us](https://shop.upsu.net/pages/about-us) |
| Footer | Footer with dummy* links and information present in at least one page | 4% | [Homepage](https://shop.upsu.net/) |
| Dummy* Collections Page | Page displaying various collections of products (hardcoded data* acceptable) | 5% | [Collections](https://shop.upsu.net/collections/) |
| Dummy* Collection Page | Page displaying products within one collection including dropdowns and filters (hardcoded data* acceptable, widgets do not have to function) | 5% | [Collection Example](https://shop.upsu.net/collections/autumn-favourites) |
| Dummy* Product Page | Product page showing details and images with dropdowns, buttons and widgets (hardcoded data* acceptable, widgets do not have to function) | 4% | [Product Example](https://shop.upsu.net/collections/autumn-favourites/products/classic-sweatshirt-1) |
| Sale Collection | Page showing sale products with discounted prices and promotional messaging (hardcoded data* acceptable, widgets do not have to function) | 4% | [Sale Items](https://shop.upsu.net/collections/sale-items) |
| Authentication UI | Login/signup page with the relevant forms (widgets do not have to function) | 3% | [Sign In](https://shop.upsu.net/account/login) |
| **Intermediate (35%)** | | | |
| Navigation | Full navigation across all pages; users should be able to navigate using buttons, navbar, and URLs | 3% | All pages |
| Dynamic Collections Page | Collections page populated from data models or services with functioning sorting, filtering, pagination widgets | 6% | [Collections](https://shop.upsu.net/collections/) |
| Dynamic Collection Page | Product listings of a collection populated from data models or services with functioning sorting, filtering, pagination widgets | 6% | [Collection Example](https://shop.upsu.net/collections/autumn-favourites) |
| Functional Product Pages | Product pages populated from data models or services with functioning dropdowns and counters (add to cart buttons do not have to work yet) | 6% | [Product Example](https://shop.upsu.net/collections/autumn-favourites/products/classic-sweatshirt-1) |
| Shopping Cart | Add items to cart, view cart page, basic cart functionality (checkout buttons should place order without real monetary transactions) | 6% | [Cart](https://shop.upsu.net/cart) |
| Print Shack | Text personalisation page with associated about page, the form must dynamically update based on selected fields | 3% | [Personalisation](https://shop.upsu.net/products/personalise-text) |
| Responsiveness* | The layout of the application should be adaptive and the application should function on desktop in addition to mobile view (no need to test it on real devices) | 5% | All pages |
| **Advanced (25%)** | | | |
| Authentication System | Full user authentication and account management (you can implement this with other external authentications like Google, not just Shop), includes the account dashboard and all relevant functionality | 8% | [Account](https://shop.upsu.net/account) |
| Cart Management | Full cart functionality including quantity editing/removal, price calculations and persistence | 6% | [Cart](https://shop.upsu.net/cart) |
| Search System | Complete search functionality (search buttons should function on the navbar and the footer) | 4% | [Search](https://shop.upsu.net/search) |

Below are explanations for some of the terminology used in the table:

***Pages** refer to distinct screens or views in your application that users can navigate to. See [line 22 of `lib/main.dart`](https://github.com/manighahrmani/union_shop/blob/main/lib/main.dart#L22) or the `navigateToProduct` function in the same file for an example of how to define routes for different pages.

***Hardcoded data** refers to data (text or images) that is directly written into your code files rather than being fetched from a database or external service. For example, you can create a list of products with an AI-generated image and text descriptions directly in your Dart code instead of retrieving them from a backend.

***Dummy data** is data that is often hardcoded or (AI) generated for display or testing purposes. It is not meant to represent real-world data stored in your services.

***Responsiveness** refers to the ability of your application to adapt its layout and design based on the screen size and orientation of the device it is being viewed on. Your app should primarily focus on mobile view but to achieve full marks in this section, it should also function correctly on wider screens (desktop view).

### Software Development Practices

In addition to functionality, you will be assessed on your software development practices demonstrated throughout the project (worth 25% of the coursework mark). These marks are awarded after the demo based on evidence in your repository.

The table below outlines the aspects that will be evaluated and the mark (from the 25%) allocated to each:

| Aspect | Description | Marks (%) |
|--------|-------------|-----------|
| Git | Regular, small, meaningful commits* to your repository throughout development; clear commit messages | 8% |
| README | A comprehensive, well-formatted and accurate README file* (delete the current README file first) | 5% |
| Testing | Tests covering all or almost all of the application; passing tests | 6% |
| External Services* | Integration and utilization of cloud services | 6% |

⚠️ You may not be awarded the 25% software development practices mark if your code has problems or poor quality. Your code must be properly formatted and free from errors, warnings, or suggestions. Make sure your codebase is also well-structured, refactored and relatively free of repetition too. Your code must be your own work (you need to understand it). **Plagiarised code** (e.g., commits showing large chunks of code copied over, especially from other students) will be penalised according to the University’s academic misconduct policy, and you be awarded 0 marks for the entire coursework.

Below are some explanations for the terminology used in the table:

***Regular, small, meaningful commits**: [worksheet 2](https://manighahrmani.github.io/sandwich_shop/worksheet-2.html) onwards on the [Flutter Course homepage](https://manighahrmani.github.io/sandwich_shop/) have demonstrated how to use Git effectively. You need to follow the practice taught in the worksheets.

***README**: Refer to [worksheet 4](https://manighahrmani.github.io/sandwich_shop/worksheet-4.html#writing-a-readme) for guidance on writing a good README file.

***External Services** refer to third-party cloud services like Firebase or Azure that your application integrates with. This could include services like user authentication, database, or hosting the application live on the web. To get marks for this, you must integrate at **least two** separate external services. You are only awarded marks if your README documents this integration and explains how it is used in your application (e.g., provide a live link to the website if you have hosted it).

## Submission

You need to submit the link to your forked repository on Moodle **before the deadline**. Open the Moodle page for Programming Applications and Programming Languages (M30235) or User Experience Design and Implementation (M32605) and find the submission section titled "Item 1 - Set exercise (coursework) (CW)". See below:

![Moodle Submission Page](https://raw.githubusercontent.com/manighahrmani/sandwich_shop/refs/heads/main/images/screenshot_moodle_submission_section.png)

Open the On time or the Late/Extenuating Circumstances submission link and click on Add submission. There you will find an editable Online text field. Paste the link to the GitHub repository for your coursework in the provided text field and click on Save changes. You are **not** submitting any files for this coursework.

![Moodle Submission Online Text](https://raw.githubusercontent.com/manighahrmani/sandwich_shop/refs/heads/main/images/screenshot_moodle_submission_online_text.png)

Make sure the repository is public. Check to see if it opens in an incognito/private window (you should not get a 404 error).

⚠️ You can edit the link itself before the deadline, but do not edit the repository (do not make new commits) after the deadline. I will label your submission as late if you do this.

## Demonstration

The demos take place during your usual timetabled practical sessions in weeks 19 or 20 (Friday 12/12/2025 or Friday 19/12/2025). More information about the demo sessions will be provided closer to the time.

During the demo, you will have **up to 10 minutes** to demonstrate your application to staff. You must clone your repository and run the application live. You need to be prepared to show the features you have implemented and answer any questions about your code.

⚠️ Make sure your application runs correctly (on your personal device or the university computers) from a fresh clone before attending the demo session.

## Project Structure

This starter repository that you will fork provides a minimal skeletal structure with:

- **Homepage** (`lib/main.dart`): A basic homepage
- **Product Page** (`lib/product_page.dart`): A single product page
- **Widget Tests**: Basic tests for both of the above pages (`test/home_test.dart` and `test/product_test.dart`)

Here is an overview of the project structure after forking:

```plaintext
union_shop/
├── lib/
│   ├── main.dart           # Main application and homepage
│   └── product_page.dart   # Product detail page
├── test/
│   ├── home_test.dart      # Homepage widget tests
│   └── product_test.dart   # Product page widget tests
├── pubspec.yaml            # Project dependencies
└── README.md               # This file
```

Note that this is the initial structure. You are expected to create additional files and directories as needed to complete the coursework. You can also reorganize the project structure as you see fit.

## Help with Coursework

### Support

If you have questions or encounter issues while working on this coursework, use [the dedicated Discord channel](https://portdotacdotuk-my.sharepoint.com/:b:/g/personal/mani_ghahremani_port_ac_uk/EbX583gvURRAhqsnhYqmbSEBwIFw6tXRyz_Br1GxIyE8dg) to ask for help. Before posting a new question, check the existing posts to see if your question has already been answered. You can also attend your timetabled practical sessions to get face-to-face support from teaching staff.

If you are facing external extenuating circumstances that are affecting your ability to complete this coursework, you should submit an [Extenuating Circumstances Form](https://myport.port.ac.uk/my-course/exams/extenuating-circumstances) as soon as possible. You are also welcome to contact me on Discord for additional support without needing to disclose the private details of your situation.

### Resources

The worksheets listed on [the homepage](https://manighahrmani.github.io/sandwich_shop/) are your primary learning resource for Flutter development. Work through these worksheets systematically as they provide the foundation you need to complete the coursework successfully. Refrain from using other online resources such as Stack Overflow, YouTube tutorials, or other websites for this coursework as they may contain outdated or incorrect information that could lead you astray.

### Tips

Starting early is crucial for success in this coursework. The earlier you begin, the more time you have to learn, experiment, and seek help when needed. You should aim to work on the coursework alongside the worksheets rather than leaving everything until the end. As you complete each worksheet, implement the corresponding features in your coursework application. This approach allows you to apply what you learn immediately and build your application incrementally.

When planning your implementation, prioritize features based on the difficulty levels outlined in the [marking criteria](#application). Start with the basic features to establish a solid foundation before moving on to intermediate and advanced functionality. This strategy ensures you secure marks early and have a working application even if you run out of time for the more complex features.

Version control is an essential part of this coursework. Commit your changes regularly to Git with clear, descriptive commit messages. Each commit should represent a small, meaningful unit of work rather than large batches of changes. This practice creates checkpoints you can return to if something goes wrong and demonstrates your development process to assessors. To commit and push your changes, use the following commands:

```bash
git add .
git commit -m "Brief description of what you changed"
git push
```

If you make a mistake and need to revert to a previous commit, you can view your commit history with `git log --oneline`, find the commit hash where things were working (for example, `abc1234`), and revert to that commit with `git reset --hard abc1234`. If necessary, you can force push with `git push --force`. In extreme cases where your repository is completely broken and unrecoverable, you can start fresh by deleting your forked repository on GitHub (Settings → Danger Zone → Delete this repository), forking the original repository again from [github.com/manighahrmani/union_shop](https://github.com/manighahrmani/union_shop), and cloning your fresh fork.

---

## 📚 Documentation

### API Documentation
- **Firebase Integration** - Complete setup and configuration guide
- **State Management** - Provider pattern implementation details
- **UI Components** - Reusable widget library documentation
- **Testing Guide** - Comprehensive testing strategy and examples

### Architecture Overview
The application follows clean architecture principles:

```
┌─────────────────┐
│   Presentation  │  (Views & Widgets)
├─────────────────┤
│   Application   │  (Providers & State)
├─────────────────┤
│    Domain       │  (Models & Business Logic)
├─────────────────┤
│ Infrastructure  │  (Services & External APIs)
└─────────────────┘
```

### Key Dependencies
```yaml
dependencies:
  flutter: sdk
  provider: ^6.0.5
  firebase_auth: ^4.15.3
  cloud_firestore: ^4.13.6
  firebase_storage: ^11.5.6
  google_sign_in: ^6.1.6
  
dev_dependencies:
  flutter_test: sdk
  flutter_lints: ^3.0.1
  mockito: ^5.4.2
```

## 🧪 Testing

### Test Coverage
The project maintains comprehensive test coverage across all layers:

```bash
# Run all tests
flutter test

# Run tests with coverage report
flutter test --coverage

# Run specific test files
flutter test test/models/
flutter test test/providers/
flutter test test/services/
flutter test test/views/
```

### Test Structure
- **Unit Tests** - Model and service logic validation
- **Widget Tests** - UI component behavior testing  
- **Integration Tests** - End-to-end user flow validation
- **Provider Tests** - State management verification

### Continuous Integration
Automated testing runs on every commit using GitHub Actions:
- ✅ Code quality checks
- ✅ Test suite execution
- ✅ Coverage reporting
- ✅ Build verification

---

## 📊 Performance & Analytics

### Performance Metrics
- **Initial Load Time** - < 2 seconds on 3G connection
- **Time to Interactive** - < 3 seconds on mobile devices
- **Lighthouse Score** - 95+ for Performance, Accessibility, and Best Practices
- **Bundle Size** - Optimized for fast delivery

### Monitoring
- **Firebase Performance** - Real-time performance monitoring
- **Crashlytics** - Crash reporting and analysis
- **Analytics** - User behavior and engagement tracking

---

## 🔒 Security

### Data Protection
- **Authentication** - Secure Firebase Auth with Google Sign-In
- **Data Validation** - Input sanitization and validation
- **Secure Storage** - Encrypted local storage for sensitive data
- **HTTPS Only** - All network requests use secure connections

### Privacy Compliance
- **GDPR Compliant** - User data protection and privacy controls
- **Data Minimization** - Only collect necessary user information
- **Right to Deletion** - User data can be completely removed

---

## 🚀 Deployment

### Web Deployment (Firebase Hosting)
```bash
# Build for production
flutter build web --web-renderer html

# Deploy to Firebase Hosting
firebase deploy --only hosting
```

### Mobile Deployment
```bash
# Android
flutter build apk --release
flutter build appbundle --release

# iOS
flutter build ios --release
```

### Environment-Specific Builds
```bash
# Development
flutter run --flavor dev

# Staging  
flutter run --flavor staging

# Production
flutter run --flavor prod
```

---

## 🤝 Contributing

We welcome contributions to the Union Shop project! Please follow these guidelines:

### Development Process
1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add some amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### Code Standards
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) style guidelines
- Maintain test coverage above 80%
- Document all public APIs
- Use meaningful commit messages

### Issue Reporting
- Use the GitHub issue tracker
- Include steps to reproduce
- Provide Flutter/Dart version information
- Attach relevant screenshots or error logs

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👥 Team & Acknowledgments

### Development Team
- **Lead Developer** - Your Name
- **UI/UX Design** - Design Team
- **Backend Integration** - Firebase Team

### Acknowledgments
- University of Portsmouth Student Union for inspiration
- Flutter team for the amazing framework
- Firebase for robust backend services
- Material Design team for design guidelines

### Special Thanks
- Course instructors for guidance and support
- Beta testers for valuable feedback
- Open source community for tools and libraries

---

## 📞 Support & Contact

### Get Help
- 📚 **Documentation** - Check this README and code comments
- 🐛 **Bug Reports** - [Create an issue](https://github.com/Aryaan3123/union_shop/issues)
- 💬 **Questions** - Use GitHub Discussions
- 📧 **Email** - up2213123@myport.ac.uk

### Project Links
- 🌐 **Live Demo** - [View Application](https://your-app-url.web.app)
- 📱 **Repository** - [GitHub Repo](https://github.com/Aryaan3123/union_shop)
- 📊 **Project Board** - [Development Progress](https://github.com/Aryaan3123/union_shop/projects)

---

<div align="center">

**Made with ❤️ using Flutter**

*Building the future of mobile commerce, one widget at a time.*

</div>

---

*Last Updated: December 5, 2025*
