</div>
    </nav>
	<!-- ISEARCH_BEGIN_INDEX -->



  <div class="container">


		<!-- ISEARCH_END_INDEX -->
		<div id="befreien" style="display:none;">
	   	<div class="row">
	   		<div class="col-md-12 row_first">
	   			<div class="alert alert-warning" role="alert">
		    		<a class="close" data-dismiss="alert">×</a>
	  	  		Die Seite wird in einem Frame ausgeführt. Bitte <a href="http://www.rogersteen.de/software-raspberry-pi.php?page=08" target="_blank">hier klicken</a>, um die Seite im eigenen Browserfenster anzuzeigen.
		    	</div>
	    	</div>
	    </div>
    </div>

		<!-- ISEARCH_BEGIN_INDEX -->



		<!-- ISEARCH_END_INDEX -->
    <div class="row visible-print-block row_space_print_header">
      <div class="col-md-12">
				<div><p>&nbsp;</p></div>				<hr>
      </div>
		</div>
		<!-- ISEARCH_BEGIN_INDEX -->

   		



      <div class="row">
        <div class="col-md-4 col-sm-4 row_first row_space_bottom_dbl">
<div id="carousel-example-generic" class="carousel slide " data-ride="carousel"> 
		 					<!-- Wrapper for slides -->
		 					<div class="carousel-inner" role="listbox"><div class="item"> <img class="carousel_image" alt="" src="/images/raspberry-pi/RaspberryPi-1.jpg"> </div><div class="item"> <img class="carousel_image" alt="" src="/images/raspberry-pi/RaspberryPi-2.jpg"> </div><div class="item active left"> <img class="carousel_image" alt="" src="/images/raspberry-pi/RaspberryPi-3.jpg"> </div><div class="item next left"> <img class="carousel_image" alt="" src="/images/raspberry-pi/RaspberryPi-4.jpg"> </div>  </div> 
						</div><div><div><p>&nbsp;</p>
<p><a href="software-raspberry-pi.php" title="" class="menu page">RASPBERRY PI incl. Buchempfehlungen</a></p>
<p><a href="software-raspberry-pi.php?page=01" title="" class="menu page01">Inbetriebnahme des Raspberry Pi</a></p>
<p>Einrichtung des<br>
<a href="software-raspberry-pi.php?page=02" title="" class="menu page02">WLAN-Adapters (Edimax)</a></p>
<p>Der alternative Zugriff über<br>
<a href="software-raspberry-pi.php?page=03" title="" class="menu page03">eine Remotedesktopverbindung</a><br>
<a href="software-raspberry-pi.php?page=04" title="" class="menu page04">das Cygwin Terminal</a><br>
<a href="software-raspberry-pi.php?page=05" title="" class="menu page05">den Cygwin XWin Server</a></p>
<p>Die Installation der Zusatzsoftware<br>
<a href="software-raspberry-pi.php?page=06" title="" class="menu page06">für die Erweiterungsplatine</a><br>
<a href="software-raspberry-pi.php?page=07" title="" class="menu page07">für das Kameramodul</a></p>
<p>Die Einrichtung<br>
<a href="software-raspberry-pi.php?page=08" title="" class="menu page08">eines Webservers</a><br>
<a href="software-raspberry-pi.php?page=09" title="" class="menu page09">eines FTP-Servers</a></p>
<p>Die Installation<br>
<a href="software-raspberry-pi.php?page=10" title="" class="menu page10">des RPI ControlCenters</a><br>
<a href="software-raspberry-pi.php?page=12" title="" class="menu page12">weiterer Software</a></p>
<p><a href="software-raspberry-pi.php?page=11" title="" class="menu page11">Das System aktuell halten</a></p>
<p class="content_space">Ich freue mich über Ihr <a href="/feedback.php">Feedback</a> zu dieser Anleitung, die im Dezember 2013 erstellt und im April 2019 überarbeitet wurde. Sie basiert auf dem Raspbian-Image (Debian Stretch) <br>
<span style="font-family: Courier New;">2019-04-08-raspbian-stretch-lite.img</span><br>
<span style="font-family: Courier New;">2019-04-08-raspbian-stretch-full.img</span></p></div></div> 		    </div>
        
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
