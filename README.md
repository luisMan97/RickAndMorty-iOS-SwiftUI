# RickAndMorty-iOS-SwiftUI

## Installation
Run git clone to download proyect

```ruby
git clone https://github.com/luisMan97/RickAndMorty-iOS-SwiftUI.git
```

#### Third Party Libraries
The project does not use third party libraries. Don't cocoapods, don't cartage, don't worry :)

#### Funcionalidades
- La pantalla principal cuenta con una barra de búsqueda, cuando se realiza la búsqueda se realiza el llamado al servicio de manera automática.

![Alt text](/Resources/Characters/search.gif "search")

- La pantalla principal consta de un listado en grilla de los personajes traídos de la API de Rick And Morty.
- La pantalla principal cuenta con un botón que permite visualizar el listado también en forma de grilla de tres columnas o un listado vertical de una sola columna

![Alt text](/Resources/Characters/button.gif "button")

- La pantalla principal cuenta con un skeleton cuando se está llamando el servicio y está cargando la información.

![Alt text](/Resources/Characters/skeleton.gif "skeleton")

- Se muestra empty state cuando el usuario no ha realizado busqueda (después de haber realizado una busqueda y vaciar la barra de busqueda).

![Alt text](/Resources/Characters/empty_state.png "empty_state")

- Se muestra empty state cuando el servicio falla o no se encuentra resultados.

![Alt text](/Resources/Characters/error.png "error")

- Se muestra mensaje de error cuando la conexión a internet falla

![Alt text](/Resources/Characters/internet.png "internet")

- Cuando se selecciona un personaje se va al detalle del personaje.

![Alt text](/Resources/CharacterDetail/detail.gif "detail")

- La pantalla del detalle cuenta con un listado horizontal de personajes relacionados.

![Alt text](/Resources/CharacterDetail/related.gif "related")

- Cada personaje tiene un botón de favorito que al ser seleccionado guarda localmente en el listado de favoritos.

![Alt text](/Resources/FavoriteCharacters/favorites.gif "favorites")

- La pantalla de favoritos cuenta con una barra de búsqueda, cuando se realiza la búsqueda se filtran los personajes favoritos.

![Alt text](/Resources/FavoriteCharacters/favorites.gif "filter")

- Se muestra empty state cuando el usuario no ha guardado personajes en los favoritos.

![Alt text](/Resources/FavoriteCharacters/empty_state.png "empty_state")

- Se muestra empty state cuando el usuario filtra un personaje que no existe en el listado.

![Alt text](/Resources/FavoriteCharacters/empty_state.png "filtered_empty_state")

#### Funcionalidades técnicas:
- La aplicación está desarrollada en Swift 5, con SwiftUI, Combine, el último framework de Observable y Async/Await.
- La aplicación tiene cómo arquitectura un tipo de MVVM extendido (CLEAN Architecture).
- La aplicación usa programación reactiva con Combine.
- La aplicación hace uso de persistencia de datos con SwiftData.
- La aplicación implementa diferentes patrones de diseño (Repository, Factory, entre otros).
- La aplicación hace uso de inyección de dependencias.
- La aplicación hace uso de los principios SOLID.
- La aplicación no usa librerías de terceros.
- La aplicación contiene test unitarios de las casos de uso y viewmodels.
- La aplicación usa una capa genérica con URLSession para hacer los llamados a los servicios.  
- La aplicación tiene un método que imprime los errores de manera centralizada y solo para modo debug.
- La aplicación usa Codable para el mapeo de JSON a objetos. 
- La aplicación contiene un .gitignore para no subir archivos innecesarios.

#### Arquitectura
Se implementó CLEAN como arquitectura, con las siguientes capas:
1) View: Contiene las View de SwiftUI
2) Presentation: Contiene los ViewModels
3) Interactor/UseCases: Contiene los casos de uso (acciones de la aplicación y lógica de negocios)
4) Entity/Domain: Contiene las entidades
5) Data: Contiene el patrón repository para obtener los datos ya sea de una API o una base de datos local
6) Framework: Contiene la implementación a más detalle de la obtención de datos usando ya la respectiva librería o framework (URLSession y etc)
