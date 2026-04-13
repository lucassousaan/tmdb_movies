# TMDB Movies App

Aplicativo de listagem e busca de filmes desenvolvido em Flutter, consumindo a API do [TMDB](https://www.themoviedb.org/).

O projeto foi construído com foco em **Arquitetura Limpa (Clean Architecture)**, escalabilidade, tratamento de erros robusto e cobertura de testes.

## Funcionalidades

- **Home:** Exibição de filmes categorizados (Populares, Melhores Avaliados, Em Alta, Em Breve).
- **Busca:** Pesquisa de filmes com debounce integrado.
- **Detalhes:** Tela de detalhes com imagem de backdrop, sinopse, nota e data de lançamento.
- **Resiliência:** Tratamento de erros de conexão, falhas de servidor e mecanismo de retry.
- **Tema:** Suporte a tema claro e escuro (seguindo o sistema).

## Pré-requisitos

- [Flutter](https://docs.flutter.dev/get-started/install) SDK ^3.10.7
- Uma chave de API do TMDB ([obter aqui](https://www.themoviedb.org/settings/api))

## Como rodar o projeto

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/lucassousaan/tmdb_movies.git
   cd tmdb_movies
   ```

2. **Configure as variáveis de ambiente:**

   ```bash
   cp .env.example .env
   ```

   Edite o arquivo `.env` e insira sua chave de API do TMDB:

   ```
   TMDB_API_KEY=sua_chave_aqui
   BASE_URL=https://api.themoviedb.org/3
   ```

3. **Instale as dependências:**

   ```bash
   flutter pub get
   ```

4. **Gere os arquivos de código (Freezed, JSON, Retrofit, Injectable):**

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **Execute o app:**

   ```bash
   flutter run
   ```

## Tecnologias & Arquitetura

O projeto segue os princípios do **Clean Architecture**, dividido em camadas:

- **Presentation:** BLoC/Cubit (Gerenciamento de Estado), Pages e Widgets.
- **Domain:** UseCases, Entities e Repositories (Interfaces).
- **Data:** DataSources (Retrofit), Models e Implementações de Repositório.
- **Core:** Injeção de Dependência, Utilitários e Configurações de Rede.
- **Shared:** Entities, Models e Widgets reutilizáveis entre features.

### Bibliotecas Principais

| Biblioteca | Função |
|---|---|
| `flutter_bloc` | Gerenciamento de Estado (BLoC/Cubit) |
| `get_it` + `injectable` | Injeção de Dependência |
| `dio` + `retrofit` | Cliente HTTP e geração de API |
| `fpdart` | Programação Funcional (`Either` para erros) |
| `freezed` + `json_serializable` | Imutabilidade e serialização |
| `cached_network_image` | Cache de imagens |
| `go_router` | Navegação declarativa |
| `rxdart` | Extensões reativas (debounce na busca) |
| `shimmer` | Animações de carregamento |

## Estrutura do Projeto

```
lib/
├── main.dart
├── core/
│   ├── di/                    # Injeção de Dependência (GetIt + Injectable)
│   ├── failures/              # Classes de Falha (Server, Connection, Unknown)
│   ├── network/               # Configuração do Dio, Interceptors, SafeApiCall
│   ├── router/                # Configuração de rotas (GoRouter)
│   ├── theme/                 # Tema Material 3
│   ├── usecase/               # Classe base UseCase
│   └── utils/                 # Extensões e helpers
├── features/
│   ├── movies/                # Feature de listagem de filmes
│   │   ├── data/              # DataSource (Retrofit) e Repository Impl
│   │   ├── domain/            # Repository Interface e UseCases
│   │   └── presentation/      # Cubit, Pages e Widgets
│   └── search/                # Feature de busca
│       ├── data/              # DataSource (Retrofit) e Repository Impl
│       ├── domain/            # Repository Interface e UseCase
│       └── presentation/      # BLoC, Pages
└── shared/
    ├── data/models/           # DTOs (MovieModel, MovieResponse)
    ├── domain/entities/       # Entidade Movie
    └── widgets/               # Widgets reutilizáveis (MovieCard)
```

## Testes

O projeto possui cobertura de testes em todas as camadas da arquitetura:

- **Testes Unitários:** Core (network, utils), Repositories, UseCases e BLoCs/Cubits.
- **Testes de Widget:** Páginas (Movies, Search, Details) e componentes (MovieCard, MoviesListSection).

### Como rodar os testes

```bash
# Rodar todos os testes
flutter test

# Rodar com cobertura
flutter test --coverage
```

## Geração de Código

O projeto utiliza `build_runner` para gerar código automaticamente. Após alterar arquivos anotados com `@freezed`, `@JsonSerializable`, `@RestApi` ou `@injectable`, execute:

```bash
# Gerar uma vez
dart run build_runner build --delete-conflicting-outputs

# Modo watch (gera automaticamente ao salvar)
dart run build_runner watch --delete-conflicting-outputs
```
