# utilisé dans plusieurs fichiers
exiting = Fermeture
packages = { $pkgNum ->
    [one] paquet
    *[other] paquets
}
missing-deps = Dépendances manquantes
continue = Continuer ?

# main
run-as-root = Exécuter Epsilon en tant que root est interdit car cela peut endommager le système. Epsilon demandera les permissions superutilisateur si nécessaire.
following-packages = Les paquets suivants ont été trouvés dans l’AUR :
aur-warning = 
    L’AUR est une source de paquets/scripts soumis par les utilisateurs et n’est pas toujours sûre.
    Veuillez vérifier le PKGBUILD de tout paquet avant de l’installer, car certains peuvent être malveillants.
    Cet avertissement peut être désactivé dans le fichier de configuration.
are-you-sure = Êtes-vous sûr de vouloir continuer ?
uninstalling-packages = Désinstallation des paquets : {$packages}
system-upgrade = Mise à niveau du système en cours
removing-orphans = Suppression des paquets orphelins
couldnt-find-packages = Impossible de trouver les paquets : {$packages} dans les dépôts ou l’AUR
searching-repos = Recherche dans les dépôts pour {$query}
searching-aur = Recherche dans l’AUR pour {$query}
no-results = Aucun résultat trouvé
results = Résultats :
installed-repo-packages = Paquets installés depuis les dépôts :
installed-aur-packages = Paquets installés depuis l’AUR :
installed-packages = Paquets installés :
invalid-shell = Shell invalide, {$shell}
zsh-error = Les complétions pour le shell Zsh ne sont pas encore supportées à cause d’un bug dans la crate clap_completion

# operations::clean
no-orphans = Aucun paquet orphelin trouvé
removing-orphans-would = 
    La suppression des orphelins désinstallerait les paquets suivants :
    {$packages}
failed-remove-orphans = Échec de la suppression des orphelins
success-remove-orphans = Orphelins supprimés avec succès
clear-pkgbuild-cache = Vider le cache interne PKGBUILD d’Epsilon ?
clear-pacman-cache = Vider aussi le cache des paquets de Pacman ?
failed-clear-cache = Échec de la suppression du cache, {$error}
success-clear-cache = Cache supprimé avec succès

# operations::install
installing-packages-from-repos = Installation des paquets {$packages} depuis les dépôts
error-install = Une erreur est survenue lors de l'installation des paquets : {$error}, abandon

# operations::search
out-of-date = obsolète depuis
installed = installé

# operations::uninstall
failed-remove-pkgs = Échec de la suppression des paquets

# operations::sync
syncing-databases = Synchronisation des bases de données
error-syncing-databases = Erreur lors de la synchronisation des bases de données : {$error}
success-syncing-databases = Bases de données synchronisées avec succès

# operations::upgrade
failed-upgrade-repo-pkgs = Échec de la mise à niveau des paquets des dépôts
success-upgrade-repo-pkgs = Mise à niveau réussie des paquets des dépôts
couldnt-find-remote-pkg = Impossible de trouver le paquet distant pour {$pkg}
no-upgrades-aur-package = Aucun mise à jour disponible pour les paquets AUR installés
scanning-for-pacnew = Recherche de fichiers .pacnew après mise à niveau
aur-check-upgrades = Vérification des mises à jour AUR
select-pkgs-upgrade = Sélectionnez les paquets AUR à mettre à jour
snapshot-created-successfully = Instantané créé avec succès.
snapshot-tool-exited-status = L’outil d’instantanés s’est arrêté avec le statut : {$status}
failed-to-run-snapshot-tool = Échec de l’exécution de l’outil d’instantanés : {$error}
timeshift-not-installed = Si Timeshift n’est pas installé, pensez à l’installer pour créer des instantanés !
timeshift-list-nonzero-status = Timeshift a renvoyé un code différent de zéro lors de la liste des instantanés : {$error}
failed-to-run-snapshot-list-tool = Échec de l’exécution de la commande de liste des instantanés Timeshift : {$error}
could-not-parse-snapshot-id = Impossible d’analyser l’ID d’instantané à partir de la ligne : {$line}
snapshot-removed-successfully = Instantané avec [epsilon] supprimé avec succès.
snapshot-tool-exited-status = L’outil d’instantanés s’est terminé avec le statut : {$status}
failed-to-run-snapshot-tool = Impossible de lancer l’outil d’instantanés : {$error}
no-epsilon-snapshot-found = Aucun instantané nommé [epsilon] trouvé. Suppression ignorée.

# logging::output
repo-dependencies = Dépendances des dépôts
aur-dependencies = Dépendances AUR
repo-make-dependencies = Dépendances de construction des dépôts
aur-make-dependencies = Dépendances de construction AUR
repo-check-dependencies = Dépendances de vérification des dépôts
aur-check-dependencies = Dépendances de vérification AUR
version = version
votes = votes
capital-installed = Installé

# operations::aur_install::aur_fetch
fetching-pkg-info = Récupération des informations du paquet
couldnt-find-all-pkgs = Impossible de trouver tous les paquets
all-pkgs-found = Tous les paquets trouvés
some-pkgs-already-installed = Certains paquets sont déjà installés. Continuer quand même ?
do-you-want-to-install = Voulez-vous installer ces paquets et leurs dépendances ?

