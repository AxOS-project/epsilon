# used across files
exiting = Schließt...
packages =
    { $pkgNum ->
        [one] Paket
       *[other] Pakete
    }
missing-deps = Fehlende Paketabhängigkeiten
continue = Fortfahren?
# main
run-as-root = Epsilon mit root Berechtigungen auszuführen ist nicht erlaubt und kann zu korrupten Systemen führen. Epsilon wird nach root Berechtigungen fragen, wenn diese nötig sein sollten.
following-packages = Folgende Pakete wurden im AUR gefunden:
aur-warning =
    AUR ist eine Plattform, welche von der Community verwaltete Pakete zur Verfügung stellt und die Sicherheit von den Paketen nicht gewährleisten kann.
    Es wird empfohlen, die PKGBUILD-Dateien der Pakete zu überprüfen, bevor Sie diese Pakete installieren, da manche PKGBUILD-Dateien gefährlich sein könnten. 
    Diese Warnung kann in der Konfigurationsdatei dekativiert werden.
are-you-sure = Sicher, dass Sie fortfahren möchten?
uninstalling-packages = Folgende Pakete werden deinstalliert: { $packages }
system-upgrade = Führe Systemaktualisierung durch
removing-orphans = Deinstalliere nicht benötigte Pakete
couldnt-find-packages = Folgende Pakete wurden nicht in den Pacman-Paketquellen oder der AUR gefunden: { $packages }
searching-repos = Durchsuche Paketinhalte nach { $query }
searching-aur = Durchsuche AUR nach { $query }
no-results = Keine Ergebnisse gefunden
results = Ergebnisse:
installed-repo-packages = Aus den Pacman-Paketquellen installierte Pakete:
installed-aur-packages = Aus der AUR installierte Pakete:
installed-packages = Installierte Pakete:
invalid-shell = Nicht unterstützte Shell: { $shell }
zsh-error = ZSH shell Vervollständigung werden zurzeit nicht vom clap_completion crate unterstützt
# operations::clean
no-orphans = Keine nicht benötigten Pakete gefunden
removing-orphans-would =
    Das entfernen von nicht benötigten Paketen wird folgende Pakete entfernen:
    { $packages }
