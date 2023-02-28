# Mobile Refact

Projeto dedicado a refatoração do código do aplicativo mobile da Smartpag, aplicando as melhores práticas de programação a partir dos seguintes pacotes: *mobx, **Modular* e, para geração de código, o *slidy*

## Getting started

É sempre importante ter o fluxo de desenvolvimento em mente para começar com o pé direito. Então, depois de ter disponível um dispositivo para depuração (seja um emulador, celular ou máquina), aplicar o `flutter run` no projeto já é suficiente para rodar o projeto. Mas na medida que as alterações forem sendo feitas, algumas coisas precisam ser levadas em consideração.

Fique atento ao alterar um controller ou store pois eles utilizam geração automática de código do `mobx`. Então, separa um terminal para rodar o seguinte comando:

flutter pub run build_runner watch --delete-conflicting-outputs

flutter build apk --release

Caso queira fazer o debugPrint de um json que seja no formato do postman:

> debugPrint("Encoded body $send");


## A main do projeto

---
403938

O arquivo main.dart na raiz da pasta `app` contem a inicialização do projeto, a chamada do AppWidget e do AppModule, bem como a determinação da página inicial e, por padrão, a inicialização das preferências de usuário e todo processo que tem origem anterior à chamada das páginas e terá seu carregamento processado jutamente da Splash page.

## Modular

---

O projeto é dividido em módulos e utiliza a versão 5.0.3 do Modular que é responsável pelo gerenciamento de dependências e pela definição das rotas, basicamente.

Uma dependência é toda aquela informação que foi gerada numa classe, mas que gostaríamos que fosse disponibilizada em outra.
Por exemplo, quando, na página do cardápio, o cliente selecionar 3 produtos e, na página de pagamentos, quisermos ter essa informação. Para isso, poderíamos ir passando essa informação via parâmetro no construtor das páginas até que se chegue à página de pagamento, mas isso torna os construtores muito grandes e cheios de dependências (parâmetros obrigatórios).

O modular é uma forma de simplificar esse processo, de modo que, através dos módulos (quando feita a declaração dos binds), a gente determina as classes que queremos que aquele módulo consiga "lembrar", assim, qualquer página daquele módulo que alterar um campo daquela classe vai alterar no módulo e será possível com o *Modular.get*, pegar a versão mais atualizada dessas informações, não importa a ordem em que as páginas foram chamadas nem a origem da alteração.

Todos os detalhes do poder desse pacote disponíveis na [documentação oficial](https://modular.flutterando.com.br/docs/intro).

# Como trabalhamos com isso?

## Criação de módules

Na prática, a gente declara uma classe que será chamada de módulo, num arquivo de um módulo ( com o nome para aquele módulo, no caso auth) dentro da pasta *módules. Essa classe extende as funcionalidades de **Module* que sugere a implementação de:

- *binds* ( aquilo que o módulo deverá lembrar )
- *routes* (aquelas páginas que o módulo disponibiliza e como acessá-las - ou melhor, o caminho para acessá-las a partir do módulo).

![alt text](./docs/assets/module.png)

Por padrão, a gente utiliza um nome de rota sugerido para o módulo que for implementar o módulo que estamos criando e isso fica na variável estática *route*.

dart
class AuthModule extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => LoginController())];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => const LoginPage(
              title: 'Login',
            ),
        transition: TransitionType.fadeIn),
  ];
  static String route = "/login";
}



## App Module

Um módulo notável da solução é o App Módule, pois ele é o módulo padrão que dará origem à árvore de módulos das solução. Ele é feito no mesmo padrão de módulos acima, mas, em geral, suas rotas serão do tipo ModuleRoute, pois ele tende a ser um módulo de módulos.

## A árvore dos módulos

A árvore de módulo é um objeto gerado ao final do processo definição dos módulos e dos módulos de módulos.

O importante aqui é racionalização intencional do desenho dessas rotas a partir dos módulos em si. Com isso, essa árvora fará sentido no quesito de gerenciamento de dados e segurança. O importante é que faça sentido.

![alt text](./docs/assets/modules-tree.png)

# Um módulo

