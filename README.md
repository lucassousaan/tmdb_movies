# TMDB Movies App

Aplicativo de listagem e busca de filmes desenvolvido em Flutter, consumindo a API do TMDB.

O projeto foi construído com foco em **Arquitetura Limpa (Clean Architecture)**, escalabilidade, tratamento de erros robusto e cobertura de testes.

## Funcionalidades

- **Home:** Exibição de filmes categorizados (Populares, Melhores Avaliados, Em Alta, Em Breve).
- **Busca:** Pesquisa de filmes.
- **Resiliência:** Tratamento de erros de conexão e falhas de servidor.

## Tecnologias & Arquitetura

O projeto segue os princípios do **Clean Architecture**, dividido em camadas:

- **Presentation:** BLoC (Gerenciamento de Estado), Pages e Widgets.
- **Domain:** UseCases, Entities e Repositories (Interfaces).
- **Data:** DataSources (Retrofit), Models e Implementações de Repositório.
- **Core:** Injeção de Dependência, Utilitários e Configurações de Rede.

### Bibliotecas Principais

- **Gerenciamento de Estado:** `flutter_bloc`
- **Injeção de Dependência:** `get_it` + `injectable`
- **Network:** `dio` + `retrofit`
- **Programação Funcional:** `fpdart` (Tratamento de erros com `Either`)
- **Imagens:** `cached_network_image`
- **Navegação:** `go_router`

## Testes

O projeto possui alta cobertura de testes, garantindo a confiabilidade do código:

- **Testes Unitários:** Cobrindo Core, Repositories, UseCases e Blocs.
- **Testes de Widget:** Verificação de renderização de componentes e páginas (Movies, Search, MovieCard).

### Como rodar os testes

```bash
# Rodar todos os testes
flutter test
```
