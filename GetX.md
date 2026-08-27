# MASTER PROMPT — BUILD A PRODUCTION E-COMMERCE APP

Act as my **Senior Flutter Architect, Clean Architecture Expert, Supabase Backend Engineer, PostgreSQL Database Designer, GetX State Management Expert, UI/UX Engineer, Security Engineer, and Code Reviewer**.

I want to build a **complete production-style E-Commerce mobile application using Flutter + GetX + Supabase**.

Do NOT create a simple tutorial project.

Build this as a **professional, scalable, maintainable real-world application** that could eventually be used as the foundation for a commercial mobile application.

---

# 🎯 PROJECT GOAL

Build a complete E-Commerce application using:

## Frontend

* Flutter
* Dart
* Material 3
* Responsive UI
* GetX
* Clean Architecture
* Repository Pattern
* Dependency Injection
* Feature-based architecture

## Backend

* Supabase
* PostgreSQL
* Supabase Authentication
* Supabase Storage
* Supabase Realtime
* Supabase Edge Functions when appropriate

## Development

* VS Code
* Git
* GitHub
* Supabase CLI
* Database migrations

---

# 🧱 CORE ARCHITECTURE

Use **Clean Architecture**.

The application should follow:

```text id="7a3n1d"
Presentation
      ↓
GetX Controller
      ↓
Use Case
      ↓
Repository Interface
      ↓
Repository Implementation
      ↓
Data Source
      ↓
Supabase
      ↓
PostgreSQL
```

More specifically:

```text id="1z4y0p"
Flutter UI
     ↓
GetX Controller
     ↓
Use Case
     ↓
Repository
     ↓
Supabase Data Source
     ↓
Supabase
     ↓
PostgreSQL
```

For dependency injection:

```text id="3xq9me"
GetX Bindings
      ↓
Dependencies
      ↓
Controller
      ↓
Use Case
      ↓
Repository
      ↓
Data Source
```

---

# 🚨 IMPORTANT ARCHITECTURE RULE

Do NOT put Supabase queries directly inside:

* Widgets
* Pages
* GetX Controllers

Do NOT put database/business logic directly inside UI.

GetX Controllers should manage **presentation state and user interactions**.

The architecture should remain:

```text id="d2u7kc"
UI
 ↓
Controller
 ↓
Use Case
 ↓
Repository
 ↓
Data Source
 ↓
Supabase
```

---

# 📁 PROJECT STRUCTURE

Use a feature-based Clean Architecture structure.

```text id="f8k2qm"
lib/
│
├── app/
│   ├── app.dart
│   ├── bindings/
│   │   └── initial_binding.dart
│   └── routes/
│       ├── app_pages.dart
│       └── app_routes.dart
│
├── core/
│   ├── constants/
│   ├── errors/
│   ├── extensions/
│   ├── helpers/
│   ├── services/
│   ├── utils/
│   ├── validators/
│   └── theme/
│
├── config/
│   ├── environment/
│   └── supabase/
│
├── features/
│
│   ├── auth/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   │
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   │
│   │   └── presentation/
│   │       ├── bindings/
│   │       ├── controllers/
│   │       ├── pages/
│   │       └── widgets/
│   │
│   ├── home/
│   ├── products/
│   ├── categories/
│   ├── brands/
│   ├── favorites/
│   ├── cart/
│   ├── checkout/
│   ├── orders/
│   ├── profile/
│   ├── notifications/
│   └── admin/
│
└── main.dart
```

Explain every folder before using it.

Do not create unnecessary files.

---

# 🧠 GETX RESPONSIBILITIES

Use GetX for:

* State management
* Reactive state
* Dependency injection
* Bindings
* Navigation
* Route middleware
* Snackbars
* Dialogs
* Bottom sheets

Use:

```dart id="q1x7kf"
Obx()
```

for reactive UI where appropriate.

Use:

```dart id="9c2vkd"
GetBuilder<T>()
```

when simple/manual controller updates are more appropriate.

Use:

```dart id="a8n3xp"
Get.find<T>()
```

for dependency retrieval where appropriate.

Use:

```dart id="2m9r8a"
Get.put()
Get.lazyPut()
Get.putAsync()
```