# operations::aur_install::common
downloading-sources = Téléchargement des sources
pulling-latest-changes = Récupération des dernières modifications
cloning-aur-repo = Clonage du dépôt AUR
down-and-ext-files = Téléchargement et extraction des fichiers
downloaded = Téléchargé !
dependency-cycle = Cycle de dépendance détecté. Annulation de l’installation.
building-packages = Construction des paquets
built = Construit
installing-packages = Installation des paquets
building-package = Construction du paquet
build-failed = Échec de la construction !
couldnt-find-pkg-produced = Impossible de trouver le paquet {$pkg} dans les paquets produits
review-build-log = Voulez-vous consulter le journal de compilation ?

# operations::aur_install::aur_review
select-pkgs-review = Sélectionnez les paquets à examiner
do-you-still-want-to-install = Voulez-vous toujours installer ces paquets ?
reviewing = Examen en cours
select-file-review = Sélectionnez un fichier à examiner
done-reviewing-pkg = Fin de l’examen de {$pkg}
review = Examiner {$pkg} ?

# operations::aur_install::aur_download
all-sources-ready = Toutes les sources sont prêtes.

# interact::theme
no-selections = Aucune sélection

# operations::aur_install::repo_dependency_installation
installing-repo-deps = Installation des dépendances des dépôts

# operations::aur_install::aur_dependency_installation
installing-from-aur = Installation de {$amountOfPkgs} depuis l’AUR

# operations::aur_install::make_dependency_removal
remove-installed-make-deps = Voulez-vous supprimer les dépendances de construction installées ?
done = Terminé !

# operations::aur_install
aur-rpc-crash = L’appel RPC AUR a échoué avec : {$error}
failed-to-build = Échec de la construction
makepkg-failed = makepkg a échoué
unknown-error = Erreur inconnue
package-does-not-exist = Le paquet {$package} n’existe pas, ignoré…

# internal::error
non-zero-exit = S’est terminé avec un code non nul
build-step-violation = Construction AUR non conforme aux étapes prévues
build-error = Échec de la construction du paquet
user-cancel = Annulé par l’utilisateur
makepkg-err = Échec d’exécution de makepkg
error-occurred = Une erreur est survenue

# internal::detect
sudo-prompt-failed = Échec de l’invite sudo
scanning-pacnew-files = Recherche de fichiers .pacnew
no-pacnew-found = Aucun fichier .pacnew trouvé
pacnew-found = Fichiers .pacnew trouvés
pacnew-warning =
    Il semble qu’au moins un programme que vous avez installé ou mis à jour ait généré un fichier de configuration .pacnew.
    Ces fichiers sont créés quand une configuration modifiée ne peut être fusionnée automatiquement après une mise à jour.
    Vous pouvez les gérer en lançant
run-pacdiff-now = Voulez-vous exécuter pacdiff maintenant ?
pacdiff-warning =
    Pacdiff utilise vimdiff par défaut pour fusionner les fichiers. Vous pouvez naviguer entre les panneaux avec la souris et faire défiler avec la molette (ou les flèches du clavier). Pour quitter vimdiff, appuyez sur : ESC, :qa!, ENTRÉE.
    Vous pouvez désactiver cet avertissement en mettant `pacdiff_warn` à "false" dans ~/.config/epsi/config.toml

# internal::paging
quit = quitter
search-paging = recherche
next-result = résultat suivant
previous-result = résultat précédent

# --help
verbose = Définit le niveau de verbosité
no-confirm = Effectue l’opération sans confirmation
quiet = Réduit la sortie de certaines commandes (clean, upgrade et install)
sudoloop = Maintient sudo actif en arrière-plan pour éviter l’expiration pendant les longues constructions
cachedir = Définit un répertoire de cache personnalisé pour le clonage et la construction AUR
install = Installe ou recherche un paquet dans l’AUR ou les dépôts Pacman
remove = Supprime un paquet précédemment installé
search = Recherche des paquets correspondant à un motif dans l’AUR/dépôts [alias : -Ss]
query = Interroge les paquets installés
upgrade = Met à jour les paquets locaux installés vers leur dernière version (par défaut)
gencomp = Génère des complétions pour les shells supportés (bash, fish, elvish, pwsh)
clean = Supprime tous les paquets orphelins
checkupdates = Vérifie les mises à jour disponibles
diff = Lance pacdiff
sync = Synchronise les bases de données de paquets
install-packages = Nom du/des paquet(s) à installer ou rechercher
install-aur = Opérer uniquement sur les paquets AUR
install-repo = Opérer uniquement sur les paquets des dépôts
install-search = Recherche de paquets selon un motif au lieu d’installer
install-by = Recherche par champ spécifique
remove-packages = Nom du/des paquet(s) à supprimer
query-aur = Liste les paquets AUR/étrangers [-Qa, -Qm]
query-repo = Liste les paquets des dépôts [-Qr, -Qn]
query-explicit = Liste les paquets installés explicitement [-Qe]
query-info = Obtenir des infos sur un paquet spécifique
query-owns = Détermine à quel paquet appartient un fichier
upgrade-repo = Met à jour uniquement les paquets des dépôts
upgrade-aur = Met à jour uniquement depuis l’AUR
gencomp-shell = Shell pour lequel générer les complétions (bash, fish, elvish, pwsh, fig)
description = Un AUR helper rapide et efficace
