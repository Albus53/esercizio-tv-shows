# TV Shows Flutter Web App

This project is a small Flutter Web application developed as a take-home exercise for a Junior Flutter Developer position.

The app shows a list of TV shows fetched from a public API and allows the user to open a detail page for each show.

## Features

- Fetches real data from a public API.
- Displays a grid of TV shows.
- Each card shows:
  - Poster
  - Premiere date
  - Rating
  - Title

- Shows a detail page with more information about the selected show.
- Handles the main UI states:
  - Loading
  - Error
  - Data loaded
  - Empty list

- Includes a refresh button to reload data from the API.
- Runs on Flutter Web.

## API Used

The project uses the TVMaze API:

```text
https://api.tvmaze.com/shows
```

I chose TVMaze instead of TMDB because it does not require an API key or authentication token. This made the setup simpler and avoided extra configuration steps for running the project locally.

TVMaze also works well with Flutter Web and avoids possible CORS issues that can happen with some public APIs when called directly from the browser.

## How to Run the Project

### Requirements

Make sure you have Flutter installed with Web support enabled.

You can check your Flutter installation with:

```bash
flutter doctor
```

### Install dependencies

From the project root, run:

```bash
flutter pub get
```

### Run the app

The project is intended to run on Chrome:

```bash
flutter run -d chrome
```

No API key is required.

## Main Technical Choices

### State Management: Provider

I used `provider` for state management.

The project is small, so a very complex architecture was not necessary. However, I still wanted to avoid putting API logic and loading/error state directly inside the UI.

Provider was a good choice because it is simple, readable and enough for this kind of application.

The `ShowsProvider` manages:

- the list of shows;
- the loading state;
- the error message;
- the method used to fetch or refresh the data.

This keeps the screen focused on displaying the UI, while the provider manages the state.

### HTTP Calls: http Package

I used the `http` package to make API calls.

The app only needs a simple GET request, so `http` is enough for this project. A more advanced package like `dio` would be useful in a bigger app with interceptors, authentication, request cancellation or more complex error handling, but for this exercise it would have added unnecessary complexity.

The API call is handled inside `ShowApiService`, not directly inside the screen.

### Project Structure

The project is organized with a simple folder structure:

```text
lib/
  models/
    show_model.dart

  providers/
    show_provider.dart

  screens/
    show_list_screen.dart
    show_detail_screen.dart

  services/
    show_api_service.dart

  widgets/
    show_card_widget.dart
    show_grid_widget.dart

  main.dart
```

The purpose of this structure is to separate responsibilities:

- `models/` contains the data models and JSON parsing logic.
- `services/` contains the API call logic.
- `providers/` contains the state management logic.
- `screens/` contains the main pages of the app.
- `widgets/` contains reusable UI components.

This makes the code easier to read and maintain.

### Model Layer

The `ShowModel` represents the data used by the UI.

I did not map every field returned by the API. I only included the fields that are useful for the list and detail screens, such as:

- id
- name
- language
- genres
- status
- average runtime
- premiered date
- ended date
- rating
- network
- image
- summary

The model also includes a `cleanSummary` getter to remove HTML tags from the summary returned by the API.

This keeps the UI cleaner because the screen can simply use:

```dart
show.cleanSummary
```

instead of handling HTML cleanup directly inside the widget.

### UI Structure

The UI is intentionally simple and minimal.

The goal of the exercise was not to create a complex visual design, but to show clean code, API usage, state management and navigation.

The list screen uses a grid layout with three cards per row. Each card is represented by a reusable `ShowCard` widget.

The detail screen receives the selected `ShowModel` directly from the list screen. I chose this approach because the list API already provides enough information to build the detail page, so making a second API call was not necessary for this project.

This keeps the app simpler and avoids an extra loading state on the detail page.

### Refresh Feature

As the extra feature required by the exercise, I implemented a refresh button on the list screen.

The refresh button calls the same provider method used for the initial data loading:

```dart
context.read<ShowsProvider>().getShows();
```

