installed = zainstalowano
# operations::uninstall
failed-remove-pkgs = Nie udało się usunąć pakietów
# operations::upgrade
failed-upgrade-repo-pkgs = Nie udało się zaktualizować pakietów z repozytoriów
success-upgrade-repo-pkgs = Pomyślnie zaktualizowano pakiety z repozytoriów
couldnt-find-remote-pkg = Nie można znaleźć pakietu zdalnego dla { $pkg }
no-upgrades-aur-package = Brak dostępnych aktualizacji dla zainstalowanych pakietów AUR
scanning-for-pacnew = Skanowanie w poszukiwaniu plików .pacnew po aktualizacji
snapshot-created-successfully = Zrzut utworzony pomyślnie.
snapshot-tool-exited-status = Narzędzie do tworzenia zrzutów zakończyło działanie z statusu: {$status}
failed-to-run-snapshot-tool = Nie udało się uruchomić narzędzia do tworzenia zrzutów: {$error}
timeshift-not-installed = Jeśli Timeshift nie jest zainstalowany, rozważ jego instalację w celu tworzenia zrzutów!
timeshift-list-nonzero-status = Timeshift zwrócił błąd podczas listowania snapshotów: {error}
failed-to-run-snapshot-list-tool = Nie udało się uruchomić polecenia Timeshift do listowania snapshotów: {error}
could-not-parse-snapshot-id = Nie udało się odczytać ID snapshotu z linii: {line}
snapshot-removed-successfully = Snapshot z [epsilon] został pomyślnie usunięty.
snapshot-tool-exited-status = Narzędzie snapshot zakończyło działanie ze statusem: {status}
failed-to-run-snapshot-tool = Błąd podczas uruchamiania narzędzia snapshot: {error}
no-epsilon-snapshot-found = Nie znaleziono żadnego snapshotu z [epsilon]. Pomijam usunięcie.

# logging::output
repo-dependencies = Zależności repozytorium
aur-dependencies = Zależności AUR
repo-make-dependencies = Zależności do kompilowania pakietów z repozytoriów
missing-deps = Brakujące zależności
continue = Kontynuować?
# main
run-as-root = Uruchamianie Epsilon jako root jest niedozwolone, ponieważ może prowadzić do awarii systemu. Zamiast tego Epsilon wyświetli komunikat, gdy będzie potrzebować uprawnień administratora.
following-packages = Następujące pakiety zostały znalezione w AUR:
are-you-sure = Jesteś pewien że chcesz kontynuować?
uninstalling-packages = Odinstalowywanie następujących pakietów: { $packages }
system-upgrade = Aktualizowanie wszystkich zainstalowanych pakietów
removing-orphans = Usuwanie niepotrzebnych pakietów
couldnt-find-packages = Nie odnaleziono : { $packages } w repozytoriach lub AUR
searching-repos = Szukanie { $query } w repozytoriach
searching-aur = Szukanie { $query } w AUR
results = Wyniki:
no-results = Niczego nie znaleziono
installed-aur-packages = Zainstalowane pakiety AUR:
installed-repo-packages = Zainstalowane pakiety z repozytoriów:
installed-packages = Zainstalowane pakiety:
# operations::clean
no-orphans = Nie znaleziono niepotrzebnych pakietów
failed-remove-orphans = Nie udało się usunąć niepotrzebnych pakietów
removing-orphans-would =
    Usuwanie niepotrzebnych pakietów usunie:
    { $packages }
