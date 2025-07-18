# used across files
exiting = बाहर निकल रहे हैं
packages = { $pkgNum ->
    [one] पैकेज
   *[other] पैकेज
}
missing-deps = गायब निर्भरताएं
continue = क्या आप जारी रखना चाहते हैं?

# main
run-as-root = Epsilon को रूट के रूप में चलाना अनुमति नहीं है क्योंकि इससे सिस्टम क्षतिग्रस्त हो सकता है। इसके बजाय, जब सुपरयूज़र अनुमतियों की आवश्यकता होगी तो Epsilon आपसे पूछेगा।
following-packages = निम्नलिखित पैकेज AUR में पाए गए:
aur-warning = 
    AUR उपयोगकर्ता-प्रस्तुत पैकेज और स्क्रिप्ट का स्रोत है, जो हमेशा सुरक्षित नहीं होते।
    कृपया किसी भी AUR स्रोत से डाउनलोड किए गए PKGBUILD को इंस्टॉल करने से पहले उसकी समीक्षा अवश्य करें, क्योंकि कुछ PKGBUILD हानिकारक हो सकते हैं।
    यह चेतावनी कॉन्फ़िगरेशन फ़ाइल में टॉगल की जा सकती है।
are-you-sure = क्या आप निश्चित हैं कि आप जारी रखना चाहते हैं?
uninstalling-packages = पैकेज अनइंस्टॉल हो रहे हैं: {$packages}
system-upgrade = सिस्टम का अपग्रेड किया जा रहा है
removing-orphans = अनाथ पैकेज हटा रहे हैं
couldnt-find-packages = पैकेज नहीं मिल सके: {$packages} रिपॉज या AUR में
searching-repos = रिपॉजिटरी में खोज की जा रही है: {$query}
searching-aur = AUR में खोज की जा रही है: {$query}
no-results = कोई परिणाम नहीं मिला
results = परिणाम:
installed-repo-packages = स्थापित रिपॉज पैकेज:
installed-aur-packages = स्थापित AUR पैकेज:
installed-packages = स्थापित पैकेज:
invalid-shell = अमान्य शेल, {$shell}
zsh-error = Zsh शेल कंप्लीशन्स clap_completion crate की बग के कारण समर्थित नहीं हैं

# operations::clean
no-orphans = कोई अनाथ पैकेज नहीं मिला
removing-orphans-would = 
    अनाथ हटाने से निम्नलिखित पैकेज अनइंस्टॉल होंगे:
    {$packages}
failed-remove-orphans = अनाथ हटाने में विफल
success-remove-orphans = अनाथ सफलतापूर्वक हटाए गए
clear-pkgbuild-cache = Epsilon के आंतरिक PKGBUILD कैश को साफ़ करें?
clear-pacman-cache = Pacman के पैकेज कैश को भी साफ़ करें?
failed-clear-cache = पैकेज कैश साफ़ करने में विफल, {$error}
success-clear-cache = पैकेज कैश सफलतापूर्वक साफ़ किया गया

# operations::install
installing-packages-from-repos = रिपॉज से पैकेज इंस्टॉल कर रहे हैं: {$packages}
error-install = पैकेज इंस्टॉल करते समय त्रुटि हुई: {$error}, रद्द किया जा रहा है

# operations::search
out-of-date = पुराना: तब से
installed = स्थापित

# operations::uninstall
failed-remove-pkgs = पैकेज हटाने में विफल

# operations::sync
syncing-databases = डेटाबेस सिंक कर रहे हैं
error-syncing-databases = डेटाबेस सिंक करते समय त्रुटि हुई: {$error}
success-syncing-databases = डेटाबेस सफलतापूर्वक सिंक किए गए