This avoids duplicating logic and keeps the refresh behavior consistent with the first loading of the data.

## What I Would Improve With More Time

### Search Bar

With more time, I would add a search bar to filter shows by title.

I would probably manage the search query inside the provider, because the filtering logic is related to the list state and should not be fully managed inside the UI.

Then I would expose a method to update it.

Finally, I would expose a filtered list

The UI would then show `filteredShows` instead of the full list.

This approach would keep the search logic outside the screen and would make the UI easier to read.

### Better Error Handling

At the moment, the app shows a generic error message if the API call fails.

With more time, I would improve error handling by distinguishing between different cases, such as:

- no internet connection;
- server error;
- invalid response format;
- empty response.

This would make the app more user-friendly.

### Better Responsiveness

The grid currently shows three cards per row, which works well for the intended web layout.

With more time, I would make the grid more responsive by changing the number of columns depending on the screen size. For example:

- 1 column on small screens;
- 2 columns on medium screens;
- 3 or more columns on larger screens.

### Image Fallbacks

The current model expects some image fields to be present.

With more time, I would make the image handling more defensive by adding placeholders when an image is missing or fails to load.

This would make the app more robust with incomplete API data.

## Difficulties Encountered

At the beginning of the project, I had some difficulties setting up the repository due to issues with my GitHub account. This caused a small delay before I could properly initialize the project and start working on the code.

One small difficulty was deciding how much architecture to use for a simple project.

Since this is a small take-home exercise, I avoided adding unnecessary complexity. For example, I did not use a routing package or a more advanced state management solution.

At the same time, I still separated the code into models, services, providers, screens and widgets, because this makes the project easier to understand and shows a clear separation between UI, state and data access.

Another point was choosing the API. The original suggestion was TMDB, but it requires an API token. I chose TVMaze because it is public, easy to use and does not require manual setup.

## Additional Reflections

### What I Deepened During the Project

During the project, I deepened my understanding of `GridView` and how it can be used to display data in a structured layout.

I also worked more on the differences between building a web screen and a mobile screen. In particular, I understood that Flutter Web requires more attention to responsiveness, spacing, alignment and how the layout behaves when the browser window changes size.

Another important part was managing state with `provider`. I used it to keep the UI separated from the logic that handles the list of shows, the loading state and the error state.

### How I Approached the Problem

I approached the task step by step.

First, I chose which API to use for the project. After that, I defined the data model based on the API response and on the information that was useful for the list and detail screens.

Then I created a service class to keep the HTTP request outside the widgets.

After that, I used a provider to manage the application state, including the list of shows, the loading state and the error message.

Finally, I built the UI with a list screen, reusable card and grid widgets, and a detail screen that receives the selected show.

I tried to keep the project simple, but still organized enough to make the code readable and maintainable.

### Why I Chose This Approach

I chose this approach because the project is small, but it still needs a clear separation of responsibilities.

I chose the TVMaze API because it does not require an API token. This made the setup simpler and avoided adding token management to the project, which could have made the exercise more complex, especially for configuration and security reasons.

I used `provider` instead of a more complex state management solution because the app only needs to manage a list of shows, a loading state and an error state. A solution like Bloc or Cubit could also work, but for this exercise it would have added more structure than necessary.

I used the `http` package instead of `dio` because the app only needs a simple GET request. `dio` would be useful in a larger application with interceptors, authentication, request cancellation or more advanced error handling.

I passed the selected `ShowModel` directly to the detail screen instead of making a second API call because the list API already provides enough information for the detail page. In a larger app, if the detail screen required more complete or always updated data, I would consider using a dedicated detail endpoint.

I also avoided adding a routing package because the navigation flow is simple and only goes from the list screen to the detail screen.

## Final Notes

The project focuses on clarity, simplicity and separation of responsibilities.

The main goal was to build a working Flutter Web app that fetches real data, manages loading and error states, displays a list, navigates to a detail page and includes a small extra feature through the refresh button.