clear-pacman-cache = Wyczyścić także pamięć podręczną pakietów Pacmana?
success-clear-cache = Pomyślnie wyczyszczono pamięć podręczną pakietów
success-remove-orphans = Pomyślnie usunięto niepotrzebne pakiety
error-install = Wystąpił błąd podczas instalacji pakietów: { $error }, przerywanie
failed-clear-cache = Nie udało się wyczyścić pamięci podręcznej pakietów,  { $error }
version = wersja
votes = głosy
capital-installed = Zainstalowane
aur-make-dependencies = Zależności do kompilowania pakietów AUR
aur-warning = AUR jest źródłem pakietów/skryptów przesłanych przez użytkowników i nie zawsze jest bezpieczny w użyciu.
clear-pkgbuild-cache = Wyczyścić wewnętrzną pamięć podręczną PKGBUILD?
# operations::install
installing-packages-from-repos = Instalowanie { $packages } z repozytoriów
zsh-error = Uzupełnienia powłoki Zsh są obecnie nieobsługiwane z powodu błędu w clap_completion
build-failed = Błąd podczas kompilacji!
do-you-still-want-to-install = Na pewno chcesz zainstalować te pakiety?
# operations::aur_install::make_dependency_removal
remove-installed-make-deps = Chcesz odinstalować zależności potrzebne do kompilacji?
invalid-shell = Nieprawidłowa powłoka, { $shell }
# operations::aur_install::aur_fetch
fetching-pkg-info = Pobieranie informacji o pakiecie
couldnt-find-all-pkgs = Nie odnaleziono wszystkich pakietów
all-pkgs-found = Odnaleziono wszystkie pakiety
some-pkgs-already-installed = Niektóre pakiety są już zainstalowane, kontynuować?
do-you-want-to-install = Chcesz zainstalować te pakiety i ich zależności?
# operations::aur_install::common
downloading-sources = Pobieranie źródeł
pulling-latest-changes = Pobieranie najnowszych zmian
cloning-aur-repo = Pobieranie pakiety z AUR
down-and-ext-files = Pobieranie i rozpakowywanie plików
downloaded = Pobrano!
dependency-cycle = Wykryto problem z zależnościami. Przerywanie instalacji.
building-packages = Kompilowanie pakietów
built = Skompilowano
installing-packages = Instalowanie pakietów
building-package = Kompilowanie pakietów
couldnt-find-pkg-produced = Nie odnaleziono pakietu { $pkg } w zbudowanych pakietach
review-build-log = Czy chcesz zobaczyć wynik kompilacji?
# operations::aur_install::aur_download
all-sources-ready = Wszystkie źródła są gotowe.
# interact::theme
no-selections = Nic nie zaznaczono
# operations::aur_install::repo_dependency_installation
installing-repo-deps = Instalowanie zależności repozytorium
# operations::aur_install::aur_dependency_installation
installing-from-aur = Instalowanie { $amountOfPkgs } z AUR
done = Gotowe!
failed-to-build = Kompilacja się nie powiodła
unknown-error = Nieznany błąd
# internal::error
non-zero-exit = Przerwano z kodem innym niż 0
build-error = Kompilacja paczki nie powiodła się
user-cancel = Przerwano przez użytkownika
error-occurred = Wystąpił problem
no-pacnew-found = Nie odnaleziono plików .pacnew
pacnew-found = Odnaleziono pliki .pacnew
pacnew-warning =
    Wygląda na to, że co najmniej jeden zainstalowany/zaktualizowany program zainstalował plik konfiguracyjny .pacnew.
    Są one tworzone, gdy zmodyfikowałeś konfigurację programu, a aktualizacja pakietu nie mogła automatycznie scalić nowego pliku.
    Możesz poradzić sobie z tymi plikami, uruchamiając
# internal::paging
quit = wyjdź
search = wyszukaj
next-result = następny wynik
previous-result = poprzedni wynik
# --help
verbose = Ustawia poziom czegośtam
no-confirm = coś bez aktywności użytkownika
quiet = Spraw, aby niektóre polecenia miały mniejszą wydajność (tylko clean, upgrade i install są obsługiwane)
install = Instaluje lub wyszukuje pakiet w AUR lub repozytoriach zdefiniowanych przez Pacmana
remove = Usuwa zainstalowany pakiet
query = Wyszukuje wśród zainstalowanych pakietów
scanning-pacnew-files = Wyszukiwanie plików .pacnew
upgrade = Uaktualnia lokalnie zainstalowane pakiety do ich najnowszych wersji (domyślnie)
gencomp = Generuje uzupełnienia powłoki dla obsługiwanych powłok (bash, fish, elvish, pwsh)
clean = Usuwa wszystkie niepotrzebne pakiety
install-packages = Nazwa pakietu(ów) do zainstalowania lub wyszukania
install-aur = Działaj tylko na pakietach AUR
install-repo = Działaj tylko na pakietach z repozytoriów
remove-packages = Nazwy pakietu(ów) do usunięcia
query-aur = Wyświetla listę pakietów z AUR lub nieznanych źródeł [-Qa, -Qm]
query-repo = Wyświetla listę pakietów z repozytoriów [-Qa, -Qm]
query-info = Wyświetl informacje na temat danej paczki
upgrade-repo = Aktualizuje tylko natywne/pakiety z repozytoriów
query-owns = Uzyskaj informacje o tym, który pakiet posiada plik
description = Szybki i wydajny pomocnik AUR
# operations::search
out-of-date = nieaktualny: od
# used across files
exiting = Opuszczanie
packages =
    { $pkgNum ->
        [one] pakiet
       *[other] pakietów
    }
upgrade-aur = Aktualizuje pakiety tylko z AUR
gencomp-shell = Powłoka do wygenerowania uzupełnień (bash, fish, elvish, pwsh, fig)
