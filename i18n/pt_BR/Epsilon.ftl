continue = Continuar?
following-packages = Os seguintes pacotes foram encontrados no AUR:
removing-orphans = Removendo pacotes órfãos
success-remove-orphans = Pacotes órfãos removidos com sucesso
clear-pacman-cache = Também gostaria de limpar o cache de pacotes do Pacman?
are-you-sure = Tem certeza que deseja continuar?
no-results = Sem resultados encontrados
results = Resultados:
searching-aur = Buscando { $query } no AUR
searching-repos = Buscando { $query } nos repositórios
installed-packages = Pacotes Instalados:
system-upgrade = Executando atualização do sistema
couldnt-find-packages = Não foi possível encontrar os pacotes: { $packages } nos repositórios ou no AUR
invalid-shell = Shell inválido, { $shell }
# operations::clean
no-orphans = Nenhum pacote orfão encontrado
failed-remove-orphans = Falha ao remover pacotes órfãos
clear-pkgbuild-cache = Limpar o cache interno PKGBUILD do Epsilon?
failed-clear-cache = Falha ao limpar o cache de pacote, { $error }
installed = instalado
# operations::uninstall
failed-remove-pkgs = Falha ao remover pacotes
# operations::upgrade
failed-upgrade-repo-pkgs = Falha ao atualizar os repositórios
# main
run-as-root = Executar Epsilon como root não é permitido pois pode acarretar em falhas no sistema. Ao invés disso, Epsilon irá pedir quando necessitar de permissões de superusuário.
# used across files
exiting = Saindo
missing-deps = Dependências faltando
uninstalling-packages = Desinstalando pacotes: { $packages }
installed-repo-packages = Pacotes Repo instalados:
installed-aur-packages = Pacotes instalados do AUR:
zsh-error = Completações do shell Zsh não é suportada atualmente devido a um bug no clap_completion
removing-orphans-would =
    Remover pacotes órfãos removerá os seguintes pacotes:
    { $packages }
success-clear-cache = Cache de pacotes limpo com sucesso
# operations::install
installing-packages-from-repos = Instalado pacotes { $packages } dos repositórios
error-install = Um erro ocorreu ao instalador pacotes: { $error }, encerrando
# operations::search
out-of-date = desatualizado: desde
success-upgrade-repo-pkgs = Pacotes do repositório atualizados com sucesso
couldnt-find-remote-pkg = Não foi possível encontrar pacote remoto para { $pkg }
no-upgrades-aur-package = Não há atualizações para os pacotes do AUR instalados
packages =
    { $pkgNum ->
        [one] pacote
       *[other] pacotes
    }