appropriately.

Do NOT blindly use `Obx()` everywhere.

Explain the difference between:

```text id="8z7w0h"
Obx
GetBuilder
GetX<T>
Get.find
Get.put
Get.lazyPut
Bindings
```

---

# 🔄 GETX DATA FLOW

For example, when a user adds a product to the cart:

```text id="4k7h9c"
User
 ↓
Product Details Page
 ↓
CartController
 ↓
AddToCartUseCase
 ↓
CartRepository
 ↓
CartDataSource
 ↓
Supabase
 ↓
PostgreSQL
```

Then:

```text id="m6z0qp"
Supabase response
 ↓
Repository
 ↓
Use Case
 ↓
CartController
 ↓
Rx state
 ↓
Obx()
 ↓
UI
```

Explain this flow for every major feature.

---

# 📦 REQUIRED FEATURES

Build the following modules.

---

# 1. SPLASH SCREEN

Implement:

* App initialization
* Supabase initialization
* Session checking
* Loading state
* Authentication state
* Navigation

Flow:

```text id="0q5k7s"
Splash
 ↓
Initialize
 ↓
Check Supabase Session
 ↓
Authenticated?
 ├── Yes → Home
 └── No  → Welcome/Login
```

---

# 2. ONBOARDING

Create:

* Splash
* Onboarding
* Welcome
* Login
* Register

Use responsive UI.

Create reusable components.

---

# 3. AUTHENTICATION

Implement:

### Register

* Full name
* Email
* Password
* Confirm password

### Login

* Email
* Password

### Other

* Logout
* Forgot password
* Reset password
* Email verification
* Session persistence
* Authentication state

Use Supabase Auth.

---

# 4. AUTH CONTROLLER

Create:

```text id="y8v2nq"
AuthController
```

Responsibilities:

* Login
* Register
* Logout
* Loading state
* Error state
* Current user
* Session state

Example reactive state:

```dart id="h4v8s2"
final isLoading = false.obs;
final currentUser = Rxn<User>();
final errorMessage = ''.obs;
```

But do not place Supabase implementation directly inside the controller.

Architecture:

```text id="e7d1vp"
AuthController
 ↓
LoginUseCase
 ↓
AuthRepository
 ↓
AuthDataSource
 ↓
Supabase Auth
```

---

# 5. USER PROFILE

Create:

```text id="2h7c9p"
Profile
```

Fields:

```text id="8t4k2a"
id
full_name
email
phone
avatar_url
created_at
updated_at
```

Features:

* View profile
* Edit profile
* Upload avatar
* Update name
* Update phone
* Change password
* Logout

---

# 6. DATABASE DESIGN

Create a professional PostgreSQL schema.

Required tables:

```text id="x2m9ab"
profiles
categories
brands
products
product_images
favorites
cart_items
addresses
orders
order_items
notifications
reviews
```

Explain:

* Every table
* Every column
* Primary keys
* Foreign keys
* Constraints
* Indexes
* Relationships

Create an ERD conceptually.

---

# 7. PRODUCT SYSTEM

Product fields should include appropriate fields such as:

```text id="k3z8vf"
id
category_id
brand_id
name
description
price
original_price
stock_quantity
rating
review_count
is_active
created_at
updated_at
```

Implement:

* Product list
* Product details
* Product images
* Categories
* Brands
* Search
* Filtering
* Sorting
* Pagination
* Stock handling

---

# 8. PRODUCT CONTROLLER

Create:

```text id="j8q2mp"
ProductController
```

Manage:

```text id="2t9x7c"
products
selectedProduct
isLoading
isLoadingMore
errorMessage
searchQuery
selectedCategory
selectedBrand
sortOption
```

Use reactive state where useful:

```dart id="v4c8nx"
final products = <Product>[].obs;
final isLoading = false.obs;
final isLoadingMore = false.obs;
final searchQuery = ''.obs;
```

Do not make every field reactive without a reason.

---

# 9. CATEGORIES

Implement:

* Category list
* Category details
* Products by category
* Category filtering

Use PostgreSQL relationships.

---

# 10. BRANDS

Implement:

* Brand list
* Brand details
* Products by brand

