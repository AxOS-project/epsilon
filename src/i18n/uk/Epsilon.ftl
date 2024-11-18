# operations::aur_install::make_dependency_removal
remove-installed-make-deps = Видалити встановлені залежності make?
install = Встановити або шукати пакет у сховищах AUR або Pacman
upgrade = Оновлювати локально встановлені пакунки до останніх версій (за замовчуванням)
install-packages = Назва пакету(ів), який потрібно встановити або знайти
install-search = Пошук пакетів за заданим шаблоном замість встановлення
# operations::install
installing-packages-from-repos = Встановлення пакетів { $packages } зі сховищ
# used across files
exiting = Вихід
missing-deps = Відсутні залежності
continue = Продовжити?
following-packages = У AUR було знайдено такі пакунки:
are-you-sure = Продовжити?
uninstalling-packages = Видалення пакетів: { $packages }
couldnt-find-packages = Не вдалося знайти пакети: { $packages } у сховищах або AUR
searching-repos = Пошук сховищ для { $query }
installed-aur-packages = Встановлені пакети AUR:
installed-packages = Встановлені пакети:
results = Знайдено:
invalid-shell = Недійсна оболонка, { $shell }
# operations::clean
no-orphans = Загублених пакетів не знайдено
removing-orphans-would =
    Видалення загублених пакетів призведе до видалення наступних пакетів:
    { $packages }
failed-remove-orphans = Не вдалося видалити загублені пакети
clear-pkgbuild-cache = Очистити внутрішній кеш PKGBUILD Epsilon?
clear-pacman-cache = Також очистити кеш пакетів Pacman?
success-clear-cache = Кеш пакетів успішно очищено
installed = встановлено
capital-installed = Встановлено
some-pkgs-already-installed = Деякі пакети вже встановлено. Усе одно продовжити?
installing-packages = Встановлення пакетів
do-you-still-want-to-install = Встановити ці пакети?
# operations::aur_install::repo_dependency_installation
installing-repo-deps = Встановлення залежностей сховища
# operations::aur_install::aur_review
select-pkgs-review = Виберіть пакети для перегляду
select-file-review = Виберіть файл для перегляду
# operations::search
out-of-date = застарілий: з
# operations::uninstall
failed-remove-pkgs = Не вдалося видалити пакети
success-upgrade-repo-pkgs = Успішно оновлено пакети сховища
couldnt-find-remote-pkg = Не вдалося знайти віддалений пакет для { $pkg }
scanning-for-pacnew = Сканування файлів .pacnew після оновлення
# logging::output
repo-dependencies = Залежності сховища
aur-dependencies = Залежності AUR
repo-check-dependencies = Перевірка залежностей сховища
repo-make-dependencies = Створення залежностей сховища
aur-check-dependencies = Первірка залежностей AUR
version = версія
# operations::aur_install::aur_fetch
fetching-pkg-info = Отримання інформації про пакет
all-pkgs-found = Усі пакунки було знайдено
# operations::aur_install::common
downloading-sources = Завантаження джерел
pulling-latest-changes = Отримання останніх змін
cloning-aur-repo = Клонування сховища aur
down-and-ext-files = Завантаження та розпакування файлів
downloaded = Завантажено!
building-packages = Збірка пакетів
built = Зібрано
building-package = Збирання пакету
build-failed = Збірка не вдалася!
review-build-log = Переглянути журнал збірки?
reviewing = Перегляд
done-reviewing-pkg = Перегляд завершено { $pkg }
review = Переглянути { $pkg }?
# interact::theme
no-selections = Нічого не обрано
votes = голоси(ів)
remove = Видалити раніше встановлений пакет
query = Запитувати встановлені пакети
done = Виконано!
# operations::aur_install
aur-rpc-crash = Помилка виклику AUR RPC з: { $error }
failed-to-build = Не вдалося виконати збірку
unknown-error = Невідома помилка
# internal::error
non-zero-exit = Завершено з ненульовим кодом
build-error = Не вдалося зібрати пакет
user-cancel = Скасовано користувачем
error-occurred = Сталась помилка
scanning-pacnew-files = Сканування файлів pacnew
no-pacnew-found = Файлів .pacnew не знайдено
run-pacdiff-now = Бажаєте запустити pacdiff зараз?
# internal::paging
quit = вийти
search-paging = пошук
next-result = наступний результат
previous-result = попередній результат
quiet = Зменшити вивід деяких команд (підтримуються лише clean, upgrade та install)
install-aur = Працювати тільки з пакетами AUR
install-repo = Працювати лише з пакетами сховищ
remove-packages = Ім'я пакету(ів), які потрібно видалити
makepkg-err = Не вдалося виконати makepkg
# --help
verbose = Встановити рівень докладності
no-confirm = Завершити дію без запиту користувача
cachedir = Встановити спеціальний каталог для клонування AUR і збірки для вказаної дії
pacnew-found = файлів pacnew не знайдено
gencomp = Генерувати завершення командної оболонки для підтримуваних (bash, fish, elvish, pwsh)
clean = Видалити усі загублені пакети
checkupdates = Запитувати та повернути доступні оновлення пакетів
diff = Запустити pacdiff
install-by = Шукати за певним полем
sudoloop = Виконувати цикли sudo у фоновому режимі, щоб гарантувати, що час очікування не закінчиться під час тривалого збирання
query-info = Отримати інформацію про конкретний пакет
query-owns = Отримати інформацію про те, якому пакету належить файл
gencomp-shell = Командна оболонка для створення завершень (bash, fish, elvish, pwsh, fig)
description = Швидкий і ефективний помічник AUR
query-aur = Вивести список AUR/чужих пакетів [-Qa, -Qm]
query-repo = Вивести список пакетів сховищ/власні [-Qr, -Qn]
query-explicit = Вивести список явно встановлених пакунків [-Qe]
upgrade-repo = Оновити лише пакети сховищ/власні
upgrade-aur = Оновити тільки пакети з AUR
packages =
    { $pkgNum ->
        [one] пакет
       *[other] пакети(ів)
    }
