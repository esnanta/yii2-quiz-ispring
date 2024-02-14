<div>
<pre>
<strong>Yii2 Quiz ISPRING</strong>

This program use <a href="https://github.com/ispringsolutions/QuizResults">QuizResults</a> by ISpringSolution.

This project provides an intuitive platform for students and instructors to keep track of schedules,
assessments, and exam results. It designed for both students and instructors, ensuring ease of use and 
accessibility.

With this approach, you may extend your own tracking system on your server.
This solution may require additional development or may incur extra costs,
depending on the requirements for creating your custom system.

<strong>Prerequisites</strong>

A copy of iSpring QuizMaker or another iSpring authoring tool that includes QuizMaker (iSpring Suite).
A server with full access to the file directory and to configuration settings.
Server-side application programming skills (PHP or C#, SQL, XML).

<strong>Configuration</strong>

You must add custom variable that will be used for to collect data schedule.

</pre>

<table border="1" cellpadding="1" cellspacing="1" style="width:500px;">
	<tbody>
		<tr>
			<td>Field Name</td>
			<td>Condition</td>
			<td>Field Type</td>
			<td>Variable</td>
			<td>Remark</td>
		</tr>
		<tr>
			<td>Name</td>
			<td>Dont Ask</td>
			<td>Text</td>
			<td>USER_NAME</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>Email</td>
			<td>Dont Ask</td>
			<td>Text</td>
			<td>Email</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>Schedule</td>
			<td>Dont Ask</td>
			<td>Text</td>
			<td>SCD</td>
			<td>Add this manually</td>
		</tr>
	</tbody>
</table>
</div>

<div>&nbsp;</div>

<div>The program includes three tiers: front end, back end, and console, each of which is a separate Yii application.</div>

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

<strong>DONATION</strong>

<p>If you find value in this application and believe in its benefit, every little bit helps. 
You can even spread the word and tell your friends, colleagues, or community.</p>

<p>Buy me a cup of coffee</p>

<ul>
	<li><a href="https://www.paypal.me/esnanta">https://www.paypal.me/esnanta</a></li>
</ul>