failed-remove-orphans = Folgende nicht benötigte Pakete konnten nicht entfernt werden
success-remove-orphans = Folgende nicht benötigte Pakete wurden erfolgreich entfernt
clear-pkgbuild-cache = Aexethers internen Paketcache ausleeren?
clear-pacman-cache = Pacmans Paketcache leeren?
failed-clear-cache = Paketcache konnte nicht geleert werden, { $error }
success-clear-cache = Paketcache wurde erfolgreich geleert
# operations::install
installing-packages-from-repos = Folgende Pakete { $packages } werden von den Paketquellen installiert
error-install = Während der Paketinstallation ist ein Fehler aufgetreten: { $error }. Die Installation wird abgebrochen
# operations::search
out-of-date = veraltet: since
installed = installiert
# operations::uninstall
failed-remove-pkgs = Folgende Pakete konnten nicht deinstalliert werden
# operations::upgrade
failed-upgrade-repo-pkgs = Folgende Pakete aus Pacman-Paketquellen konnten nicht aktualisiert werden
success-upgrade-repo-pkgs = Folgende Pakete aus Pacman-Paketquellen wurden erfolgreich aktualisiert
couldnt-find-remote-pkg = Remotepaket für { $pkg } konnte nicht gefunden werden
no-upgrades-aur-package = Keine Aktualisierungen für AUR Pakete gefunden
scanning-for-pacnew = Scanne für .pacnew Dateien nach Aktualisierung
select-pkgs-upgrade = Wähle aus, welche AUR Pakete aktualisiert werden sollen
snapshot-created-successfully = Snapshot erfolgreich erstellt.
snapshot-tool-exited-status = Snapshot-Tool wurde beendet mit dem Status: {$status}
failed-to-run-snapshot-tool = Fehler beim Ausführen des Snapshot-Tools: {$error}
timeshift-not-installed = Wenn Timeshift nicht installiert ist, sollten Sie es in Betracht ziehen, es zu installieren, um Snapshots zu erstellen!
timeshift-list-nonzero-status = Timeshift gab beim Auflisten der Snapshots einen Fehler zurück: {error}
failed-to-run-snapshot-list-tool = Fehler beim Ausführen des Timeshift-Befehls zum Auflisten der Snapshots: {error}
could-not-parse-snapshot-id = Snapshot-ID konnte aus der Zeile nicht gelesen werden: {line}
snapshot-removed-successfully = Snapshot mit [epsilon] wurde erfolgreich entfernt.
snapshot-tool-exited-status = Snapshot-Tool wurde mit folgendem Status beendet: {status}
failed-to-run-snapshot-tool = Fehler beim Ausführen des Snapshot-Tools: {error}
no-epsilon-snapshot-found = Kein Snapshot mit [epsilon] gefunden, überspringe Löschung.
# logging::output
repo-dependencies = Paketabhängigkeiten aus den Pacman-Paketquellen
aur-dependencies = Paketabhängigkeiten aus der AUR
repo-make-dependencies = Paketabhängigkeiten zum Bauen der Pakete aus den Pacman-Paketquellen
aur-make-dependencies = Paketabhängigkeiten zum Bauen der Pakete aus der AUR
version = Version
votes = Stimmen
capital-installed = Installiert
# operations::aur_install::aur_fetch
fetching-pkg-info = Rufe Paketinformationen ab
couldnt-find-all-pkgs = Konnte nicht alle Pakete finden
all-pkgs-found = Alle Pakete wurden gefunden
some-pkgs-already-installed = Einige Pakete sind bereits installiert, trotzdem fortfahren?
do-you-want-to-install = Möchten Sie diese Pakete inklusive deren Abhängigkeiten installieren?
# operations::aur_install::common
downloading-sources = Lade Quelldateien herunter
pulling-latest-changes = Lade letzte Änderungen herunter
cloning-aur-repo = Lade AUR-Repository herunter
down-and-ext-files = Lade Dateien herunter und extrahiert diese
downloaded = Heruntergeladen!
dependency-cycle = Abhängigkeitsschleife erkannt! Die Installation wurde abgebrochen.
building-packages = Baue Pakete
built = Fertig!
installing-packages = Installiere Pakete
building-package = Baue Paket
build-failed = Erstellen des Pakets fehlgeschlagen!
couldnt-find-pkg-produced = Konnte das Paket { $pkg } nicht in den erstellten Paketen finden
review-build-log = Möchten Sie sich die Logdatei über die Paketerstellung anschauen?
# operations::aur_install::aur_review
select-pkgs-review = Wählen Sie die Pakete aus, die Sie überprüfen möchten
do-you-still-want-to-install = Möchten Sie die Pakete weiterhin installieren?
reviewing = Überprüfen
select-file-review = Wählen Sie eine Datei zum Überprüfen aus
done-reviewing-pkg = Überprüfung von { $pkg } abgeschlossen
# operations::aur_install::aur_download
all-sources-ready = Alle Quellen sind bereit.
# interact::theme
no-selections = Keine Auswahl
# operations::aur_install::repo_dependency_installation
installing-repo-deps = Installiere Pacman-Abhängigkeiten
# operations::aur_install::aur_dependency_installation
installing-from-aur = Installiere { $amountOfPkgs } aus der AUR
# operations::aur_install::make_dependency_removal
remove-installed-make-deps = Möchten Sie die ausschließlich zum Bauen verwendeten Abhängigkeiten entfernen?
done = Fertig!
# operations::aur_install
aur-rpc-crash = AUR RPC Aufruf ist fehlgeschlagen: { $error }
failed-to-build = Konnte nicht gebaut werden
makepkg-failed = makepkg ist fehlgeschlagen
unknown-error = Unbekannter Fehler
# internal::error
non-zero-exit = Ist mit einem Fehlercode beendet worden
build-step-violation = AUR Paketbau; Schritt fehlgeschlagen
build-error = Paket konnte nicht gebaut werden
user-cancel = Abbruch durch den Benutzer
makepkg-err = makepkg konnte nicht ausgeführt werden
error-occurred = Ein Fehler ist aufgetreten
# internal::detect
sudo-prompt-failed = Sudo Abfrage ist fehlgeschlagen
scanning-pacnew-files = Suche nach .pacnew Dateien
no-pacnew-found = Keine .pacnew Dateien gefunden
pacnew-found = .pacnew Dateien gefunden
pacnew-warning =
    Einige von den installierten oder aktualisierten Pakete haben eine .pacnew Datei hinterlassen.
    Diese Dateien werden erstellt, wenn sich die Konfiguration eines Programms geändert hat und nicht automatisch
    mit der vorhandenen Konfiguration zusammengeführt werden konnte. Sie können diese Konflikte lösen,
    indem Sie folgendes ausführen:
