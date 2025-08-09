# Git Workflow and Code Review

This document outlines our standards for using Git, managing branches, writing commit messages, and conducting code reviews. A disciplined workflow is key to maintaining a clean history and enabling effective collaboration.

## 1. Branching Strategy

We use a simple **GitHub Flow** model:
1.  The `main` branch is the definitive source of truth and must always be in a deployable state.
2.  To start work on a new feature or bugfix, create a new branch from the latest `main`.
    -   **Branch Naming**: Use a descriptive prefix and name, separated by slashes.
    -   Examples: `feat/user-auth`, `fix/api-caching-bug`, `refactor/database-schema`.
3.  Commit your changes to this feature branch.
4.  When ready, open a Pull Request (PR) to merge your branch into `main`.
5.  The PR must pass all automated checks and receive at least one approval before it can be merged (typically using squash & merge)

## 2. Commit Messages

We adhere to the [**Conventional Commits**](https://www.conventionalcommits.org/) specification. This creates a clear and machine-readable commit history, which helps in automating changelogs and versioning.

-   **Format**: `<type>(<optional scope>): <description>`
-   **Common Types**: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`.
-   **Example**: `feat(api): add endpoint for user profile retrieval`

## 3. Pull Requests (PRs)

-   **Title**: The PR title should be clear and concise, summarizing the change (e.g., "Feat: Add User Authentication Service").
-   **Description**: The description's primary purpose is to explain the **WHY**, not the "what." The code itself and comments/documentation show what was changed. The description should provide:
    -   **Context**: What is the problem or feature request? Link to an issue if one exists.
    -   **Rationale**: Why was this particular solution chosen? What alternatives were considered?
    -   **Impact**: Are there any potential side effects or breaking changes?
-   **Adapt**: If the purpose of the PR evolves, adapt title and description

## 4. Code Reviews

Code reviews are a critical practice for quality, not a formality.

-   **Reviewer's Focus**:
    -   **High-Level Concerns**: Prioritize feedback on security vulnerabilities, performance bottlenecks, architecture and design (SOLID principles), and potential logic errors.
    -   **Clarity and Maintainability**: Is the code easy to understand? Will it be easy to maintain?
    -   **Avoid Nitpicking**: Do not comment on code style that is already enforced by the automated linter/formatter.
-   **Reviewer's Tone**:
    -   **Be Constructive and Concise**: Frame feedback as suggestions or questions.
    -   **Praise Good Work**: If you see a particularly elegant solution or a great piece of code, highlight it. Positive feedback is as important as critical feedback.
-   **Author's Responsibility**:
    -   Respond to comments gracefully and engage in a constructive discussion.