O nosso projeto é baseado no [Clean Architecture](https://b-ok.lat/book/5457956/accf67) do Uncle Bob e tenta abraçar da melhor forma os guias de boas práticas, além do [SOLID](https://www.topcoder.com/thrive/articles/solid-principles-in-dart#:~:text=The%20term%20SOLID%20is%20an,as%20good%20practices%20to%20follow.).

\*view [Solid with dart](https://medium.flutterdevs.com/s-o-l-i-d-principles-in-dart-e6c0c8d1f8f1)

Assim, a divisão de pastas e o fundamento por trás das decisões de como agrupar os *Modelos, **Algorítimos* e *Estados Gerenciados* por cada módulo tem por finalidade:

- Segregação de responsabilidade
- Autosuficiência e independência de cada módule
- Alta testabilidade
- Extensibilidade (ou, a capacidade de responder a alterações futuras)
- Tolerância a falhas
- Padronização e ubiquidade

Assim, para alcançar cada um desses requisitos, trabalhamos com uma divisão de pastas que procura atender esses tópicos. Vamos a elas:

### Divisão de pastas

## *`models`*

Os modelos são classes anêmicas que implementarão apenas métodos par parse, validação mínima e transformação de objeto dentro do seu escopo ( ex.: toJson e frmoJson ).

Os modelos são os *objetos de valor do negócio. É aqui que a ideia de **ubiquidade* se aplica: os modelos são os nomes e eles devem ser os mesmo utilizado pelo negócio e, mais importante ainda, devem ser os mesmos utilizados pelo `backend`. Ou seja, o model é o domínio que, dentro de um módulo, não depende de niguém, mas que todos dependem dele.

A partir da auto-suficiência do módulo com relação ao seus próprios models (objetos de valor), já damos um primeiro grande passo para o desacoplamento do projeto e redução do número de dependências formadas por cada módulo. Sendo assim adotaremos:

> Um modulo será responsável por declarar todos os models de seu escopo.

- É possível um módulo precisar de models de outro módulo? Por exemplo, o login precisar de um produto? > Sim, é possível. Basta que ele pegue essa informação do módulo que deveria contê-la.
- É possível haver models vindo da pasta shared? Sim, também, basta que seja um model genérico que não se aplique a nenhum escopo do negócio.

Todo mundo depende dos models o model não depende de niguém (que não seja model)!

## *`services`*

Ainda no contexto de ubiquidade, os services são classes que implementarão a conexão com a api. Sendo que tanto o envio como o consumo de informação serão intermediados pelos models.

Na prática será utilizado o Dio para a conexão http numa série de classes dedicadas, cada uma, para um grupo de endpoints. Ou seja, uma rota da api da origem a um arquivo que conterá uma classe que implementará cada verbo daquela rota, respeitando o padrão de conexão com o consumidor do serviço

\\ Esse padrão ainda será definido e deverá ser escrito aqui!

## *`views`*

Aqui serão colocados todos os `Widgets` necessários para fazer o visual e as interações necessárias para esse módulo. *Apenas expecificação visual!!!*.

A view:

- Dependerá dos [`controllers`](./README.md#controller) e tão somente.
- Todos os valores variáveis da View não serão declaradas por ela, mas chamados a partir do seu controller.
- A view pode utilizar apenas o seu controller dedicado a ela.
- Deverá de preocupar unicamente com *visual, **interatividade, **responsibilidade* e informação estática ou variável.
- Terá toda informação que precisa variar sendo disponibilizada pelo *seu controller*.

Não é permitido para a view:

- Gerenciamento de estados (campos e informações variáveis na tela)
- Acessar diretamente
  - Serviços externos
  - Outros controllers
  - Outros stores

O desenho é o seguinte:

![alt text](./docs/assets/controller-dependencies-flow.png)

## *`controllers`*

O controller é responsável pelo gerenciamento de estados da view. No nosso projeto, utilizamos programação reativa através do pacote [mobx](https://mobx.netlify.app/).

Sendo assim, cada controller terá um arquivo .g associado para que sejam feitas as reatividade às alterações.

Um controller poderá chamar quantos `controllers` e [`stores`](./README.md#stores) forem necessários para que seu processamento e estados sejam gerenciados.

Apenas os controllers poderão manipular os dados das [`stores`](./README.md#stores) através das funções deles.

Assim, um controller poderá declarar os stores, mas como variáveis *privadas*!!!!

dart
abstract class _ProductsController with Store {
  final CommandStore _commandStore = Modular.get<CommandStore>();
  final OrderStore _orderStore = Modular.get<OrderStore>();

}


## *`stores`*

Os stores são controllers que não são dedicados a uma determina página, mas se responsabilizam pelo gerenciamento especializado de alguma determinado estado da aplicação. No caso do módulo auth, o authStore é chamado por qualquer outro módulo que precisa do token e do processo de autenticação, de modo que ele não é necessariamente exclusivo para a página de login, sendo asim, o controller de login também o chama.

## *`core`*

Aqui todo o processamento em memory que não é necessário que seja feito dentro de um controller ou de um store e que pode ser reaproveitado, deverá ser escrito. Por exemplo, se for necessário fazer um conta complexa para tirar um extrato ou se quiser contar o número de dias do ano e tivermos ue fazer isso com nosso código, o lugar aonde colocar esse código é aqui.

A ideia é que nossa business logic fique aqui e que ela seja coberta por testes unitários.

# *`view/pages`*

Páginas são Scaffolds delimitadas que ocupam toda a área do dispositivo móvel e estruturam o material design a partir da tela. Páginas são os arquivos para as classes que contém o primeiro nível de agrupamento de widgets.
Além disso, páginas são chamáveis através do processo de empilhamento ou processo de navegação.