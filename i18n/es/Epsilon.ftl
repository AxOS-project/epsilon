# used across files
exiting = Saliendo
packages =
    { $pkgNum ->
        [one] paquete
       *[other] paquetes
    }
# main
run-as-root = Ejecutar Epsilon como root no está permitido ya que puede llevar a la ruptura del sistema. En su lugar, Epsilon le avisará cuando necesite permisos de superusuario.
aur-warning =
    El AUR es una fuente de paquetes/scripts enviados por los usuarios y no siempre es segura.
    Por favor, asegúrese de revisar el PKGBUILD de cualquier cosa que descargue del AUR antes de instalarlo, ya que algunos PKGBUILDs pueden ser potencialmente maliciosos. 
    Esta advertencia puede activarse en el archivo de configuración.
clear-pkgbuild-cache = ¿Limpiar la caché interna de PKGBUILD de Epsilon?
missing-deps = Dependencias que faltan
continue = ¿Continuar?
following-packages = Se han encontrado los siguientes paquetes en el AUR:
are-you-sure = ¿Está seguro de que quiere continuar?
uninstalling-packages = Desinstalando paquetes: { $packages }
system-upgrade = Realizando la actualización del sistema
removing-orphans = Eliminación de paquetes huérfanos
couldnt-find-packages = No se han podido encontrar los paquetes { $packages } en los repos o en el AUR
searching-repos = Buscando repos para { $query }
searching-aur = Búsqueda en AUR de { $query }
no-results = No se han encontrado resultados
results = Resultados:
installed-repo-packages = Paquetes del repositorio instalados:
installed-aur-packages = Paquetes AUR instalados:
installed-packages = Paquetes instalados:
invalid-shell = Shell no válido, { $shell }
zsh-error = Las terminaciones del shell de ZSH no se soportan actualmente debido a un error en la crate 'clap_completion'
# operations::clean
no-orphans = No se han encontrado paquetes huérfanos
removing-orphans-would =
    La eliminación de los paquetes huérfanos desinstalaría los siguientes paquetes:
    { $packages }
failed-remove-orphans = No se han podido eliminar los paquetes huérfanos
success-remove-orphans = Paquetes huérfanos removidos con éxito
clear-pacman-cache = ¿Borrar también la caché de paquetes de Pacman?
failed-clear-cache = Fallo al borrar la caché del paquete, { $error }
aur-make-dependencies = Dependencias de compilación de AUR
aur-check-dependencies = Dependencias de verificación de AUR
some-pkgs-already-installed = Algunos paquetes ya han sido instalados. ¿Continuar igualmente?
dependency-cycle = Ciclo de dependencias detectado. Abortando instalación.
couldnt-find-pkg-produced = No se ha podido encontrar el paquete { $pkg } en los paquetes generados
# operations::aur_install::aur_download
all-sources-ready = Todas las fuentes están listas.
# operations::aur_install::make_dependency_removal
remove-installed-make-deps = ¿Quieres remover las dependencias de compilación instaladas?
makepkg-err = Error al iniciar makepkg
pacnew-warning =
    Parece que al menos un programa que has instalado o actualizado ha creado un archivo .pacnew.  
     Esto pasa cuando has modificado la configuración de un paquete, y la actualización no ha podido actualizar la configuración automáticamente.  
     Puedes solucionar esto ejecutando
pacdiff-warning =
    Pacdiff usa vimdiff por defecto para editar archivos cuando se fusionan. Puedes moverte por los paneles moviendo el ratón y pulsando botón derecho, y moverte arriba o abajo usando la rueda del ratón (o las flechas del teclado). Para salir de vimdiff, pulsa la siguiente configuración: ESC, :qa!, ENTER  
    Puedes esconder esta advertencia en el futuro cambiado la opción 'pacdiff_warn' a 'falso' en ~/.config/epsi/config.toml
