# Design Principles

This document outlines the architectural and design principles that guide our software development. Adherence to these principles is crucial for creating a system that is robust, maintainable, and scalable.

## 1. SOLID Principles

SOLID is the foundation of our architectural design. All new and refactored code must conform to these five principles:

-   **Single Responsibility Principle (SRP)**: A class or module should have one, and only one, reason to change. This means it should have only one job or responsibility.
-   **Open/Closed Principle (OCP)**: Software entities (classes, modules, functions) should be open for extension but closed for modification. New functionality should be added by extending existing code, not by changing it.
-   **Liskov Substitution Principle (LSP)**: Subtypes must be substitutable for their base types without altering the correctness of the program.
-   **Interface Segregation Principle (ISP)**: No client should be forced to depend on methods it does not use. Prefer many small, client-specific interfaces over one large, general-purpose interface.
-   **Dependency Inversion Principle (DIP)**: High-level modules should not depend on low-level modules. Both should depend on abstractions (e.g., interfaces). Abstractions should not depend on details; details should depend on abstractions.

## 2. Other Core Principles

Beyond SOLID, we adhere to the following widely-recognized principles:

-   **DRY (Don't Repeat Yourself)**: Avoid duplicating code. Every piece of knowledge must have a single, unambiguous, authoritative representation within a system. Use functions, classes, and modules to abstract and reuse common logic.
-   **KISS (Keep It Simple, Stupid)**: Favor simplicity over complexity. Simple, clear solutions are easier to understand, maintain, and debug. Avoid premature optimization and unnecessary features.
-   **YAGNI (You Ain't Gonna Need It)**: Do not add functionality until it is deemed necessary. Avoid writing code for speculative future use cases.

## 3. Code and Documentation

-   **Self-Documenting Code**: Strive to write code that is so clear and readable that it requires minimal explanatory comments. Use meaningful variable and function names.
-   **Comment the "Why", Not the "What"**: When comments are necessary, they should explain the *purpose* or *intent* behind a piece of code—the "why." The code itself already shows the "what."

## 4. Misc
- Do not introduce classes for a classes sake; sometimes a function is just enough
- Different and convenient ways to instantiate a class are often well encapsulated in a factory method