scanning-for-pacnew = Escaneando para novos arquivos .pacnew após atualização
# logging::output
repo-dependencies = Dependências de repositório
aur-dependencies = Dependências do AUR
repo-make-dependencies = Dependências make do repositório
aur-make-dependencies = Dependências make do AUR
repo-check-dependencies = Conferindo dependências dos repositórios
aur-check-dependencies = Conferindo dependências do AUR
version = versão
votes = votos
# operations::aur_install::aur_fetch
fetching-pkg-info = Obtendo informações do pacote
couldnt-find-all-pkgs = Não foi possível encontrar todos os pacotes
all-pkgs-found = Todos os pacotes encontrados
do-you-want-to-install = Você quer instalar estes pacotes e suas dependências?
# operations::aur_install::common
downloading-sources = Baixando fontes
pulling-latest-changes = Obtendo mudanças recentes
cloning-aur-repo = Clonando repositório aur
down-and-ext-files = Baixando e extraindo arquivos
downloaded = Baixou!
building-packages = Construindo pacotes
built = Construído
installing-packages = Instalando pacotes
building-package = Construindo Pacote
build-failed = Construção falhou!
review-build-log = Deseja revisar o log de construção?
# operations::aur_install::aur_review
select-pkgs-review = Selecione os pacotes para revisar
do-you-still-want-to-install = Ainda deseja instalar estes pacotes?
reviewing = Revisando
select-file-review = Selecione um arquivo para revisar
done-reviewing-pkg = Terminou de revisar { $pkg }
review = Revisar { $pkg }?
# interact::theme
no-selections = Não há seleções
# operations::aur_install::repo_dependency_installation
installing-repo-deps = Instalando dependências do repositório
# operations::aur_install::aur_dependency_installation
installing-from-aur = Instalando { $amountOfPkgs } do AUR
done = Terminou!
# operations::aur_install
aur-rpc-crash = AUR RPC Call falhou: { $error }
failed-to-build = Falha ao construir
makepkg-failed = makepkg falhou
unknown-error = Erro desconhecido
# internal::error
non-zero-exit = Encerrado com código de erro non zero
build-step-violation = Construção AUR violou passos de construção
build-error = Falha ao construir pacote
user-cancel = Cancelado pelo usuário
makepkg-err = Falha ao executar makepkg
error-occurred = Um erro ocorreu
# internal::detect
sudo-prompt-failed = Pedido de sudo falhou
scanning-pacnew-files = Escaneando para pacotes pacnew
pacnew-found = Arquivos pacnew encontrados
run-pacdiff-now = Deseja executar pacdiff agora?
# internal::paging
quit = sair
search-paging = buscar
next-result = próximo resultado
previous-result = resultado anterior
# --help
verbose = Define o nível de verbosidade
no-confirm = Completa operação sem perguntar ao usuário
quiet = Faz com que certos comandos tenham menos saída (somente clean, upgrade, e install são suportados)
sudoloop = Repete sudo no background para garantir que ele expire durante construções grandes
cachedir = Define um clone personalizado e diretório de construção para a operação especificada
install = Instala ou busca por um pacote tanto no AUR quanto nos repositórios definidos pelo Pacman
remove = Remove um pacote instalado anteriormente
query = Consulta pacotes instalados
upgrade = Atualiza pacotes instalados localmente para suas versões mais recentes (Padrão)
gencomp = Gera completações para shells suportadas (bash, fish, elvish, pwsh)
clean = Remove todos os pacotes órfãos
diff = Executa pacdiff
install-packages = O nome do(s) pacote(s) para instalar ou buscar
install-aur = Opera somente com pacotes AUR
install-repo = Opera somente com pacotes do repositório
install-search = Busca pacotes para padrão dado invés de instalar
install-by = Busca por um campo específico
query-aur = Lista pacotes AUR/exteros [-Qa, -Qm]
query-repo = Lista pacotes repo/nativos [-Qr, -Qn]
query-explicit = Lista pacotes instalados explicitamente [-Qe]
aur-warning =
    O AUR é um fonte de pacotes enviadas por usuários e nem sempre é segura para o uso.
    Por favor tenha certeza de revisar o PKGBUILD de tudo que baixar do AUR antes de instalar, pois alguns PKGBUILDs podem ser potencialmente maliciosos. 
    Este aviso pode ser alternado no arquivo de configuração.
query-info = Obtém informação de um pacote específico
query-owns = Obtém informação sobre qual pacote é dono de um arquivo
upgrade-repo = Atualiza somente pacotes repo/nativos
upgrade-aur = Atualiza somente pacotes AUR
description = Um helper AUR rápido e eficiente
capital-installed = Instalado
some-pkgs-already-installed = Alguns pacotes já estão instados. Continuar mesmo assim?
dependency-cycle = Ciclo de dependência detectado. Encerrando instalação.
couldnt-find-pkg-produced = Não foi possível encontrar o pacote { $pkg } nos pacotes produzidos
# operations::aur_install::aur_download
all-sources-ready = Todas as fontes estão prontas.
# operations::aur_install::make_dependency_removal
remove-installed-make-deps = Deseja remover as dependências make instaladas?
no-pacnew-found = Não foram encontrados arquivos .pacnew
pacnew-warning =
    Parece que pelo menos um dos programas que você instalou / atualizou também instalou um arquivo de configuração .pacnew.
    Esses são criados quando você modificou a configuração do programa e a atualização de pacote não consegue mesclar automaticamente o novo arquivo.
    Você pode lidar com esses arquivos executando
pacdiff-warning =
    Pacdiff utiliza vimdiff por padrão para editar arquivos para mesclar. Você pode focar os painéis ao passar o mouse sobre eles e pressionando o clique esquerdo, rolar o scroll para cima e para baixo (ou as teclas de seta). Para sair do vimdiff, pressione a combinação de teclas a seguir: ESC, :qa!, ENTER
    Vocẽ pode suprimir este aviso no futuro mudando a configuração `pacdiff_warn` para "false" em ~/.config/epsi/config.toml
checkupdates = Consulta por e retorna atualizações disponíveis de pacotes
remove-packages = O nome do(s) pacote(s) para remover
gencomp-shell = O shell para gerar completações (bash, fish, elvish, pwsh, fig)