upgrade = Actualiza los paquetes instalados localmente a las últimas versiones (Por defecto)
install-packages = El nombre del/los paquete(s) que quieres instalar o buscar
query-repo = Lista paquetes nativos/del repositorio [-Qr, -Qn]
query-owns = Conseguir información sobre que paquete es propietario de un archivo
# operations::aur_install::common
downloading-sources = Descargando fuentes
query-aur = Lista paquetes del AUR o fuera de repositorio [-Qa, -Qm]
aur-dependencies = Dependencias de AUR
repo-make-dependencies = Dependencias de compilación de repositorio
success-clear-cache = Caché de paquetes limpiada con éxito
error-install = Un error ha ocurrido mientras se instalaban los paquetes: { $error }, abortando
# operations::search
out-of-date = Desactualizado desde
installed = instalado
# operations::uninstall
failed-remove-pkgs = Error al remover los paquetes
# operations::upgrade
failed-upgrade-repo-pkgs = Error al actualizar los paquetes del repositorio
success-upgrade-repo-pkgs = Paquetes del repositorio actualizados con éxito
couldnt-find-remote-pkg = No se ha encontrado un paquete remoto para { $pkg }
no-upgrades-aur-package = No hay actualizaciones para los paquetes de AUR
scanning-for-pacnew = Buscando archivos .pacnew después de actualizar
# logging::output
repo-dependencies = Dependencias de repositorio
# operations::install
installing-packages-from-repos = Instalando { $packages } de los repositorios
repo-check-dependencies = Dependencias de verificación de repositorio
version = versión
votes = votos
capital-installed = Instalado
# operations::aur_install::aur_fetch
fetching-pkg-info = Obteniendo información del paquete
couldnt-find-all-pkgs = No se han encontrado todos los paquetes
all-pkgs-found = Todos los paquetes han sido encontrados
# internal::detect
sudo-prompt-failed = La petición de contraseña ha fallado
pulling-latest-changes = Descargando los últimos cambios
cloning-aur-repo = Clonando el repositorio AUR
down-and-ext-files = Descargando y extrayendo archivos
building-packages = Compilando paquetes
built = Compilado
installing-packages = Instalando paquetes
building-package = Compilando paquete
build-failed = Compilación fallida!
# operations::aur_install::aur_review
select-pkgs-review = Selecciona los paquetes que quieres revisar
do-you-still-want-to-install = ¿Aún quieres instalar estos paquetes?
review-build-log = ¿Quieres revisar el registro de compilación?
do-you-want-to-install = ¿Quieres instalar estos paquetes y sus dependencias?
downloaded = ¡Descargado!
reviewing = Revisando
select-file-review = Selecciona un fichero para revisarlo
done-reviewing-pkg = Revisión finalizada para { $pkg }
review = ¿Revisar { $pkg }?
# interact::theme
no-selections = Sin selecciones
# operations::aur_install::repo_dependency_installation
installing-repo-deps = Instalando las dependencias del repositorio
# operations::aur_install::aur_dependency_installation
installing-from-aur = Instalando { $amountOfPkgs } del AUR
done = ¡Completado!
# operations::aur_install
aur-rpc-crash = La llamada RPC al AUR ha fallado con el error: { $error }
failed-to-build = Error al compilar
makepkg-failed = makepkg ha fallado
unknown-error = Error desconocido
# internal::error
non-zero-exit = Finalizado con un código que no es 0
build-step-violation = La compilación del AUR ha violado los pasos de compilación
build-error = Error al compilar el paquete
user-cancel = Cancelado por el usuario
error-occurred = Un error ha ocurrido
scanning-pacnew-files = Buscando archivos pacnew
no-pacnew-found = No se han encontrado archivos .pacnew
pacnew-found = Se han encontrado archivos pacnew
run-pacdiff-now = ¿Quieres ejecutar pacdiff ahora?
# internal::paging
quit = salir
search-paging = buscar
next-result = siguiente resultado
previous-result = anterior resultado
# --help
verbose = Elegir el nivel de verbosidad
no-confirm = Completar la operación sin preguntar al usuario
quiet = Hacer que algunos comandos tengan menos verbosidad (solo clean, upgrade y install están soportados)
sudoloop = Pone sudo en un bucle de fondo para asegurarse de que no se cierra por inactividad durante compilaciones largas
cachedir = Establece un directorio personalizado para la clonación y compilación de paquetes del AUR
install = Instala o busca los paquetes tanto en el AUR como en los repositorios de Pacman
remove = Desinstala un paquete previamente instalado
query = Busca todos los paquetes instalados
gencomp = Genera auto-completación para las shell soportadas (bash, fish, elvish, pwsh)
clean = Desinstala todos los paquetes huérfanos
checkupdates = Busca y muestra todos los paquetes que tienen actualizaciones
diff = Ejecuta pacdiff
install-aur = Operar solo con los paquetes del AUR
install-repo = Operar solo con los paquetes de repositorios
install-search = Buscar los paquetes con el patrón proporcionado en vez de instalar
install-by = Buscar por un campo específico
remove-packages = El nombre del/los paquete(s) a desinstalar
query-explicit = Lista paquetes instalados explícitamente [-Qe]
query-info = Conseguir información sobre un paquete especifico
upgrade-repo = Actualiza solo paquetes del nativos/de los repositorios
upgrade-aur = Actualiza solo paquetes del AUR
gencomp-shell = La shell para la que quieres generar la auto-completación (bash, fish, elvish, pwsh, fig)
description = Un ayudante de AUR rápido y eficiente