---

# 11. SEARCH

Implement:

* Product search
* Search loading
* Empty result
* Clear search
* Debouncing
* Search history concept

Use appropriate PostgreSQL queries.

Explain database indexing.

---

# 12. FILTERING

Implement:

* Category
* Brand
* Price range
* Rating
* Stock availability

Allow multiple filters.

---

# 13. SORTING

Implement:

```text id="0p4gkh"
Price Low → High
Price High → Low
Newest
Rating
Popularity
```

---

# 14. PAGINATION

Implement efficient pagination.

Support:

```text id="2b9x0d"
Initial loading
Loading more
No more data
Pagination error
Refresh
```

Use Supabase range queries where appropriate.

---

# 15. FAVORITES

Create:

```text id="8v3jka"
FavoriteController
```

Features:

* Add favorite
* Remove favorite
* Check favorite
* Favorite list
* Persistent database storage

Database:

```text id="z5y7xq"
favorites
```

Secure with RLS.

---

# 16. CART

Create:

```text id="r4w8ks"
CartController
```

Features:

* Add product
* Remove product
* Increase quantity
* Decrease quantity
* Update quantity
* Clear cart
* Calculate subtotal
* Calculate total
* Validate stock

Reactive state:

```dart id="q9v3mc"
final cartItems = <CartItem>[].obs;
final totalPrice = 0.0.obs;
final cartCount = 0.obs;
```

Prefer derived getters/computed state where appropriate instead of unnecessarily storing duplicate state.

---

# 17. CART UI

Create professional cart UI.

Include:

* Product image
* Product name
* Price
* Quantity selector
* Remove button
* Subtotal
* Total
* Checkout button

Handle:

* Empty cart
* Loading
* Error
* Out of stock
* Quantity limits

---

# 18. ADDRESS MANAGEMENT

Create:

```text id="k5z9cw"
AddressController
```

Features:

* Add address
* Edit address
* Delete address
* Set default
* Select address

Database:

```text id="q3m7xn"
addresses
```

---

# 19. CHECKOUT

Flow:

```text id="b7v5q2"
Cart
 ↓
Checkout
 ↓
Select Address
 ↓
Order Summary
 ↓
Payment
 ↓
Confirmation
```

Display:

* Products
* Quantity
* Subtotal
* Delivery fee
* Discount
* Total
* Address
* Payment method

---

# 20. ORDER SYSTEM

Tables:

```text id="n2q8wa"
orders
order_items
```

Implement:

* Create order
* Order history
* Order details
* Cancel order
* Track order

---

# 21. ORDER CONTROLLER

Create:

```text id="c7m1zx"
OrderController
```

Manage:

* Orders
* Selected order
* Loading
* Error
* Order status
* Creating order

---

# 22. ORDER STATUS

Use statuses such as:

```text id="f9q2vn"
pending
confirmed
processing
shipped
delivered
cancelled
```

Explain valid state transitions.

---

# 23. SUPABASE RLS

Enable RLS for all sensitive tables.

Secure:

```text id="a8q7m1"
profiles
favorites
cart_items
addresses
orders
order_items
notifications
reviews
```

Users should only access their own private data.

Products/categories/brands may have public read access when appropriate.

Explain every policy.

---

# 24. SUPABASE STORAGE

Create:

```text id="v7k4q2"
avatars
product-images
```

Implement:

* Upload
* Replace
* Delete
* Retrieve URL
* Secure access

Explain Storage policies.

---

# 25. REALTIME

Use Realtime for appropriate features.

Implement:

```text id="x4m8zc"
Order status
Notifications
```

Flow:

```text id="p8q2nv"
Admin
 ↓
Update order
 ↓
PostgreSQL
 ↓
Supabase Realtime
 ↓
OrderController
 ↓
Rx state
 ↓
Obx()
 ↓
Flutter UI
```

Properly dispose/unsubscribe from channels.

---

# 26. NOTIFICATIONS

Create:

```text id="w3j8ka"
NotificationController
```

Features:

* Notification list
* Read/unread
* Mark as read
* Delete

Use Realtime where appropriate.

---

# 27. REVIEWS

Implement:

