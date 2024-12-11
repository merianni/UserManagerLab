# Report

Changes made during refactoring:
- Refactored `Database` and `UserManager`. Separated responsibilites, user manager now will manage everything user related, and database's functionality is strictly saving and getting users.
- `UserManager` now depends on `Database` for saving users to the simulated "database" I created.
- Created both `authenticate` and `authenticateUser`. `authenticateUser` verifies that the id matches and we return true if the email and password matches, this helps to verify if the id matches the email and password, for testing non-existing users. `authenticate` was first created as a simple way of verifying that both the email and password of the user were correct.

Adhere to SOLID principles:
- `register` 's only responsibility is registering, separation of responsibilities in the functions, while `authenticateUser`'s only responsiblity is verifying that the id matches to the email and password of said user.
- `Database` can be extended if needed, based on its current simple functionality later on we can add more queries or features.

The refactoring significantly improved the maintainability and readability of the `UserManager` and `Database` classes. Adhering to SOLID principles makes the refactored code now more modular and testable. We can accomodate future requirements with minimal effort.
