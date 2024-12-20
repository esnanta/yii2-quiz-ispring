<h1>
    <strong>Yii2 Quiz iSPRING</strong>
</h1>
<p>
    This program use
    <a href="https://github.com/ispringsolutions/QuizResults">QuizResults</a>
    by ISpringSolution.
</p>
<p>
    This project provides an intuitive platform for students and instructors
    to keep track of schedules, assessments, and exam results. It designed
    for both students and instructors, ensuring ease of use and accessibility. 
    With this approach, you may extend your own tracking system on your server.
</p>
<p>
    <a href="https://daraspace.com/article/4?title=Yii2+Quiz+iSpring+%3A+Enhancing+LMS%2C+Bridging+Data-Driven+Insights+with+iSpring+QuizMaker">Yii2 Quiz iSpring</a> 
    enhance LMS capabilities, specifically focusing on integrating iSpring QuizMaker, 
    a robust tool designed to create interactive quizzes and assessments. iSpring QuizMaker 
    is widely used for creating various types of quizzes (e.g., multiple-choice, drag-and-drop, 
    true/false). By incorporating <a href="https://daraspace.com/article/4?title=Yii2+Quiz+iSpring+%3A+Enhancing+LMS%2C+Bridging+Data-Driven+Insights+with+iSpring+QuizMaker">Yii2 Quiz iSpring</a> 
    with iSpring QuizMaker, the platform provides advanced visual analytics that can help 
    instructors and students visualize learning trends and target areas for improvement.
</p>

<p>
    Any questions please email:
</p>

* Nanta Es (programmer) - ombakrinai@gmail.com
* [Saroel](https://github.com/saroel01) (contributor, qc) - syahrul.hamdi@smanmba.sch.id

<h3><strong>Screenshots</strong></h3>

See <a href="https://github.com/esnanta/yii2-quiz-ispring/tree/master/screenshots">IMAGES</a>

![Alt text](https://github.com/esnanta/yii2-quiz-ispring/raw/master/screenshots/05_grafik_progress.png)

<h3>
    <strong>Prerequisites</strong>
</h3>
<ul>
    <li>
        A copy of iSpring QuizMaker or another iSpring authoring tool that includes
        QuizMaker (<a href="https://www.ispringsolutions.com/">iSpring Suite</a>).
    </li>
    <li>
        <a href="https://www.apachefriends.org/">XAMPP</a>
        8.0.x
    </li>
    <li>
        <strong><a href="https://getcomposer.org/">Composer</a>&nbsp;v2.x.x</strong>
    </li>
    <li>
        (Optional) Server-side application programming skills (PHP, SQL, XML).
    </li>
</ul>
<h3>
    <strong>Installation</strong>
</h3>
<ul>
    <li>
        Run "composer update --no-dev". It aims to download the required vendor library.
        <br>If you experience problems, you can
        <a href="https://drive.google.com/drive/folders/1CnwzIY4ZuYD9JylFdHgcFHPcqFJicnVi?usp=sharing">download the vendor library</a>
        and then extract it according to the directory structure.
    </li>
    <li>
        Run "php init" and choose "production".
    </li>
    <li>
        Run "yii2_quiz_ispring.sql" and "yii2_auth.sql"
    </li>
    <li>
        A more complete guide see <a href="https://daraspace.com/article/5?title=Step-by-Step+Guide%3A+Installing+Yii2+Quiz+iSpring">Step-by-Step Guide: Installing Yii2 Quiz iSpring</a>
    </li>
</ul>

<h3>
    <strong>DIRECTORY STRUCTURE</strong>
</h3>

```
assets
    yii2_quiz_ispring.sql
    yii2_auth.sql
backend
common
    config/
        main.php
console
environments           
frontend
screenshots
tutorial
vagrant
vendor
    autoload.php                 
```

<h3>
    <strong>How To Use</strong>
</h3>
<ul>
    <li>
        <a href="https://github.com/esnanta/yii2-quiz-ispring/blob/master/tutorial/ID-Tutorial%20Quiz%20Ispring%20Admin%20.pdf">Quiz iSpring Admin (Indonesia)</a>
    </li>
    <li>
        <a href="https://github.com/esnanta/yii2-quiz-ispring/blob/master/tutorial/ID-Tutorial%20Quiz%20Ispring%20Peserta%20Ujian.pdf">Quiz iSpring Peserta Ujian (Indonesia)</a>
    </li>
</ul>


<h3>
    <strong>ISPRING Configuration</strong>
</h3>
<p>
    You must add custom variable that will be used to collect data schedule.
</p>

<div>
    <table style="width:500px;">
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
                <td>Add manually</td>
            </tr>
        </tbody>
    </table>
</div>
<br>
        Set "Finish Action Url" to : http://{YOUR_HOST}/{YOUR_APP_NAME}/assessment/index
        <br>Ex : http://localhost/yii2-quiz-ispring/assessment/index
<br>
<br>
        Set "Send quiz results to server" : http://{YOUR_HOST}/{YOUR_APP_NAME}/assessment/submit
        <br>Ex : http://localhost/yii2-quiz-ispring/assessment/submit
<hr>

## Contribution Guidelines

Contributions are welcome! Please:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Submit a pull request with detailed information about your changes.
   
<h3>Support</h3>
<p>If you find value in this application and believe in its benefit, every little bit helps. <br>
Give a ⭐️ or You can even spread the word and tell your friends, colleagues, or community.</p>

<p>Buy me a cup of coffee</p>

<ul>
	<li><a href="https://www.paypal.me/esnanta">https://www.paypal.me/esnanta</a></li>
</ul>