* Create review
* Update review
* Delete review
* Rating
* Comment
* Product reviews

Enforce appropriate database constraints.

Consider:

```text id="k8m2vr"
One review per user per purchased product/order
```

---

# 28. ADMIN

Create Admin module.

Admin can:

* Create products
* Update products
* Delete products
* Manage categories
* Manage brands
* View orders
* Update order status
* View users

Regular users must not access admin operations.

---

# 29. ROLE-BASED ACCESS CONTROL

Support:

```text id="y6p3qd"
user
admin
```

Use:

```text id="m1z8vx"
Authentication
+
Authorization
+
RLS
```

Do not depend only on Flutter UI for authorization.

---

# 30. GETX BINDINGS

Use Bindings to manage dependencies.

For example:

```text id="p4q7nm"
AuthBinding
ProductBinding
CartBinding
OrderBinding
ProfileBinding
AdminBinding
```

Explain:

* Why Bindings exist
* Lazy dependencies
* Controller lifecycle
* Dependency cleanup
* Route-specific dependencies

Use:

```dart id="c7x2mb"
Get.lazyPut<AuthController>(() => AuthController(...));
```

where appropriate.

---

# 31. GETX NAVIGATION

Use GetX navigation.

Teach:

```dart id="d3n8vq"
Get.to()
Get.back()
Get.off()
Get.offAll()
Get.toNamed()
```

Use named routes for the production project.

Create:

```text id="x8q1mc"
AppRoutes
AppPages
Bindings
```

---

# 32. ROUTE MIDDLEWARE

Implement route protection.

For example:

```text id="n7c3pa"
User
 ↓
Authenticated Route

Admin
 ↓
Admin Route
```

Teach GetX middleware.

Explain:

* Authentication middleware
* Admin middleware
* Redirect behavior
* Unauthorized access

---

# 33. GETX STATE MANAGEMENT BEST PRACTICES

Teach:

### Reactive state

```dart id="j5r9qb"
final isLoading = false.obs;
```

### RxList

```dart id="q2m7xc"
final products = <Product>[].obs;
```

### Rxn

```dart id="v9k4za"
final user = Rxn<User>();
```

### Obx

```dart id="m6c2wp"
Obx(() {
  return Text(controller.cartCount.value.toString());
});
```

### GetBuilder

Explain when manual updates are better.

### Controller lifecycle

Teach:

```text id="r8q3mv"
onInit()
onReady()
onClose()
```

Explain when each should be used.

---

# 34. DEPENDENCY INJECTION

Use GetX dependency injection.

Architecture:

```text id="q7x4np"
SupabaseClient
 ↓
DataSource
 ↓
Repository
 ↓
UseCase
 ↓
Controller
```

Dependencies should be injected rather than created randomly inside widgets.

---

# 35. ERROR HANDLING

Handle:

* Network errors
* Supabase errors
* PostgreSQL errors
* Authentication errors
* Storage errors
* RLS permission errors
* Validation errors
* Empty results
* Timeout
* Session expiration

Create appropriate:

```text id="w8m3kq"
Exception
Failure
Result
```

architecture where useful.

---

# 36. UI STATE

Every asynchronous operation should support:

```text id="z4p8nc"
Initial
Loading
Success
Empty
Error
```

Use GetX reactive state appropriately.

---

# 37. RESPONSIVE UI

Support:

* Small phones
* Large phones
* Tablets
* Landscape

Use:

* LayoutBuilder
* MediaQuery where appropriate
* Flexible
* Expanded
* Wrap
* GridView
* Slivers
* Adaptive navigation

Avoid hardcoded dimensions.

---

# 38. THEME

Create:

```text id="j2q9vx"
theme/
├── app_colors.dart
├── app_text_styles.dart
├── app_theme.dart
├── app_spacing.dart
└── app_dimensions.dart
```

Support:

* Light theme
* Dark theme

---

# 39. REUSABLE UI COMPONENTS

Create reusable components:

```text id="m7x2qp"
AppButton
AppTextField
AppSearchBar
ProductCard
ProductGrid
ProductListItem
PriceText
RatingWidget
QuantitySelector
LoadingWidget
ErrorWidget
EmptyStateWidget
AppDialog
AppBottomSheet
```

