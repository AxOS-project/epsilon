# used across files
exiting = বন্ধ করা হচ্ছে
packages = { $pkgNum ->
    [one] প্যাকেজ
    *[other] প্যাকেজ
}
missing-deps = অনুপস্থিত নির্ভরতা
continue = চালিয়ে যাবেন?

# main
run-as-root = রুট হিসেবে এপসিলন চালানো অনুমোদিত নয় কারণ এটি সিস্টেমের ক্ষতি করতে পারে। পরিবর্তে, যখন সুপারইউজার অনুমতির প্রয়োজন হবে তখন এপসিলন আপনাকে প্রম্পট করবে।
following-packages = নিম্নলিখিত প্যাকেজগুলি এ.ইউ.আর. (AUR)-এ পাওয়া গেছে:
aur-warning =
    এ.ইউ.আর. হলো ব্যবহারকারী-কর্তৃক জমা দেওয়া প্যাকেজ/স্ক্রিপ্ট-এর একটি উৎস এবং এটি সবসময় ব্যবহার করা নিরাপদ নয়।
    ইনস্টল করার আগে এ.ইউ.আর. থেকে ডাউনলোড করা যেকোনো কিছু-এর পি.কে.জি.বিল্ড (PKGBUILD) রিভিউ করে নিন, কারণ কিছু পি.কে.জি.বিল্ড সম্ভাব্য দূষিত হতে পারে।
    এই সতর্কতাটি কনফিগারেশন ফাইলে টগল করা যেতে পারে।
are-you-sure = আপনি কি নিশ্চিত যে আপনি চালিয়ে যেতে চান?
uninstalling-packages = প্যাকেজ আনইনস্টল করা হচ্ছে: {$packages}
system-upgrade = সিস্টেম আপগ্রেড করা হচ্ছে
removing-orphans = অরফান (অনাথ) প্যাকেজ সরানো হচ্ছে
couldnt-find-packages = সংগ্রহস্থল বা এ.ইউ.আর. (AUR)-এ প্যাকেজ খুঁজে পাওয়া যায়নি: {$packages}
searching-repos = সংগ্রহস্থলে {$query} অনুসন্ধান করা হচ্ছে
searching-aur = এ.ইউ.আর. (AUR)-এ {$query} অনুসন্ধান করা হচ্ছে
no-results = কোনো ফলাফল পাওয়া যায়নি
results = ফলাফল:
installed-repo-packages = ইনস্টল করা সংগ্রহস্থল প্যাকেজ:
installed-aur-packages = ইনস্টল করা এ.ইউ.আর. (AUR) প্যাকেজ:
installed-packages = ইনস্টল করা প্যাকেজ:
invalid-shell = অবৈধ শেল, {$shell}
zsh-error = ক্ল্যাপ_কমপ্লিশন (clap_completion) ক্রেইটে একটি ত্রুটির কারণে জেড.এস.এইচ. (Zsh) শেল কমপ্লিশন বর্তমানে অসমর্থিত

# operations::clean
no-orphans = কোনো অরফান (অনাথ) প্যাকেজ পাওয়া যায়নি
removing-orphans-would = অরফান (অনাথ) সরালে নিম্নলিখিত প্যাকেজগুলি আনইনস্টল হয়ে যাবে:{$packages}
failed-remove-orphans = অরফান (অনাথ) সরাতে ব্যর্থ হয়েছে
success-remove-orphans = সফলভাবে অরফান (অনাথ) সরানো হয়েছে
clear-pkgbuild-cache = এপসিলন-এর অভ্যন্তরীণ পি.কে.জি.বিল্ড ক্যাশে পরিষ্কার করবেন?
clear-pacman-cache = প্যাকম্যান-এর প্যাকেজ ক্যাশেও পরিষ্কার করবেন?
failed-clear-cache = প্যাকেজ ক্যাশে পরিষ্কার করতে ব্যর্থ হয়েছে, {$error}
success-clear-cache = সফলভাবে প্যাকেজ ক্যাশে পরিষ্কার করা হয়েছে

# operations::install
installing-packages-from-repos = সংগ্রহস্থল থেকে প্যাকেজ ইনস্টল করা হচ্ছে {$packages}
error-install = প্যাকেজ ইনস্টল করার সময় একটি ত্রুটি ঘটেছে: {$error}, বাতিল করা হচ্ছে

# operations::search
out-of-date = পুরোনো: since~থেকে
installed = ইনস্টল করা হয়েছে

# operations::uninstall
failed-remove-pkgs = প্যাকেজ সরাতে ব্যর্থ হয়েছে

# operations::sync
syncing-databases = ডেটাবেস সিঙ্ক করা হচ্ছে
error-syncing-databases = ডেটাবেস সিঙ্ক করার সময় একটি ত্রুটি ঘটেছে: {$error}
success-syncing-databases = সফলভাবে ডেটাবেস সিঙ্ক করা হয়েছে

