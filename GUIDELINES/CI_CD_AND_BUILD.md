# CI/CD and Build System

This document describes our principles for Continuous Integration (CI), Continuous Deployment (CD), and the automated build system. Our goal is to create a fast, reliable, and fully automated path from code commit to production deployment.

## 1. Core Principle: Automation First

Every repetitive process in our development lifecycle must be automated. This includes formatting, linting, testing, building, and deploying. Manual steps are a source of error and inefficiency and should be eliminated wherever possible.

The CI/CD pipeline is the ultimate authority on code quality and deployability.

## 2. Continuous Integration (CI)

The CI pipeline is triggered at least on every pull request and every merge into the `main` branch. A pull request cannot be merged unless all CI checks pass.

A standard CI pipeline includes the following stages:

1.  **Lint and Format Check / fix**: The pipeline first verifies that all code conforms to the project's style and quality standards. This is the fastest check and runs first to provide immediate feedback. All or at least all simple errors here are fixed automatically and without user intervention. Only more complex problems or when automated tools for the particular tech stack are missing should lead to user intervention.
2.  **Security leak checks**: We check for security leaks and prevent a commit if they are found.
See the CI section in SECURITY_GUIDELINES.md.
3.  **Unit & Integration Tests**: The test suite is executed to ensure the changes have not introduced any regressions and that new functionality is correct. This stage must be optimized for speed, using fast tools, parallelization and caching where possible. When possible, we use dependency inference to speed up tests, i.e. tools that analyze which tests are affected by changes to the source and run only those tests. Speed-increases can never compromise correctness.
4.  **Build**: The pipeline compiles or packages the application into a production-ready artifact. It is optimized for speed using fast tools with dependency inference, parallelization and caching. If the build fails, the code is not considered deployable. Speed-increases can never compromise correctness.

## 3. Continuous Deployment (CD)

-   **Automated Deployments**: Merging a pull request to the `main` branch signifies that the code is ready for production. The CD pipeline should automatically deploy the new version from `main` to the appropriate environment (e.g., staging or production).
-   **Scripted Deployments**: All deployment logic must be captured in scripts, typically located in a top-level `deploy/` directory. This ensures that deployments are repeatable and consistent, whether run by a developer or the CI/CD system.

## 4. Build System and Dependencies

-   **Incremental Builds**: To ensure fast build times, the build system should support incremental builds, rebuilding only the parts of the application affected by a code change.
-   **Dependency Management**:
    -   All project dependencies must be explicitly declared in a manifest file (e.g., `package.json`, `pyproject.toml`, `pom.xml`).
    -   A lockfile (e.g., `package-lock.json`, `poetry.lock`) **must** be committed to the repository. This guarantees that the exact same dependency versions are used in all environments (local development, CI, production), preventing "it works on my machine" issues.
    -   Regularly audit dependencies for known security vulnerabilities using automated tools.
