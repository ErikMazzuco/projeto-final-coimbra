# PROJETO FINAL EM FLUTTER

Este projeto foi desenvolvido para a disciplina de **Dispositivos Móveis** com o objetivo de demonstrar o conhecimento final na matéria!

## 🎯 Objetivos

1. botão flutuante `ok`
2. Fontes Personalizadas `ok`
3. Drawer(Menu lateral) `ok`
4. Appbar(Botoes inferiores de navegação) `ok`
5. Animações `ok`
6. Splash screan `ok`
7. Tema escuro e uso do THEMES `ok`
8. Tela de Login `OK`
9. Banco de dados local e Nuvem(SUPABASE) `ok LOCAL`  ⚠️
10. Uso do FVM ⚠️
11. Recurso de Acesibilidade `OK`
12. Flavor `ok`
13. GitPod `ok`

    
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
lib/
├── app.dart                          # Configuração geral do app
├── main_free.dart                    # Ponto de entrada para a versão gratuita do app
├── main_premium.dart                 # Ponto de entrada para a versão premium do app

├── helpers/                          # Funções utilitárias e serviços auxiliares
│   └── database_helper.dart          # Classe responsável por gerenciar o banco de dados local (SQFLite)

├── models/                           # Modelos de dados usados no app
│   └── flavor_config.dart            # Define o tipo de flavor (ex: free ou premium) e configurações associadas

├── pages/                            # Telas principais do app
│   ├── cadastro_page.dart            # Tela de cadastro de usuário
│   ├── home_page.dart                # Tela inicial após login
│   ├── login_page.dart               # Tela de login com autenticação
│   └── splash_screen.dart            # Tela de splash inicial (aparece enquanto o app carrega)

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
- **LUIZ FELIPE BASTIÃO**: Desenvolvimento do projeto.
- **YASMIN YAMAMOTO**: Desenvolvimento do projeto.
