# PROJETO FINAL EM FLUTTER

Este projeto foi desenvolvido para a disciplina de **Dispositivos Móveis** com o objetivo de demonstrar o conhecimento final na matéria!

## 🎯 Objetivos

1. botão flutuante `ok`
2. Fontes Personalizadas
3. Drawer(Menu lateral) `ok`
4. Appbar(Botoes inferiores de navegação) `ok`
5. Animações
6. Splash screan
7. Tema escuro e uso do THEMES `ok`
8. Tela de Login `PROXIMO`
9. Banco de dados local e Nuvem(SUPABASE)`PROXIMO`
10. Uso do FVM
11. Recurso de Acesibilidade
12. Flavor `ok`

## 🧠 Funcionalidades

- ⚠️ Implementar o Gitpod.
- 🔁 Animação suave com `AnimatedBuilder` e `Transform.translate`.
- 📱 Layout responsivo e organizado.
- 🧼 Separação entre lógica e interface com arquitetura modular.
- 🎲 Banco de dados.
## 📜 Prototipação

  ///imagens aqui

## 📦 Estrutura do Projeto
```
lib/   EXEMPLO TEMOS QUE CRIAR
├── animations/
│   └── spring_controller.dart        # Lógica de animação isolada
├── core/                             # Arquivos de configuração e utilitários
│   ├── themes.dart                   # Definições de temas (cores, fontes)
│   └── routes.dart                   # Definições de rotas
├── models/                           # Modelos de dados usados no app
├── modules/                          # Módulos principais do app (organizados por funcionalidade)
│   ├── home/                         # Tela inicial e lógica da home
│   └── splash/                       # Tela de splash e inicialização
│       ├── splash_controller.dart    # Tela de Carregamento
│       └── splash_screen.dart        # Tela de Carregamento
└── widgets/                          # Widgets reutilizáveis em várias partes do app
│       ├── animated_product_card.dart# Card com animação de mola
│       ├── drawer_widget.dart        # Barra lateral
│       └── appbar_widget.dart        # App bar com carrinho de venda

├── main.dart                         # Ponto de entrada do aplicativo
```

### ▶️ Executar via Web (Gitpod)

Abra o projeto direto no navegador usando o Gitpod:  
[![Abrir no Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/ErikMazzuco/projeto-final-coimbra)  
⚠️ **Requer Flutter Web. Ideal para testes rápidos e leitura do código.**

---

### 💻 Executar Localmente

Siga os passos abaixo para rodar o app na sua máquina:

1. **Clone este repositório:**

   ```bash
   git clone https://github.com/ErikMazzuco/projeto-final-coimbra.git
   cd projeto-final-coimbra
   ```

2. **Instale o Flutter**:
    Caso ainda não tenha o Flutter instalado, siga as instruções no site oficial: [Instalação do Flutter](https://flutter.dev/docs/get-started/install)

3. **Instale as dependências** do projeto:
    Navegue até a pasta do projeto no terminal e execute:
    ```bash
    flutter pub get
    ```

4. **Execute o aplicativo**:
    Para rodar o aplicativo, execute o seguinte comando no terminal:
    ```bash
    flutter run
    ```

## Funcionabilidades Implementadas

^^^^Preencher^^^^
^^^^^^^^^^^^^^^^^
|||||||||||||||||

## Créditos
- **Flutter**: Framework utilizado para o desenvolvimento do aplicativo.

- **Erik Matheus Mazzuco**: Desenvolvimento do projeto.
- **LUIS FELIPE BASTIÃO**: Desenvolvimento do projeto.
- **YASMIN YAMAMOTO**: Desenvolvimento do projeto.