Do not duplicate UI code.

---

# 40. VALIDATION

Create reusable validators:

* Email
* Password
* Confirm password
* Phone
* Name
* Address

---

# 41. SECURITY

NEVER:

* Put service-role key in Flutter
* Commit secrets
* Trust frontend authorization
* Disable RLS just to fix errors
* Allow users to modify admin data
* Allow users to access another user's private data

Always explain the security reason.

---

# 42. DATABASE PERFORMANCE

Teach:

* Indexes
* Foreign keys
* Query optimization
* Pagination
* Efficient filtering
* Selecting only required columns
* Avoiding duplicate requests

---

# 43. SUPABASE MIGRATIONS

Use:

```text id="c8q3ny"
supabase/
└── migrations/
    ├── 001_profiles.sql
    ├── 002_categories.sql
    ├── 003_brands.sql
    ├── 004_products.sql
    ├── 005_favorites.sql
    ├── 006_cart.sql
    ├── 007_addresses.sql
    ├── 008_orders.sql
    └── ...
```

Do not rely only on manual Dashboard changes.

---

# 44. SEED DATA

Create realistic development data for:

* Categories
* Brands
* Products
* Orders

Use enough products to test pagination and search.

---

# 45. TESTING

Test:

### Unit

* Models
* Validators
* Use cases
* Business logic

### Controller

* Loading
* Success
* Error
* State changes

### Widget

* Login
* Product list
* Cart
* Checkout

### Integration

```text id="y2m8vc"
Register
 ↓
Login
 ↓
Browse products
 ↓
Favorite
 ↓
Add to cart
 ↓
Checkout
 ↓
Create order
 ↓
Track order
```

---

# 46. GIT

Use:

```text id="v5q8ma"
main
develop
feature/*
bugfix/*
```

Teach:

* Commit messages
* Branching
* Pull requests
* Environment files
* Supabase migrations

---

# 47. README

Create a professional README containing:

* Project overview
* Features
* Architecture
* Folder structure
* Tech stack
* Installation
* Supabase configuration
* Database setup
* Migrations
* Environment variables
* Running the project
* Testing
* Screenshots
* Future improvements

---

# 48. DEVELOPMENT PHASES

Build progressively.

Do NOT generate the entire application in one response.

Use:

```text id="w9q3ka"
PHASE 1
Project Planning & Requirements

↓

PHASE 2
Flutter Project Setup

↓

PHASE 3
Clean Architecture

↓

PHASE 4
GetX Setup

↓

PHASE 5
Supabase Setup

↓

PHASE 6
PostgreSQL Database

↓

PHASE 7
Authentication

↓

PHASE 8
Profile

↓

PHASE 9
Products

↓

PHASE 10
Categories & Brands

↓

PHASE 11
Search & Filtering

↓

PHASE 12
Favorites

↓

PHASE 13
Cart

↓

PHASE 14
Addresses

↓

PHASE 15
Checkout

↓

PHASE 16
Orders

↓

PHASE 17
Realtime

↓

PHASE 18
Notifications

↓

PHASE 19
Reviews

↓

PHASE 20
Admin

↓

PHASE 21
Security

↓

PHASE 22
Testing

↓

PHASE 23
Performance

↓

PHASE 24
Production Preparation
```

---

# 📖 TEACHING FORMAT

For every phase:

## 1. Objective

Explain what we are building.

## 2. Architecture

Show the architecture/data flow.

## 3. Folder Structure

Show which files are required.

## 4. Dependencies

Explain required packages.

## 5. Database

Provide SQL/migrations when needed.

## 6. Implementation

Provide complete code.

## 7. Code Explanation

Explain important code.

## 8. GetX Explanation

Explain:

* Controller
* Rx state
* Obx
* Bindings
* Dependency injection
* Lifecycle

when applicable.

## 9. Supabase Explanation

Explain:

* Query
* Authentication
* RLS
* Storage
* Realtime

when applicable.

## 10. Testing

Explain how to test.

## 11. Common Errors

Explain likely errors.

## 12. Best Practices

Explain professional practices.

## 13. Exercise

Give me an implementation exercise.

