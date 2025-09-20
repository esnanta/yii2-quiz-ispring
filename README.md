# Yii2 Quiz iSPRING
![Version](https://img.shields.io/github/v/tag/esnanta/yii2-quiz-ispring?label=version&color=blue)
![License](https://img.shields.io/badge/license-MIT-green)
![PHP](https://img.shields.io/badge/PHP-8.x-blue)

---
This program uses [QuizResults](https://github.com/ispringsolutions/QuizResults) by ISpringSolution.

This project provides an intuitive platform for students and instructors to keep track of schedules, assessments, and exam results. It is designed for both students and instructors, ensuring ease of use and accessibility. With this approach, you may extend your own tracking system on your server.

[Yii2 Quiz iSpring](https://daraspace.com/article/4?title=Yii2+Quiz+iSpring+%3A+Enhancing+LMS%2C+Bridging+Data-Driven+Insights+with+iSpring+QuizMaker) enhances LMS capabilities, specifically focusing on integrating **iSpring QuizMaker**, a robust tool designed to create interactive quizzes and assessments. iSpring QuizMaker is widely used for creating various types of quizzes (e.g., multiple-choice, drag-and-drop, true/false). By incorporating Yii2 Quiz iSpring, the platform provides advanced visual analytics that can help instructors and students visualize learning trends and target areas for improvement.

---

## 📧 Contact

- **Nanta Es** (programmer) – [ombakrinai@gmail.com](mailto:ombakrinai@gmail.com)
- **[Saroel](https://github.com/saroel01)** (contributor, QC) – [syahrul.hamdi@smanmba.sch.id](mailto:syahrul.hamdi@smanmba.sch.id)

---

## 📸 Screenshots

See the [Screenshots Folder](https://github.com/esnanta/yii2-quiz-ispring/tree/master/screenshots)

![Progress Chart](https://github.com/esnanta/yii2-quiz-ispring/raw/master/screenshots/05_grafik_progress.png)

---

## ✅ Requirements

- A copy of **iSpring QuizMaker** or another iSpring authoring tool (e.g., [iSpring Suite](https://www.ispringsolutions.com/))
- [XAMPP](https://www.apachefriends.org/) 8.x.x
- [Composer v2.x.x](https://getcomposer.org/)
- *(Optional)* Server-side application programming skills (PHP, SQL, Javascript)

---

## ⚙️ Installation

Follow these steps to set up the project on your local environment:

1. **Clone or Create Project**
    ```bash
    composer create-project esnanta/yii2-quiz-ispring
    ```

2. **Initialize Environment**
    ```bash
    php init
    ```
   Select either `development` or `production`.

3. **Install Dependencies**
    Choose based on your environment.
    - For development:
      ```bash
      composer update
      ```
    - For production:
      ```bash
      composer update --no-dev
      ```

4. **Database Configuration**
    - Configure your database connection according to your database credentials
      ```
      common/config/main.php
      ```
      or environment-specific:
      ```
      common/config/main-local.php
      ```
      
5. **Create Database**
    - Create a MySQL database
      ```bash
         php yii db/create
      ```
    - Run Migrations. This will create all required tables and apply initial schema.
        ```bash
           php yii migrate
        ```

6. **Run the Application**
    - For the backend:
      Open in browser:
      ```
      http://localhost/yii2-quiz-ispring/admin/
      ```
    - For the frontend:
      Open in browser:
      ```
      http://localhost/yii2-quiz-ispring
      ```
7. **Admin**
    - User : admin
    - Pass : admin123
   
8. For full installation steps, see this [Step-by-Step Guide](https://daraspace.com/article/5?title=Step-by-Step+Guide%3A+Installing+Yii2+Quiz+iSpring)

---

## 📁 Directory Structure

```
assets
    sql/                 sql for database
backend
    assets/              contains application assets such as JavaScript and CSS
    config/              contains backend configurations
    controllers/         contains Web controller classes
    models/              contains backend-specific model classes
    runtime/             contains files generated during runtime
    views/               contains view files for the Web application
    web/                 contains the entry script and Web resources
common
    config/              contains shared configurations
    config/main.php      app and database configuration
    mail/                contains view files for e-mails
    models/              contains model classes used in both backend and frontend
    widgets/             contains app widgets   
frontend
    assets/              contains application assets such as JavaScript and CSS
    config/              contains frontend configurations
    controllers/         contains Web controller classes
    models/              contains frontend-specific model classes
    runtime/             contains files generated during runtime
    views/               contains view files for the Web application
    web/                 contains the entry script and Web resources
environments/            contains environment-based overrides
vendor/                  contains dependent 3rd-party packages
```

---

## 🧪 How To Use

- [Quiz iSpring Admin (Indonesia)](https://github.com/esnanta/yii2-quiz-ispring/blob/master/tutorial/ID-Tutorial%20Quiz%20Ispring%20Admin%20.pdf)
- [Quiz iSpring Peserta Ujian (Indonesia)](https://github.com/esnanta/yii2-quiz-ispring/blob/master/tutorial/ID-Tutorial%20Quiz%20Ispring%20Peserta%20Ujian.pdf)

---

## 🛠️ ISPRING Configuration

You must add custom variables that will be used to collect data schedule.

| Field Name | Condition | Field Type | Variable   | Remark        |
|------------|-----------|------------|------------|----------------|
| Name       | Don't Ask | Text       | USER_NAME  |                |
| Email      | Don't Ask | Text       | Email      |                |
| Schedule   | Don't Ask | Text       | SCD        | Add manually   |

- **Finish Action URL (Quiz message)**:
  ```
  http://{YOUR_HOST}/{YOUR_APP_NAME}/assessment/index
  ```
  Example: `http://localhost/yii2-quiz-ispring/assessment/index`

- **Send quiz results to server**:
  ```
  http://{YOUR_HOST}/{YOUR_APP_NAME}/assessment/submit
  ```
  Example: `http://localhost/yii2-quiz-ispring/assessment/submit`
---

## 🤝 Contribution Guidelines

Contributions are welcome!

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Submit a pull request with detailed information about your changes.

---

## ☕ Support

If you find value in this application, feel free to:

- ⭐ Star this repository
- Share it with friends, colleagues, or your community
- [Buy me a coffee](https://www.paypal.me/esnanta)

---
