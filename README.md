**Flutter Exploring Bloc State Management**
This repository contains a Flutter application designed for managing and viewing products. The app features a robust architecture utilizing the BLoC (Business Logic Component) pattern for state management and Equatable for comparing and managing product states.

**Key Features:**
Product Listing: Displays a list of products fetched from a remote API.
Product Details: Allows navigation to a detailed view of each product, including its description and other attributes.
Cart Management: Users can add products to a common cart, with checks to prevent duplicate entries.
State Management: Utilizes the BLoC pattern for managing state changes and handling user actions effectively.
Product Duplication Check: Ensures that products added to the cart are not duplicated, providing proper state management and feedback.
Image Loading: Implements image loading with progress indicators to enhance user experience.
Decimal Handling: Features utilities for formatting decimal numbers to two decimal places.

**Technologies Used:**
Flutter: For building the mobile application.
Dart: The programming language used for development.
BLoC: For state management and business logic separation.
Equatable: For value comparison of state and event classes.
Http: For making API requests.
