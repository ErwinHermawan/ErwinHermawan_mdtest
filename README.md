# ErwinHermawan_mdtest

## Table of Contents
- [Description](#description)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Description
ErwinHermawan_mdtest is a Flutter application with user authentication, email verification, and password reset functionalities. It also provides a home page that displays user information retrieved from Firestore, with filtering and searching capabilities.

## Features
### Authentication
- **Login Screen**: Users can sign in using email and password.
- **Registration Screen**: New users can sign up with email and password.
- **Forgot Password Screen**: Users can request a password reset email.

### Home Page
- Display user's name and email verification status based on the user's email verification status.
- Display a list of users retrieved from Firestore.
- Each user item in the list shows the user's name, email, and email verification status.
- Implement a filter option to filter users by email verification status.

### Email Verification
- Users receive a verification email upon registration.

### Password Reset
- Users can reset their password via email.
- Implement a UI screen for users to enter their email address for password reset.

### Unit Test
- Write unit tests to cover critical components such as creating account, password reset.

## Installation
To get a local copy up and running, follow these simple steps.

### Prerequisites
Make sure you have Flutter installed on your machine. You can install Flutter from [flutter.dev](https://flutter.dev/docs/get-started/install).

### Installation Steps

1. **Clone the repo**
    ```sh
    git clone https://github.com/ErwinHermawan/ErwinHermawan_mdtest.git
    ```

2. **Navigate to the project directory**
    ```sh
    cd ErwinHermawan_mdtest
    ```

3. **Install dependencies**
    ```sh
    flutter pub get
    ```

4. **Run the application**
    ```sh
    flutter run
    ```

## Usage
1. **Open the application**
2. **Register a new account or login with an existing account**
3. **Verify email if not already verified**
4. **Navigate to the home page to view users**
5. **Use the filter and search options to find specific users**
6. **Use the forgot password option if necessary to reset your password**


## Contributing
Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License
BSD 3-Clause License

Copyright (c) 2024, ErwinHermawan

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

## Contact
Erwin Hermawan - [erwinhermawan475@gmail.com](mailto:erwinhermawan475@gmail.com)

Project Link: [https://github.com/ErwinHermawan/ErwinHermawan_mdtest](https://github.com/ErwinHermawan/ErwinHermawan_mdtest)
