import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio de Carlos Batista',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 50),
                  const CircleAvatar(
                    radius: 90,
                    backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/51524347?v=4',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Carlos Batista',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 5),
                  const SocialLinksView(),
                  const SizedBox(height: 20),
                  Text(
                    'Desenvolvedor Mobile.\nEm formação de CTO na strawti.com',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: width,
                    height: 600,
                    child: DefaultTabController(
                      initialIndex: 2,
                      length: 3,
                      child: Scaffold(
                        appBar: AppBar(
                          toolbarHeight: 5,
                          elevation: 0.0,
                          centerTitle: true,
                          bottom: const TabBar(
                            indicatorColor: Colors.grey,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Tab(text: 'Habilidades'),
                              Tab(text: 'Sobre'),
                              Tab(text: 'Experiência'),
                            ],
                          ),
                          backgroundColor: Colors.black87,
                        ),
                        body: TabBarView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Column(
                              children: const [
                                SizedBox(height: 20),
                                SkilWidget(
                                  title: 'Dart',
                                  imagePath:
                                      'https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png',
                                  percent: 85,
                                ),
                                SizedBox(height: 20),
                                SkilWidget(
                                  title: 'Flutter',
                                  imagePath:
                                      'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_1080,q_100,w_1080/v1/gcs/platform-data-dsc/events/flutter-icon.png',
                                  percent: 90,
                                ),
                                SizedBox(height: 20),
                                SkilWidget(
                                  title: 'Python',
                                  imagePath:
                                      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/2048px-Python-logo-notext.svg.png',
                                  percent: 50,
                                ),
                                SizedBox(height: 20),
                                SkilWidget(
                                  title: 'Firebase',
                                  imagePath:
                                      'https://cdn4.iconfinder.com/data/icons/google-i-o-2016/512/google_firebase-2-512.png',
                                  percent: 67,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Minimalista, Natural de São Paulo, Itaquera. Nascido em 2002',
                                  ),
                                  Text(
                                    'Eu gosto de pensar, e a programação exige isso de mim, logo esta característica é bem aproveitada.'
                                    '\n\nSou cristão protestante, evangélico, estou estudando Teologia, Musica e aprendendo a tocar guitarra.'
                                    '\n\nSou o tipo de desenvolvedor que gosta de utilizar boas práticas de programação, escrever códigos de fácil entendimento e de fácil manutenção.'
                                    '\n\nA tecnologia atual que estou me aperfeiçoando é o Flutter com a linguagem Dart como base, sou desenvolvedor de aplicações para dispositivos portáteis, como o celular.'
                                    'Mas não me limito apenas ao Flutter, estou querendo me aprofundar mais, logo, o Kotlin e o Swift estão na minha lista de habilidades a serem incluídas.'
                                    '\n\nSe você quer um desenvolvedor que mande a real em relação a qualidade de código, que desenvolve pensando no futuro e aplicando as melhores práticas,'
                                    'eu sou a pessoa ideal para o seu projeto! '
                                    'Eu não só desenvolvo o seu programa, mas também dou sugestões, mostro outros caminhos e assim conseguimos chegar rapidamente em algum lugar!',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: const [
                                  ExperienceWidget(
                                    title: 'Um app de hotel',
                                    description:
                                        'Desenvolvimento de algumas telas para um app. Foi um dos meus primeiros Freelas',
                                  ),
                                  SizedBox(height: 20),
                                  ExperienceWidget(
                                    title: 'Desapego Amigo',
                                    description:
                                        'Desenvolvimento de um alguns modulos e suporte',
                                  ),
                                  SizedBox(height: 20),
                                  ExperienceWidget(
                                    title: 'Mediclog',
                                    description:
                                        'Desenvolvimento de um alguns modulos, refatoração e suporte',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SocialLinksView extends StatelessWidget {
  const SocialLinksView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Tooltip(
          message: 'Meu e-mail para contato',
          child: IconButton(
            icon: const Icon(Icons.email),
            onPressed: () {
              launchUrl(Uri.parse('mailto:carlos@strawti.com'));
            },
          ),
        ),
        Tooltip(
          message: 'Meu perfil no Instagram',
          child: IconButton(
            icon: const Icon(FontAwesomeIcons.instagram),
            onPressed: () {
              launchUrl(Uri.parse(
                'https://www.instagram.com/carlosbatista.dev/',
              ));
            },
          ),
        ),
        Tooltip(
          message: 'Meu perfil no Facebook',
          child: IconButton(
            icon: const Icon(FontAwesomeIcons.facebook),
            onPressed: () {
              launchUrl(Uri.parse(
                'https://www.facebook.com/carlosbatistadev/',
              ));
            },
          ),
        ),
        Tooltip(
          message: 'Meu perfil no LinkedIn',
          child: IconButton(
            icon: const Icon(FontAwesomeIcons.linkedin),
            onPressed: () {
              launchUrl(Uri.parse(
                'https://br.linkedin.com/in/carlosbatistadev',
              ));
            },
          ),
        ),
        Tooltip(
          message: 'Meu perfil no GitHub',
          child: IconButton(
            icon: const Icon(FontAwesomeIcons.github),
            onPressed: () {
              launchUrl(Uri.parse(
                'https://github.com/carlosbatistadev',
              ));
            },
          ),
        ),
        Tooltip(
          message: 'Meu perfil no Whatsapp',
          child: IconButton(
            icon: const Icon(FontAwesomeIcons.whatsapp),
            onPressed: () {
              launchUrl(Uri.parse(
                'https://api.whatsapp.com/send?phone=5583991178429&text=Ol%C3%A1.%20Estava%20vendo%20o%20seu%20portif%C3%B3lio.%20',
              ));
            },
          ),
        ),
      ],
    );
  }
}

class SkilWidget extends StatelessWidget {
  final String imagePath;
  final double percent;
  final String? tooltip;
  final String title;

  const SkilWidget({
    Key? key,
    required this.imagePath,
    required this.percent,
    this.tooltip = 'Nível de conhecimento, tendo como 0% nada, e 100% muito',
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          imagePath,
          width: 20,
          height: 20,
        ),
        const SizedBox(width: 10),
        Text(title),
        Tooltip(
          message: tooltip,
          child: Slider(
            value: percent,
            onChanged: null,
            min: 0,
            max: 100,
          ),
        ),
        Text('$percent%'),
      ],
    );
  }
}

class ExperienceWidget extends StatelessWidget {
  final String title;
  final String description;
  final String? projectLink;
  final String? company;
  final String? companyLink;

  const ExperienceWidget({
    Key? key,
    required this.title,
    required this.description,
    this.projectLink,
    this.company,
    this.companyLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
    );
  }
}