# operations::upgrade
failed-upgrade-repo-pkgs = रिपॉज पैकेज अपग्रेड में विफल
success-upgrade-repo-pkgs = रिपॉज पैकेज सफलतापूर्वक अपग्रेड हुए
couldnt-find-remote-pkg = रिमोट पैकेज नहीं मिला: {$pkg}
no-upgrades-aur-package = स्थापित AUR पैकेज के लिए कोई अपग्रेड उपलब्ध नहीं
scanning-for-pacnew = .pacnew फ़ाइलों के लिए स्कैन कर रहे हैं (अपग्रेड के बाद)
aur-check-upgrades = AUR पैकेज अपग्रेड जांच रहे हैं
select-pkgs-upgrade = कौन से AUR पैकेज अपग्रेड करने हैं चुनें
snapshot-created-successfully = स्नैपशॉट सफलतापूर्वक बनाया गया।
snapshot-tool-exited-status = स्नैपशॉट टूल स्थिति के साथ बाहर निकला: {$status}
failed-to-run-snapshot-tool = स्नैपशॉट टूल चलाने में विफल: {$error}
timeshift-not-installed = यदि Timeshift इंस्टॉल नहीं है, तो स्नैपशॉट बनाने के लिए इसे इंस्टॉल करने पर विचार करें!
timeshift-list-nonzero-status = स्नैपशॉट सूची बनाते समय Timeshift ने गैर-शून्य कोड लौटाया: {$error}
failed-to-run-snapshot-list-tool = Timeshift स्नैपशॉट सूची कमांड चलाने में विफल: {$error}
could-not-parse-snapshot-id = लाइन से स्नैपशॉट ID पार्स नहीं कर पाया: {$line}
snapshot-removed-successfully = [epsilon] के साथ स्नैपशॉट सफलतापूर्वक हटाया गया।
no-epsilon-snapshot-found = [epsilon] के साथ कोई स्नैपशॉट नहीं मिला। हटाना छोड़ दिया।

# logging::output
repo-dependencies = रिपॉज निर्भरताएं
aur-dependencies = AUR निर्भरताएं
repo-make-dependencies = रिपॉज मेक निर्भरताएं
aur-make-dependencies = AUR मेक निर्भरताएं
repo-check-dependencies = रिपॉज चेक निर्भरताएं
aur-check-dependencies = AUR चेक निर्भरताएं
version = संस्करण
votes = वोट
capital-installed = स्थापित

# operations::aur_install::aur_fetch
fetching-pkg-info = पैकेज जानकारी ला रहे हैं
couldnt-find-all-pkgs = सभी पैकेज नहीं मिल सके
all-pkgs-found = सभी पैकेज मिल गए
some-pkgs-already-installed = कुछ पैकेज पहले से स्थापित हैं। फिर भी जारी रखें?
do-you-want-to-install = क्या आप ये पैकेज और उनकी निर्भरताएं इंस्टॉल करना चाहते हैं?

# operations::aur_install::common
downloading-sources = स्रोत डाउनलोड कर रहे हैं
pulling-latest-changes = नवीनतम बदलाव खींच रहे हैं
cloning-aur-repo = AUR रिपॉज क्लोन कर रहे हैं
down-and-ext-files = फ़ाइलें डाउनलोड और निकाल रहे हैं
downloaded = डाउनलोड पूरा!
dependency-cycle = निर्भरता चक्र मिला। इंस्टॉलेशन रद्द।
building-packages = पैकेज बना रहे हैं
built = बना लिया
installing-packages = पैकेज इंस्टॉल कर रहे हैं
building-package = पैकेज बना रहे हैं
build-failed = निर्माण विफल!
couldnt-find-pkg-produced = उत्पन्न पैकेज में {$pkg} नहीं मिला
review-build-log = क्या आप बिल्ड लॉग देखना चाहते हैं?

# operations::aur_install::aur_review
select-pkgs-review = समीक्षा के लिए पैकेज चुनें
do-you-still-want-to-install = क्या आप अभी भी ये पैकेज इंस्टॉल करना चाहते हैं?
reviewing = समीक्षा कर रहे हैं
select-file-review = समीक्षा के लिए फ़ाइल चुनें
done-reviewing-pkg = {$pkg} की समीक्षा पूरी हुई
review = {$pkg} की समीक्षा?

# operations::aur_install::aur_download
all-sources-ready = सभी स्रोत तैयार हैं।

# interact::theme
no-selections = कोई चयन नहीं

# operations::aur_install::repo_dependency_installation
installing-repo-deps = रिपॉज निर्भरताएं इंस्टॉल कर रहे हैं

# operations::aur_install::aur_dependency_installation
installing-from-aur = AUR से {$amountOfPkgs} इंस्टॉल कर रहे हैं

# operations::aur_install::make_dependency_removal
remove-installed-make-deps = क्या आप स्थापित मेक निर्भरताएं हटाना चाहते हैं?
done = हो गया!

# operations::aur_install
aur-rpc-crash = AUR RPC कॉल विफल हुआ: {$error}
failed-to-build = निर्माण में विफल
makepkg-failed = makepkg विफल हुआ
unknown-error = अज्ञात त्रुटि
package-does-not-exist = पैकेज {$package} मौजूद नहीं, छोड़ रहे हैं...

