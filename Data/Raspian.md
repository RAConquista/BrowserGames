<div class="col-md-7 col-md-offset-1 col-sm-7 col-sm-offset-1 row_first">
					<div><h1>WEBSERVER EINRICHTEN<br>
<small>Stand Februar 2015</small></h1>
<p>Damit der Apache (Webserver) installiert werden kann, werden Nutzergruppen benötigt – ansonsten schlägt die Installation fehl. Mit den folgenden Befehlen werden die Standardnutzergruppen für den Apachen anlegt:</p>
<pre>sudo groupadd www-data
sudo usermod -a -G www-data www-data</pre>
<h2>Apache installieren</h2>
<p>Jetzt kann der Apache installiert werden:</p>
<pre>sudo apt-get install apache2 apache2-doc apache2-utils</pre>
<p>Jetzt den Browser auf dem Windows PC starten und die folgenden URL eingeben</p>
<pre>http://&lt;IP-Adresse&gt;/</pre>
<p>It Works!!</p>
<h2>PHP und MySQL installieren</h2>
<p>Aber viel kann man damit noch nicht anstellen. Jetzt wird PHP und MySQL nach gerüstet, damit dann auch dynamische Inhalte auf dem Webserver laufen:</p>
<pre>sudo apt-get install libapache2-mod-php5 php5 php-pear php5-xcache
sudo apt-get install php5-mysql
sudo apt-get install mysql-server mysql-client</pre>
<p>Bei der MySQL Installation wird nach einem Passwort für den MySQL-Root-User gefragt. Unbedingt ein Passwort vergeben (zum Beispiel "raspberry", da man sich später mit diesen User am phpMyAdmin anmeldet, um neue Datenbanken oder Datenbank-User einzurichten.</p>
<p>Jetzt in das Webserver-Verzeichnis wechseln und eine neue Datei anlegen</p>
<pre>cd /var/www
sudo nano phpinfo.php</pre>
<p>mit dem folgenden Inhalt</p>
<pre>&lt;?php
phpinfo();
?&gt;</pre>
<p>anlegen. Mit Strg-O speichern und mit Strg-X den Editor verlassen. Jetzt mit dem Browser die folgende URL aufrufen:</p>
<pre>http://&lt;IP-Adresse&gt;/phpinfo.php</pre>
<h2>PhpMyAdmin installieren</h2>
<p>Jetzt wird phpMyAdmin nach gerüstet, damit dann auch die Datenbank administriert werden kann:</p>
<pre>sudo apt-get install phpmyadmin</pre>
<p>Wärend der Installation auswählen, dass</p>
<ul>
    <li>der Webserver apache2 automatisch konfiguriert werden soll,</li>
    <li>die Datenbank für phpMyAdmin mit dbconfig-common konfiguriert werden soll,</li>
    <li>das Passwort für den Datenbank User "root" eingeben und</li>
    <li>unbedingt ein Passwort für den User "phpmyadmin" (zum Beispiel "raspberry") vergeben.</li>
</ul>
<p>Jetzt nur noch eine Konfiguration anpassen:</p>
<pre>sudo nano /etc/apache2/mods-enabled/dir.conf</pre>
<p>Die Zeile mit dem Eintrag <span style="font-family: Courier New;">DirectoryIndex</span> um <span style="font-family: Courier New;">index.php</span> erweitern und die Datei speichern und den Editor beenden. <br>
Danach den Apache neu starten</p>
<pre>sudo /etc/init.d/apache2 restart</pre>
<h2>PhpMyAdmin aufrufen</h2>
<p>Jetzt können wir zum ersten Mal phpMyAdmin aufrufen. Im Browser die folgende URL eingeben</p>
<pre>http://&lt;IP-Adresse&gt;/phpmyadmin/</pre>
<p>Jetzt mit dem Mysql User "root" anmelden, um Datenbanken einzurichten oder neue Datenbankuser anzulegen. Bestehende Datenbanken werden mit dem User "phpmyadmin" bearbeitet.</p>
