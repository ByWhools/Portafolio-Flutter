class Project {
  final String title;
  final String imageUrl;
  final String description;
  final String urlProject;
  final String largerDescription;
  final String github;

  Project(
      {required this.title,
      required this.github,
      required this.largerDescription,
      required this.imageUrl,
      required this.description,
      required this.urlProject});
}

final List<Project> projects = [
  Project(
    github: "",
      largerDescription:
          "Sitio web con recursos, cursos gratuitos de programación y tecnología fundado por Alejandro, Kalid y Aldrich. Ofrece información de calidad sobre Java, Flutter, ciberseguridad, modelado 3D, creación de juegos y diseño, siendo una valiosa fuente de aprendizaje",
      title: "Whools Website",
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/whools-proyect.appspot.com/o/whoolss.webp?alt=media&token=a6cd2c85-3aef-4819-b893-b45f0eb91cbf",
      description:
          "Un equipo que ofrece recursos gratuitos de programación y tecnología, ideal para el aprendizaje.",
      urlProject: "https://whools.web.app/"),
  Project(
    github: "https://github.com/YoungAlely/CityBus",
      largerDescription:
          "Una app de transporte público en México que ofrece ubicaciones en tiempo real, rutas compartidas por la comunidad y alertas de tráfico, mejorando la eficiencia de tus viajes.",
      title: "City Bus",
      imageUrl:
          "https://github.com/YoungAlely/CityBus/blob/main/assets/images/autobuss.png?raw=true",
      description:
          "Una app móvil para rastrear el transporte público en tiempo real y recibir alertas de tráfico en México.",
      urlProject: ""),
  Project(
    github: "",
      largerDescription:
          "Un portal para conectar a una comunidad exclusiva. Los miembros disfrutan de contenido especial, mientras que los visitantes obtienen una visión de los eventos y la esencia de AxoPunk, invitándolos a unirse a esta comunidad única.",
      title: "AxoPunk Website",
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/whools-proyect.appspot.com/o/AxoPunk%2FLogoPunk.webp?alt=media&token=a13577c8-9e50-4731-aad6-1b782b26f80b",
      description:
          " Una plataforma que presenta una comunidad exclusiva",
      urlProject: "https://axopunk.com/"),
];