# operations::upgrade
failed-upgrade-repo-pkgs = সংগ্রহস্থল প্যাকেজ আপগ্রেড করতে ব্যর্থ হয়েছে
success-upgrade-repo-pkgs = সফলভাবে সংগ্রহস্থল প্যাকেজ আপগ্রেড করা হয়েছে
couldnt-find-remote-pkg = {$pkg}-এর জন্য রিমোট প্যাকেজ খুঁজে পাওয়া যায়নি
no-upgrades-aur-package = ইনস্টল করা এ.ইউ.আর. (AUR) প্যাকেজ-এর জন্য কোনো আপগ্রেড উপলব্ধ নেই
scanning-for-pacnew = আপগ্রেডের পরে .প্যাকনিউ (.pacnew) ফাইলগুলির জন্য স্ক্যান করা হচ্ছে
aur-check-upgrades = এ.ইউ.আর. প্যাকেজ আপগ্রেডগুলির জন্য পরীক্ষা করা হচ্ছে
select-pkgs-upgrade = কোন এ.ইউ.আর. প্যাকেজগুলি আপগ্রেড করতে চান তা নির্বাচন করুন
snapshot-created-successfully = স্ন্যাপশট সফলভাবে তৈরি হয়েছে।
snapshot-tool-exited-status = স্ন্যাপশট টুল {$status} স্ট্যাটাস সহ এক্সিট হয়েছে
failed-to-run-snapshot-tool = স্ন্যাপশট টুল চালাতে ব্যর্থ হয়েছে: {$error}
timeshift-not-installed = যদি টাইমশিফট ইনস্টল করা না থাকে, তাহলে স্ন্যাপশট তৈরি করতে এটি ইনস্টল করার কথা বিবেচনা করুন!
timeshift-list-nonzero-status = স্ন্যাপশট তালিকা করার সময় টাইমশিফট একটি নন-জিরো এক্সিট কোড ফেরত দিয়েছে: {$error}
failed-to-run-snapshot-list-tool = টাইমশিফট স্ন্যাপশট তালিকা কমান্ড চালাতে ব্যর্থ হয়েছে: {$error}
could-not-parse-snapshot-id = লাইন থেকে স্ন্যাপশট আইডি পার্স করা যায়নি: {$line}
snapshot-removed-successfully = [epsilon] সহ স্ন্যাপশট সফলভাবে সরানো হয়েছে।
snapshot-tool-exited-status = স্ন্যাপশট টুল {$status} স্ট্যাটাস সহ এক্সিট হয়েছে
failed-to-run-snapshot-tool = স্ন্যাপশট টুল চালাতে ব্যর্থ হয়েছে: {$error}
no-epsilon-snapshot-found = [epsilon] সহ কোনো স্ন্যাপশট পাওয়া যায়নি। মোছা (deletion) এড়িয়ে যাওয়া হচ্ছে।

# logging::output
repo-dependencies = সংগ্রহস্থলের নির্ভরতা
aur-dependencies = এ.ইউ.আর. (AUR)-এর নির্ভরতা
repo-make-dependencies = সংগ্রহস্থলের মেক নির্ভরতা
aur-make-dependencies = এ.ইউ.আর. (AUR)-এর মেক নির্ভরতা
repo-check-dependencies = সংগ্রহস্থলের চেক নির্ভরতা
aur-check-dependencies = এ.ইউ.আর. (AUR)-এর চেক নির্ভরতা
version = সংস্করণ
votes = ভোট
capital-installed = ইনস্টল করা হয়েছে

# operations::aur_install::aur_fetch
fetching-pkg-info = প্যাকেজ তথ্য আনা হচ্ছে
couldnt-find-all-pkgs = সমস্ত প্যাকেজ খুঁজে পাওয়া যায়নি
all-pkgs-found = সমস্ত প্যাকেজ পাওয়া গেছে
some-pkgs-already-installed = কিছু প্যাকেজ ইতিমধ্যেই ইনস্টল করা আছে। তবুও চালিয়ে যাবেন?
do-you-want-to-install = আপনি কি এই প্যাকেজ এবং প্যাকেজ নির্ভরতাগুলি ইনস্টল করতে চান?