run-pacdiff-now = Möchten Sie pacdiff nun ausführen?
pacdiff-warning =
    Pacdiff nutzt standardmäßig vimdiff um Dateien zusammenzuführen. Sie können Bereiche fokussieren, indem Sie die Maus
    über diese bewegen und die linke Maustaste drücken. 
    Zum Beenden von vimdiff können Sie folgende Tastenkombination ausführen: ESC, :qa! eingeben und danach ENTER drücken
    Diese Warnung kann in der Konfigurationdatei ~/.config/epsi/config.toml unter der Einstellung `pacdiff_warn` ausgeschaltet werden, indem diese auf false gesetzt wird.
# internal::config
# internal::paging
quit = Beenden
search = Suche
next-result = Nächstes Ergebnis
previous-result = Vorheriges Ergebnis
# --help
verbose = Setzt das Ausgabelevel
no-confirm = Führt alle Vorgänge durch, ohne dass eine Benutzereingabe notwendig ist
quiet = Sorgt dafür, dass einige Befehle weniger in die Konsole schreiben (nur clean, upgrade und install werden hierbei unterstützt)
sudoloop = Lässt die Sudo-Abfrage im Hintergrund laufen, um weitere Eingaben zu vermeiden
cachedir = Setzt ein benutzerdefiniertes AUR clone und build Verzeichnis für den jeweiligen Vorgang
install = Installiert oder sucht nach Paketen die entweder aus der AUR oder Pacman-Paketquellen stammen
remove = Entfernt ein installiertes Paket
search = Sucht nach einem Paket, welches einem bestimmten Muster entspricht (in der AUR und Pacman-Repos) [aliases: -Ss]
query = Durchsucht installierte Pakete
upgrade = Aktualisiert lokale Pakete auf deren neueste Version (Standardwert)
gencomp = Generiert Shell-Vervollständigungen für unterstützte Shells (bash, fish, elvish, pwsh)
clean = Entfernt nicht verwendete Pakete
diff = Führt pacdiff aus
install-packages = Namen der Pakete die installiert oder gesucht werden sollen
install-aur = Betrachtet nur Pakete aus der AUR
install-repo = Betrachtet nur Pakete aus den Pacman-Paketquellen
install-search = Sucht nach Paketen die einem bestimmten Muster entsprechen, anstatt zu installieren
install-by = Sucht nach dem Wert eines bestimmten Feldes
remove-packages = Die Namen der Pakete, die entfernt werden sollen
query-aur = Listet AUR und Pacman-Fremde Pakete auf [-Qa, -Qm]
query-repo = Listet Pakete aus den Pacman-Paketquellen auf [-Qr, -Qn]
query-explicit = Listet Pakete auf, die explizit installiert wurden [-Qe]
query-info = Gibt Informationen über ein bestimmtes Paket aus
upgrade-repo = Aktualisiert nur Pakete aus Pacman-Paketquellen
upgrade-aur = Aktualisiert nur AUR-Pakete
gencomp-shell = Die Shell für die Auto-Vervollständigungen generiert werden soll (bash, fish, elvish, pwsh, fig)
review = { $pkg } überprüfen?
description = Ein schneller und effizienter AUR-Helfer
checkupdates = Fragt nach verfügbaren Paketaktualisierungen und gibt sie aus
repo-check-dependencies = Repository-Abhängigkeiten prüfen
search-paging = Suche
aur-check-dependencies = AUR-Abhängigkeiten prüfen
query-owns = Informationen darüber erhalten, welches Paket eine Datei besitzt