# main
run-as-root = Запуск Epsilon через root заборонено, оскільки це може призвести до поломки системи. Натомість Epsilon підказуватиме, коли йому потрібні дозволи суперкористувача.
aur-warning =
    AUR є джерелом надісланих користувачами пакетів/сценаріїв і не завжди безпечний у використанні.
    Обов’язково перевірте PKGBUILD усього, що ви завантажуєте з AUR, перш ніж встановлювати його, оскільки деякі PKGBUILD потенційно можуть бути шкідливими. 
    Це попередження можна вимкнути у файлі конфігурації.
system-upgrade = Оновлення системи
removing-orphans = Видалення загублених пакетів
searching-aur = Пошук AUR для { $query }
no-results = Нічого не знайдено
installed-repo-packages = Встановлені пакети сховища:
zsh-error = Командна оболонка Zsh наразі не підтримуються через помилку в контейнері clap_completion
success-remove-orphans = Успішно видалено загублені пакети
failed-clear-cache = Не вдалося очистити кеш пакетів, { $error }
error-install = Сталася помилка під час встановлення пакетів: { $error }, аварійне завершення
# operations::upgrade
failed-upgrade-repo-pkgs = Не вдалося оновити пакети сховища
no-upgrades-aur-package = Немає доступних оновлень для встановлених пакетів з AUR
aur-make-dependencies = Створення залежностей AUR
couldnt-find-all-pkgs = Не вдалося знайти усі пакети
do-you-want-to-install = Встановити ці пакети та їх залежності?
dependency-cycle = Виявлено цикл залежностей. Аварійне завершення.
couldnt-find-pkg-produced = Не вдалося знайти пакет { $pkg } у створених пакетах
# operations::aur_install::aur_download
all-sources-ready = Усі джерела готові.
# operations::aur_install::aur_dependency_installation
installing-from-aur = Встановлення { $amountOfPkgs } з AUR
makepkg-failed = помилка при виконанні makepkg
build-step-violation = Порушення етапів збірки при збірці AUR
# internal::detect
sudo-prompt-failed = Помилка sudo
pacnew-warning =
    Схоже, що принаймні одна програма, яку ви встановили/оновили, створила файл конфігурації .pacnew.
    Вони створюються, коли ви змінюєте конфігурацію програми, а оновлення пакета не може автоматично об’єднати новий файл.
    Ви можете працювати з цими файлами, запустивши
pacdiff-warning =
    Pacdiff використовує vimdiff за замовчуванням для редагування файлів для об’єднання. Ви можете сфокусувати панелі, навівши на них курсор і натиснувши ліву кнопку миші, а також прокручуючи вгору та вниз за допомогою коліщатка миші (або клавіш зі стрілками). Щоб вийти з vimdiff, натисніть таку комбінацію клавіш: ESC, :qa!, ENTER
    Ви можете припинити це попередження у майбутньому, встановивши для `pacdiff_warn` значення "false" у ~/.config/epsi/config.toml
