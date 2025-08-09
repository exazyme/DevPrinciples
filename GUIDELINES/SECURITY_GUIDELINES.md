# Security Guidelines: Handling Secrets

This document outlines the mandatory procedures for managing all sensitive information, including API keys, database credentials, passwords, private certificates, and personal user data (PII).

## 1. The Golden Rule: Never Commit Secrets

Under no circumstances should secrets ever be committed to a Git repository, whether it is public or private. Once a secret is in the Git history, it should be considered permanently compromised.

## 2. The Secure Method: Environment Variables

The standard, platform-agnostic method for handling secrets is through **environment variables**.

-   **Local Development**: Use a `.env` file to store secrets for your local environment. This file **must** be listed in the project's `.gitignore` file to prevent it from ever being committed.
-   **Production & Staging**: In deployed environments (CI/CD, Staging, Production), secrets must be injected securely using the hosting platform's capabilities. Examples include:
    -   GitHub Actions Secrets
    -   AWS Secrets Manager
    -   Google Cloud Secret Manager
    -   HashiCorp Vault
    -   Kubernetes Secrets

## 3. How to Implement Securely

1.  **Add `.env` to `.gitignore`**: Ensure the following line is present in your root `.gitignore` file. This is the most critical step.
    ```gitignore
    # Ignore environment variables files
    .env
    ```

2.  **Create a Template File**: Create a file named `.env.example` that includes all the environment variables required by the project, but with placeholder or empty values. This file **is** checked into the repository.
    ```
    # .env.example - DO NOT PUT SECRETS HERE
    API_KEY=
    DATABASE_URL=
    ```
    This serves as documentation for developers, showing them which variables they need to provide in their own local `.env` file.

3.  **Load Variables in Your Application**: Use a library appropriate for your language/framework (e.g., `dotenv` for Node.js, `python-dotenv` for Python) to load the variables from the `.env` file during local development.

## 4. Automated Prevention in CI/CD

To enforce this policy automatically, integrate secret scanning into the  CI pipeline.

-   **Secret Scanning**: The CI pipeline must include a step that scans for secrets in the codebase on every pull request. If a potential secret is detected, the build must fail, blocking the merge.
-   **Recommended Tools**:
    -   **gitleaks**: A fast and effective open-source scanner.
    -   **trufflehog**: Searches for secrets by digging deep into repository history.
    -   **GitHub Secret Scanning**: Can be enabled directly on the repository settings for private repos.

By combining a strict `.gitignore` policy with automated CI checks, we create multiple layers of defense against accidental secret exposure.