## 14. Challenge

Give me a harder task.

Then STOP.

Wait for me to say:

**NEXT**

---

# 💻 CODE RULES

When providing code:

* Show the complete file when creating a new file.
* Always show the file path.
* Do not provide unexplained fragments.
* Keep architecture consistent.
* Do not silently change architecture.
* Avoid duplicate classes.
* Avoid duplicate controllers.
* Avoid duplicate dependencies.
* Explain important code.
* Use null safety.
* Use strong typing.
* Use meaningful names.

---

# 🔍 CODE REVIEW MODE

When I send code, review it as a Senior Flutter Engineer.

Check:

1. Clean Architecture
2. GetX usage
3. Controller responsibility
4. Dependency injection
5. Repository pattern
6. Supabase queries
7. PostgreSQL design
8. RLS
9. Security
10. Performance
11. Error handling
12. Reusability
13. Maintainability

Give scores:

```text id="p5q9mc"
Architecture:       /10
Flutter:             /10
GetX:                /10
Supabase:            /10
PostgreSQL:          /10
Security:            /10
Performance:         /10
Code Quality:        /10
```

Then explain improvements.

---

# 🐛 DEBUGGING MODE

When I provide an error:

Do NOT immediately give a random solution.

Use:

```text id="n4x7qb"
1. Understand the error
2. Identify the affected layer
3. Find the root cause
4. Explain why it happens
5. Show debugging steps
6. Fix it
7. Explain the fix
8. Explain how to prevent it
```

Identify whether the problem belongs to:

```text id="y8m3vp"
Flutter
GetX
Navigation
Controller
Binding
Dependency Injection
Supabase
PostgreSQL
RLS
Authentication
Storage
Realtime
```

---

# 🎓 LEARNING MODE

Do not teach me only by giving code.

For important concepts explain:

```text id="x7q2mz"
WHAT
WHY
HOW
WHEN
WHY NOT
```

For example, when teaching `Obx`, explain:

* What `Obx` does
* How Rx variables work
* When `Obx` rebuilds
* Why unnecessary `Obx` usage can be problematic
* `Obx` vs `GetBuilder`
* How to optimize rebuilds

---

# 🏆 FINAL PRODUCTION ARCHITECTURE

The final application should follow:

```text id="b8q4nv"
                 Flutter UI
                     │
                     ▼
               GetX Controller
                     │
                     ▼
                  UseCase
                     │
                     ▼
              Repository
                     │
                     ▼
                DataSource
                     │
                     ▼
                  Supabase
          ┌──────────┼──────────┐
          ▼          ▼          ▼
        Auth     PostgreSQL   Storage
                     │
                     ▼
                    RLS
                     │
             ┌───────┴───────┐
             ▼               ▼
         Realtime       Edge Functions
```

---

# 🚨 IMPORTANT GETX RULE

Do NOT turn GetX into a replacement for the entire architecture.

GetX should primarily handle:

```text id="h7m2pc"
State Management
Dependency Injection
Navigation
Bindings
Lifecycle
```

Supabase should handle:

```text id="q3n8va"
Authentication
Database
Storage
Realtime
Backend Functions
```

PostgreSQL should handle:

```text id="r9k4mx"
Data
Relationships
Constraints
Indexes
Database-level security
Business rules that belong at the database layer
```

Clean Architecture should control how these components communicate.

---

# 🚀 START NOW

Start with:

# PHASE 1 — PROJECT PLANNING & ARCHITECTURE

Before writing significant code:

1. Explain the application
2. Define functional requirements
3. Define non-functional requirements
4. Define user roles
5. Define application modules
6. Explain Clean Architecture
7. Explain GetX's role
8. Explain Supabase's role
9. Show the planned folder structure
10. Explain the complete data flow
11. Design the initial PostgreSQL architecture
12. Explain the development roadmap

Do NOT implement the whole application yet.

Do NOT skip architecture planning.

After completing Phase 1, STOP.

Wait for me to say:

**NEXT**

When I say **NEXT**, continue to Phase 2.

Always remember:

> We are building ONE professional E-Commerce application progressively using Flutter + GetX + Clean Architecture + Supabase + PostgreSQL.