# internal::error
non-zero-exit = गैर-शून्य कोड के साथ बाहर निकला
build-step-violation = AUR बिल्ड ने बिल्ड स्टेप का उल्लंघन किया
build-error = पैकेज निर्माण विफल
user-cancel = उपयोगकर्ता द्वारा रद्द किया गया
makepkg-err = makepkg चलाने में विफल
error-occurred = एक त्रुटि हुई

# internal::detect
sudo-prompt-failed = sudo प्रांप्ट विफल
scanning-pacnew-files = pacnew फ़ाइलों के लिए स्कैन कर रहे हैं
no-pacnew-found = कोई .pacnew फ़ाइल नहीं मिली
pacnew-found = pacnew फ़ाइलें मिलीं
pacnew-warning =
    ऐसा लगता है कि कम से कम एक प्रोग्राम जिसे आपने इंस्टॉल या अपग्रेड किया है, ने .pacnew कॉन्फ़िग फ़ाइल इंस्टॉल की है।
    ये तब बनती हैं जब आपने किसी प्रोग्राम की कॉन्फ़िगरेशन को संशोधित किया हो, और पैकेज अपग्रेड नए फ़ाइल को स्वचालित रूप से मर्ज नहीं कर पाया हो।
    आप इन फ़ाइलों से निपटने के लिए चला सकते हैं
run-pacdiff-now = क्या आप अभी pacdiff चलाना चाहते हैं?
pacdiff-warning =
    Pacdiff डिफ़ॉल्ट रूप से फ़ाइलों को मर्ज करने के लिए vimdiff का उपयोग करता है। आप माउस से उन पेन पर फोकस कर सकते हैं और स्क्रॉल कर सकते हैं। vimdiff से बाहर निकलने के लिए, निम्न कुंजी संयोजन दबाएं: ESC, :qa!, ENTER
    आप भविष्य में इस चेतावनी को ~/.config/epsi/config.toml में `pacdiff_warn` को "false" सेट करके दबा सकते हैं

# internal::paging
quit = बाहर निकलें
search-paging = खोज
next-result = अगला परिणाम
previous-result = पिछला परिणाम

# --help
verbose = विवरण स्तर सेट करें
no-confirm = उपयोगकर्ता से पूछे बिना पूरा ऑपरेशन करें
quiet = कुछ कमांड्स का आउटपुट कम करें (सिर्फ clean, upgrade, और install समर्थित)
sudoloop = लंबे निर्माण के दौरान sudo को बैकग्राउंड में लूप करें ताकि टाइमआउट न हो
cachedir = निर्दिष्ट ऑपरेशन के लिए कस्टम AUR क्लोन और बिल्ड निर्देशिका सेट करें
install = AUR या Pacman-परिभाषित रिपॉज में पैकेज इंस्टॉल या खोजें
remove = पहले से इंस्टॉल किए गए पैकेज हटाएं
search = पैकेज खोजें [उपनाम: -Ss]
query = स्थापित पैकेज सूचीबद्ध करें
upgrade = स्थानीय पैकेज अपग्रेड करें (डिफ़ॉल्ट)
gencomp = समर्थित शेल के लिए कंप्लीशन्स जनरेट करें (bash, fish, elvish, pwsh)
clean = सभी अनाथ पैकेज हटाएं
checkupdates = उपलब्ध पैकेज अपडेट जांचें
diff = pacdiff चलाएं
sync = पैकेज डेटाबेस सिंक करें
install-packages = इंस्टॉल या खोजने के लिए पैकेज का नाम
install-aur = केवल AUR पैकेज पर ऑपरेट करें
install-repo = केवल रिपॉज पैकेज पर ऑपरेट करें
install-search = पैकेज खोजने के लिए पैटर्न दें, इंस्टॉल करने के बजाय
install-by = किसी विशेष फील्ड द्वारा खोजें
remove-packages = हटाने के लिए पैकेज का नाम
query-aur = AUR/फॉरेन पैकेज सूचीबद्ध करें [-Qa, -Qm]
query-repo = रिपॉज/नेटिव पैकेज सूचीबद्ध करें [-Qr, -Qn]
query-explicit = स्पष्ट रूप से इंस्टॉल किए गए पैकेज सूचीबद्ध करें [-Qe]
query-info = किसी विशेष पैकेज की जानकारी लें
query-owns = किसी फाइल का मालिक कौन है जानकारी लें
upgrade-repo = केवल रिपॉज/नेटिव पैकेज अपग्रेड करें
upgrade-aur = केवल AUR से अपग्रेड करें
gencomp-shell = कंप्लीशन्स जनरेट करने के लिए शेल (bash, fish, elvish, pwsh, fig)
description = तेज़ और प्रभावी AUR हेल्पर
