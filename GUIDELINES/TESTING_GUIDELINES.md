# Testing Guidelines

This document defines our strategy and standards for software testing. Our goal is to maintain a comprehensive, reliable, and efficient test suite that enables rapid feedback and confident deployments.

## 1. Testing Philosophy

We follow the "Test Pyramid" model as a general guide:

-   **Unit Tests (Foundation)**: The majority of our tests should be unit tests. They are fast, isolated, and verify the smallest pieces of logic in our codebase (e.g., a single function or class).
-   **Integration Tests (Middle Layer)**: These tests verify the interaction between two or more components of the system (e.g., an API endpoint connecting to a database). They are more complex than unit tests but are essential for ensuring system components work together correctly.
-   **End-to-End (E2E) Tests (Peak)**: A small number of E2E tests should verify entire user flows from the user interface down to the database. They are slow and brittle but provide the highest level of confidence.

## 2. Test Location

All test files must be located in a top-level `tests/` directory. The structure of the `tests/` directory should mirror the structure of the source directory (`src/`).

**Example:**
```
.
├── src/
│   └── features/
│       └── user/
│           ├── user_service.ts
│           └── user_controller.ts
└── tests/
    └── features/
        └── user/
            ├── test_user_service.ts
            └── test_user_controller.ts
```

This convention keeps tests cleanly separated from production code.

## 3. Test Execution and Efficiency

-   **Mandatory Testing**: All new features and bug fixes must be accompanied by relevant unit and/or integration tests. A pull request will not be merged without adequate test coverage for the changes.
-   **Efficient Feedback Loop**: The test suite must be optimized for speed. We leverage modern test runners and techniques that support:
    -   **Incremental Testing**: Automatically running only the tests affected by local code changes (e.g., via Jest's `--watch` mode or similar tools).
    -   **Parallel Execution**: Running tests in parallel to reduce the total execution time in CI environments.
-   **CI Integration**: The full test suite is executed by the CI pipeline on every pull request and merge to the main branch. A failing test run will block the merge.