# operations::aur_install::common
downloading-sources = সোর্স ডাউনলোড করা হচ্ছে
pulling-latest-changes = সর্বশেষ পরিবর্তন আনা হচ্ছে
cloning-aur-repo = এ.ইউ.আর. (AUR) সংগ্রহস্থল ক্লোনিং করা হচ্ছে
down-and-ext-files = ফাইল ডাউনলোড এবং এক্সট্র্যাক্ট করা হচ্ছে
downloaded = ডাউনলোড করা হয়েছে!
dependency-cycle = নির্ভরতা চক্র সনাক্ত করা হয়েছে। ইনস্টলেশন বাতিল করা হচ্ছে।
building-packages = প্যাকেজগুলি বিল্ড করা হচ্ছে
built = বিল্ড করা হয়েছে
installing-packages = প্যাকেজগুলি ইনস্টল করা হচ্ছে
building-package = প্যাকেজ বিল্ড করা হচ্ছে
build-failed = বিল্ড ব্যর্থ হয়েছে!
couldnt-find-pkg-produced = তৈরি করা প্যাকেজ-এর মধ্যে {$pkg} খুঁজে পাওয়া যায়নি
review-build-log = আপনি কি বিল্ড লগ রিভিউ করতে চান?

# operations::aur_install::aur_review
select-pkgs-review = রিভিউ করার জন্য প্যাকেজ নির্বাচন করুন
do-you-still-want-to-install = আপনি কি এখনো সেই প্যাকেজগুলি ইনস্টল করতে চান?
reviewing = রিভিউ করা হচ্ছে
select-file-review = রিভিউ করার জন্য একটি ফাইল নির্বাচন করুন
done-reviewing-pkg = {$pkg} রিভিউ করা সম্পন্ন হয়েছে
review = {$pkg} রিভিউ করবেন?

# operations::aur_install::aur_download
all-sources-ready = সমস্ত সোর্স প্রস্তুত।

# interact::theme
no-selections = কোনো নির্বাচন নেই

# operations::aur_install::repo_dependency_installation
installing-repo-deps = সংগ্রহস্থলের নির্ভরতা ইনস্টল করা হচ্ছে

# operations::aur_install::aur_dependency_installation
installing-from-aur = এ.ইউ.আর. থেকে {$amountOfPkgs} ইনস্টল করা হচ্ছে

# operations::aur_install::make_dependency_removal
remove-installed-make-deps = আপনি কি ইনস্টল করা তৈরী নির্ভরতাগুলি সরাতে চান?
done = সম্পন্ন!

# operations::aur_install
aur-rpc-crash = এ.ইউ.আর. (AUR) আর.পি.সি. (RPC) কল ব্যর্থ হয়েছে: {$error}
failed-to-build = বিল্ড করতে ব্যর্থ হয়েছে
makepkg-failed = মেকেপিকেজি (makepkg) ব্যর্থ হয়েছে
unknown-error = অজানা ত্রুটি
package-does-not-exist = প্যাকেজ {$package} বিদ্যমান নেই, এড়িয়ে যাওয়া হচ্ছে...

# internal::error
non-zero-exit = নন-জিরো কোড সহ এক্সিট হয়েছে
build-step-violation = এ.ইউ.আর. (AUR) বিল্ড, বিল্ডের নিয়ম লঙ্ঘন করেছে
build-error = প্যাকেজ বিল্ড করতে ব্যর্থ হয়েছে
user-cancel = ব্যবহারকারী দ্বারা বাতিল করা হয়েছে
makepkg-err = মেকেপিকেজি (makepkg) চালাতে ব্যর্থ হয়েছে
error-occurred = একটি ত্রুটি ঘটেছে

# internal::detect
sudo-prompt-failed = সুডো প্রম্পট ব্যর্থ হয়েছে
scanning-pacnew-files = প্যাকনিউ (pacnew) ফাইলগুলির জন্য স্ক্যান করা হচ্ছে
no-pacnew-found = কোনো .প্যাকনিউ (.pacnew) ফাইল পাওয়া যায়নি
pacnew-found = প্যাকনিউ (.pacnew) ফাইল পাওয়া গেছে
pacnew-warning =
    মনে হচ্ছে আপনার ইনস্টল / আপগ্রেড করা অন্তত একটি প্রোগ্রাম একটি .প্যাকনিউ (.pacnew) কনফিগারেশন ফাইল ইনস্টল করেছে।
    আপনি যখন কোনো প্রোগ্রামের কনফিগারেশন পরিবর্তন করেন, তখন এগুলি তৈরি হয় এবং প্যাকেজ আপগ্রেড স্বয়ংক্রিয়ভাবে নতুন ফাইলটি মার্জ করতে পারে না।
    আপনি নিম্নলিখিত কমান্ডটি চালিয়ে এই ফাইলগুলি মোকাবেলা করতে পারেন
run-pacdiff-now = আপনি কি এখন প্যাকডিফ (pacdiff) চালাতে চান?
pacdiff-warning =
    প্যাকডিফ ডিফল্টভাবে ফাইলগুলি মার্জ করার জন্য ভিমডিফ (vimdiff) ব্যবহার করে। আপনি মাউস দিয়ে তাদের উপর হোভার করে এবং বাম ক্লিক টিপে পেনগুলি ফোকাস করতে পারেন এবং আপনার মাউসের স্ক্রল হুইল (বা অ্যারো "KEY" কীগুলি) ব্যবহার করে উপরে এবং নিচে স্ক্রল করতে পারেন। ভিমডিফ থেকে বের হতে, নিম্নলিখিত কী-কম্বিনেশন টিপুন: ই.এস.সি. (ESC), :qa!, এন্টার (ENTER)
    আপনি ভবিষ্যতে ~/.config/epsi/config.toml-এ `pacdiff_warn` "false" সেট করে এই সতর্কতাটি দমন করতে পারেন


