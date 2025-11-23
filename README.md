# Union Shop - Flutter E-commerce Application

A Flutter recreation of the University of Portsmouth Student Union's e-commerce website ([shop.upsu.net](https://shop.upsu.net)).

## About

This mobile-first Flutter application recreates the core functionality of the UPSU online shop, including product browsing, cart management, and user authentication. Built as coursework for Programming Applications and User Experience Design modules.

## Features

### ✅ Implemented
- **Responsive Homepage** - Mobile-first design with hero section
- **Product Navigation** - Browse products with image cards
- **Cross-platform Layout** - Adaptive UI for mobile and desktop
- **Navigation System** - Route-based navigation between pages

### 🚧 In Development
- **Firebase Authentication** - User login/signup system
- **Dynamic Product Data** - Firestore database integration
- **Shopping Cart** - Add/remove items with state management
- **Search Functionality** - Product search and filtering

### 📋 Planned
- **User Profiles** - Account management and order history
- **Checkout System** - Complete purchase workflow
- **Admin Panel** - Product management interface

## 🎯 Progress Checklist

### **Phase 1: Foundation & Quick Wins (Days 1-3)** 
*Target: 40% Basic + 25% Software Practices = 65% total marks*

#### **📚 Software Development Practices (25% of total marks)**
- [ ] **Git Setup**: Fork repository and set up proper git workflow
- [ ] **README**: Create comprehensive README with progress checklist *(5% marks)*
- [ ] **First Commits**: Make 5+ meaningful commits with clear messages *(8% marks - ongoing)*
- [ ] **External Services Planning**: Research Firebase setup for Auth + Firestore *(6% marks - prep)*

#### **🏠 Basic Features - Static UI (40% of total marks)**
- [x] **Static Homepage**: Layout with hero section and product cards *(5% marks)*
- [ ] **Static Navbar**: Responsive navigation bar with mobile menu *(5% marks)*
- [ ] **About Us Page**: Create static about page *(5% marks)*
- [ ] **Footer Component**: Add footer to all pages *(4% marks)*
- [ ] **Collections Page**: Static grid of product collections *(5% marks)*
- [ ] **Collection Detail Page**: Products within a collection *(5% marks)*
- [ ] **Product Detail Page**: Individual product view *(4% marks)*
- [ ] **Sale Collection**: Sale items page with discounts *(4% marks)*
- [ ] **Auth UI**: Login/signup forms (non-functional) *(3% marks)*

### **Phase 2: External Services Integration (Days 4-6)**
*Target: 6% External Services marks*

#### **🔥 Firebase Setup**
- [ ] **Firebase Project**: Create new Firebase project
- [ ] **Firebase Auth**: Set up authentication service
- [ ] **Firestore Database**: Set up product database
- [ ] **Flutter Integration**: Add Firebase packages to pubspec.yaml
- [ ] **Environment Setup**: Configure Firebase in Flutter app
- [ ] **README Documentation**: Document Firebase integration

### **Phase 3: Dynamic Features (Days 7-9)**
*Target: 35% Intermediate marks*

#### **🔄 Dynamic Data (Intermediate - 35% marks)**
- [ ] **Navigation System**: Full app navigation between pages *(3% marks)*
- [ ] **Dynamic Collections**: Load collections from Firestore *(6% marks)*
- [ ] **Dynamic Collection Page**: Products loaded from database *(6% marks)*
- [ ] **Functional Product Pages**: Real data with working widgets *(6% marks)*
- [ ] **Shopping Cart**: Add to cart, view cart functionality *(6% marks)*
- [ ] **Print Shack**: Text personalization page *(3% marks)*
- [ ] **Responsive Design**: Desktop + mobile layouts *(5% marks)*

### **Phase 4: Advanced Features (Days 10-11)**
*Target: 25% Advanced marks + Final Testing*

#### **🚀 Advanced Features (25% marks)**
- [ ] **Authentication System**: Full working auth with Google *(8% marks)*
- [ ] **Cart Management**: Full cart with quantity, persistence *(6% marks)*
- [ ] **Search System**: Working search functionality *(4% marks)*
- [ ] **Testing**: Write comprehensive widget tests *(6% marks)*
- [ ] **Final Polish**: Bug fixes and final commits

### **📊 Current Progress Summary**
- **Basic Features**: 1/9 completed (5/40% earned)
- **Software Practices**: 0/4 completed (0/25% earned)
- **Intermediate Features**: 0/7 completed (0/35% earned)
- **Advanced Features**: 0/4 completed (0/25% earned)
- **Overall Progress**: ~5% / 125% total possible

*Last Updated: November 23, 2025*

### **🎯 Daily Targets**
- **Day 1-3**: Complete all Basic Features (40% marks) + README/Git setup (13% marks)
- **Day 4-6**: Firebase integration (6% marks) + Start Dynamic Features
- **Day 7-9**: Complete Intermediate Features (35% marks)
- **Day 10-11**: Advanced Features (25% marks) + Testing (6% marks)

### **📈 Commit Strategy**
*Target: 8% marks for regular, meaningful commits*
- [ ] Commit #1: "Initial README update with progress checklist"
- [ ] Commit #2: "Add responsive navbar component"
- [ ] Commit #3: "Create About Us page"
- [ ] Commit #4: "Add footer component to all pages"
- [ ] Commit #5: "Create collections page layout"
- [ ] *Continue with micro-commits for each feature...*

---

## Installation & Setup

### Prerequisites
- Flutter SDK (3.0+)
- Dart SDK (2.17.0+)
- Android Studio/VS Code
- Git

### Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/[your-username]/union_shop.git
   cd union_shop
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

4. **For web development**
   ```bash
   flutter run -d chrome
   ```
2. **University Windows computers** (via AppsAnywhere)
3. **Personal computer** (Windows or macOS)

Below is a quick guide for each option. For more information, you can refer to [Worksheet 0 — Introduction to Dart, Git and GitHub](https://manighahrmani.github.io/sandwich_shop/worksheet-0.html) and [Worksheet 1 — Introduction to Flutter](https://manighahrmani.github.io/sandwich_shop/worksheet-1.html).

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

Do not change anything and click on the Create fork button. You should then have a public fork of my repository with a URL like (YOUR-USERNAME replaced with your username): [github.com/YOUR-USERNAME/union_shop](https://github.com/YOUR-USERNAME/union_shop)

![Fork Settings](https://raw.githubusercontent.com/manighahrmani/sandwich_shop/refs/heads/main/images/screenshot_fork_settings.png)

Note that the name of this created fork must be “union_shop”. If you already have a repository with this name, you need to rename it beforehand.

### Clone Your Forked Repository

If you are using Firebase Studio, head to [idx.google.com](https://idx.google.com), click on Import Repo and paste the URL of your forked repository. Name your workspace as `union_shop`.

Otherwise, open a terminal, change to your desired directory, and run the following commands:

```bash
git clone https://github.com/YOUR-USERNAME/union_shop.git
cd union_shop
```

Replace `YOUR-USERNAME` with your actual GitHub username.

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

AI tools are valuable during development, and you are encouraged to use them. However, you must apply the best practices taught in the worksheets, particularly those covered in [Worksheet 6](https://manighahrmani.github.io/sandwich_shop/worksheet-6.html). AI-generated code should be reviewed, understood, and adapted to fit your application properly. Blindly copying AI suggestions without understanding them will likely result in poor code quality and may not meet the requirements. Use AI as a learning aid and coding partner rather than a replacement for your own understanding and decision-making.
