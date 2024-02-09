Yii2 Quiz ISPRING

iSpring QuizMaker provides a variety of ways to deliver results.
If a Learning Management System that automatically tracks quiz progress
is not an option in your case, you can also send results via email or send
quiz results to server, which will be the main topic of this article.

With this approach, you may extend your own tracking system on your server.
This solution will require additional development and may incur extra costs,
depending on the requirements for creating your custom system.

A copy of iSpring QuizMaker or another iSpring authoring tool that includes QuizMaker (iSpring Suite).
A server with full access to the file directory and to configuration settings.
Server-side application programming skills (PHP or C#, SQL, XML).

User Variable

You must add custom variable that will be used for to collect data schedule.

Field Name	        Condition	    Field Type	    Variable	
Name	            Dont Ask	    Text            USER_NAME
Email	            Dont Ask	    Email           USER_EMAIL
Schedule	        Dont Ask	    Text            SCD	            (You must add this!)




The program includes three tiers: front end, back end, and console, each of which
is a separate Yii application.

DIRECTORY STRUCTURE
-------------------

```
common
    config/              contains shared configurations
    mail/                contains view files for e-mails
    models/              contains model classes used in both backend and frontend
    tests/               contains tests for common classes    
console
    config/              contains console configurations
    controllers/         contains console controllers (commands)
    migrations/          contains database migrations
    models/              contains console-specific model classes
    runtime/             contains files generated during runtime
backend
    assets/              contains application assets such as JavaScript and CSS
    config/              contains backend configurations
    controllers/         contains Web controller classes
    models/              contains backend-specific model classes
    runtime/             contains files generated during runtime
    tests/               contains tests for backend application    
    views/               contains view files for the Web application
    web/                 contains the entry script and Web resources
frontend
    assets/              contains application assets such as JavaScript and CSS
    config/              contains frontend configurations
    controllers/         contains Web controller classes
    models/              contains frontend-specific model classes
    runtime/             contains files generated during runtime
    tests/               contains tests for frontend application
    views/               contains view files for the Web application
    web/                 contains the entry script and Web resources
    widgets/             contains frontend widgets
vendor/                  contains dependent 3rd-party packages
environments/            contains environment-based overrides
```