# internal::paging
quit = প্রস্থান
search-paging = অনুসন্ধান
next-result = পরবর্তী ফলাফল
previous-result = পূর্ববর্তী ফলাফল

# --help
verbose = ভার্বোসিটির স্তর সেট করে
no-confirm = ব্যবহারকারীকে প্রম্পট না করে অপারেশন সম্পূর্ণ করুন
quiet = কিছু কমান্ডের আউটপুট কম করুন (শুধুমাত্র ক্লিন, আপগ্রেড এবং ইনস্টল সমর্থিত)
sudoloop = লম্বা বিল্ডের সময় সুডো যাতে টাইম আউট না হয় তা নিশ্চিত করতে ব্যাকগ্রাউন্ডে সুডো লুপ করে
cachedir = নির্দিষ্ট অপারেশনের জন্য একটি কাস্টম এ.ইউ.আর. ক্লোন এবং বিল্ড ডিরেক্টরি সেট করে
install = এ.ইউ.আর. (AUR) বা প্যাকম্যান-সংজ্ঞায়িত সংগ্রহস্থলগুলিতে একটি প্যাকেজ ইনস্টল বা অনুসন্ধান করে
remove = পূর্বে ইনস্টল করা একটি প্যাকেজ সরিয়ে দেয়
search = এ.ইউ.আর./সংগ্রহস্থলগুলিতে একটি প্রদত্ত প্যাটার্নের সাথে মেলে এমন প্যাকেজগুলির জন্য অনুসন্ধান করে [উপনাম: -Ss]
query = ইনস্টল করা প্যাকেজগুলি ক্যোয়ারী করে
upgrade = স্থানীয়ভাবে ইনস্টল করা প্যাকেজগুলিকে তাদের সর্বশেষ সংস্করণগুলিতে আপগ্রেড করে (ডিফল্ট)
gencomp = সমর্থিত শেলগুলির জন্য শেল কমপ্লিশন তৈরি করে (bash, fish, elvish, pwsh)
clean = সমস্ত অরফান (অনাথ) প্যাকেজ সরিয়ে দেয়
checkupdates = উপলব্ধ প্যাকেজ আপডেটগুলির জন্য ক্যোয়ারী করে এবং ফেরত দেয়
diff = প্যাকডিফ (pacdiff) চালায়
sync = প্যাকেজ ডেটাবেস সিঙ্ক করে
install-packages = ইনস্টল বা অনুসন্ধান করার জন্য প্যাকেজ(গুলির) নাম
install-aur = শুধুমাত্র এ.ইউ.আর. (AUR) প্যাকেজগুলির উপর কাজ করে
install-repo = শুধুমাত্র সংগ্রহস্থলের প্যাকেজগুলির উপর কাজ করে
install-search = ইনস্টল করার পরিবর্তে একটি প্রদত্ত প্যাটার্নের জন্য প্যাকেজ অনুসন্ধান করে
install-by = একটি নির্দিষ্ট ফিল্ড দ্বারা অনুসন্ধান করে
remove-packages = অপসারণের জন্য প্যাকেজ(গুলির) নাম
query-aur = এ.ইউ.আর.(AUR)/বিদেশী(foreign) প্যাকেজগুলি তালিকাভুক্ত করে [-Qa, -Qm]
query-repo = সংগ্রহস্থল(repo)/নেটিভ(native) প্যাকেজগুলি তালিকাভুক্ত করে [-Qr, -Qn]
query-explicit = স্পষ্টভাবে ইনস্টল করা প্যাকেজগুলি তালিকাভুক্ত করে [-Qe]
query-info = একটি নির্দিষ্ট প্যাকেজ সম্পর্কে তথ্য পান
query-owns = কোন প্যাকেজ একটি ফাইলের মালিক সে সম্পর্কে তথ্য পান
upgrade-repo = শুধুমাত্র সংগ্রহস্থল/নেটিভ প্যাকেজ আপগ্রেড করে
upgrade-aur = শুধুমাত্র এ.ইউ.আর. (AUR) থেকে আপগ্রেড করে
gencomp-shell = যে শেলের (shell) জন্য সমাপ্তি (completions) তৈরি করতে হবে (bash, fish, elvish, pwsh, fig)
description = একটি দ্রুত এবং দক্ষ এ.ইউ.আর. (AUR) সাহায্যকারী