## WiFi Protected Access

### Schwachstellen

WPA bietet ähnliche Schwachstellen und somit Angriffsmöglichkeiten wie auch WEP. Da das Temporal Key Integrity Protocol auf RC4 basiert, ist es anfällig für Known-Plaintext-Angriffe (Der Angreifer besitzt neben dem Chiffre/Geheimtext auch den dazu gehörenden Klartext und versucht daraus den Schlüssel zu ermitteln). Diese Schwachstelle bessert WPA2 aus, da dort AES (Advanced Encryption Standard) anstelle von TKIP verwendet wird.

Auch ARP-Spoofing ist möglich. Mit dieser Attacke kann der Angreifer den gesamten Datenverkehr mitschneiden und ggf. manipulieren. Auch kann das Passwort des WLANs mithilfe einer Dictionary Attack erraten werden. Aus diesem Grund sind simple, kurze Passwörter mit wenigen unterschiedlichen Zeichen nicht empfohlen. Es gibt zahlreiche Listen mit den meistbenutzen Passwörtern, mithilfe solch einer Wordlist und der Aufzeichnung eines Four-Way Handshakes zwischen Access Point und WLAN-Client kommt man bereits in das entsprechende Netzwerk. Aus diesem Grund haben z.B. Router ein kompliziertes, zusammenhangloses Passwort.

Ähnlich ist es bei der Bruteforce Attacke. Bei dieser Attacke wird allerdings keine Liste mit möglichen Passwörtern benötigt, da hier solange alle möglichen Zeichenkombinationen durchprobiert werden, bis die richtige Kombination gefunden wird.

### Dictionary Attack

Ein Dictionary Attack wird unter anderem beim Pentesting verwendet, oder aber auch um sich tatsächlich böswillig in ein Netzwerk zu hacken.

Die Voraussetzung, damit der Wörterbuchangriff auch erfolgreich ist, dass der Betreiber des WLANs ein simples Passwort gewählt hat, welches auch in einer Wordlist steht.

Der Ablauf eines WPA WLAN-Hacks per Dictionary Attack ist folgender:

1. „Material&quot; beschaffen
  1. Wordlist
  2. WLAN-Adapter
  3. Zielnetzwerk
2. WLAN identifizieren
3. Four-Way Handshake aufzeichnen
  1. Deauthentication Attack
4. Passwort mit Hilfe von Wordlist herausfinden

Zuerst einmal wird ein Zielnetzwerk benötigt, dafür kann man eine virtuelle Instanz nutzen oder auch einen Router. Man muss im Wireless-Setup WPA mit einem Passwort einrichten. Außerdem muss sich in diesem WLAN ein aktiver WLAN Client befinden, da man den Handshake zwischen einem Client und dem Access Point aufzeichnen möchte. Außerdem wird eine Wordlist benötigt, mit Hilfe derer findet man im letzten Schritt das Passwort heraus. Dies ist eine Textdatei in der sich in jeder Zeile ein Passwort in Klartext befindet. In einer Worldlist stehen häufig verwendete Passwörter, unter denen sich im Idealfall auch das gesuchte Passwort befindet. Man kann diese selbst schreiben, wobei dies ziemlich aufwendig ist, oder man lädt eine beliebige Datei aus dem Internet herunter. Ohne eine Wordlist funktioniert diese Attacke nicht!







Mitte 2004 wurde dann der Nachfolger von WPA eingeführt, WPA2. Hier wurde auch der vollständige IEEE 802.11i-Standard umgesetzt. WPA ist heutzutage nicht mehr ausreichend sicher und sollte somit nicht für drahtlose Netzwerke verwendet werden.
