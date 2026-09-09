# Etiquetas básicas



## Indica que estamos utilizando HTML5.

```html
<!DOCTYPE html>
```


## Indica que el documento está escrito en español.
```html
<html lang="es">
```


## Contiene información sobre el documento.
```html
<head>
```

## Contiene aquello que verá el usuario.

```html
<body>
```

# Uso de elementos de la  web semántica

*HTML5 no solamente sirve para mostrar información; también permite describir qué significa cada parte de la página.*



```html
<body>

    <header>
        <h1>BioNoticias</h1>
        <p>Actualidad sobre biodiversidad y conservación</p>
    </header>

    <nav>
        <a href="#">Inicio</a>
        <a href="#">Noticias</a>
        <a href="#">Especies</a>
        <a href="#">Conservación</a>
        <a href="#">Videos</a>
    </nav>

    <main>

        <section>
            <h2>Noticias destacadas</h2>

            <article>
                <h3>El jaguar vuelve a recorrer los bosques mexicanos</h3>
                <p>
                    Investigadores reportan nuevos registros de jaguares
                    en zonas de conservación.
                </p>
            </article>

        </section>

    </main>

    <footer>
        <p>© 2026 BioNoticias</p>
    </footer>

</body>

```

Por ejemplo:

```html
<article>
```


indica que tenemos un contenido independiente, en este caso una noticia.



![img/bio001.png](img/bio001.png)


# Creación del menú 

La versión anterior

```html
 <nav>
        <a href="#">Inicio</a>
        <a href="#">Noticias</a>
        <a href="#">Especies</a>
        <a href="#">Conservación</a>
        <a href="#">Videos</a>
    </nav>
```

Se reemplaza por:

```html
<nav class="menu">
    <div class="logo">
        BioNoticias
    </div>
    <div class="enlaces">
        <a href="#inicio">Inicio</a>
        <a href="#noticias">Noticias</a>
        <a href="#especies">Especies</a>
        <a href="#conservacion">Conservación</a>
        <a href="#videos">Videos</a>
    </div>
</nav>
```


Los enlaces utilizan:

```html
href="#noticias"
```

para desplazarse hacia un elemento que tenga:

```html
id="noticias"
```


Por ejemplo:

```html
<section id="noticias">
```

Esto nos permitirá posteriormente crear un efecto de desplazamiento suave con CSS.




# Agregar el primer artículo a la página de noticias

Sustituir el *article* anterior.

```html
<article class="noticia">

    <img src="img/jaguar.jpg" alt="Jaguar en un bosque tropical">

    <div class="noticia-contenido">

        <span class="categoria">
            Conservación
        </span>

        <h3>
            El jaguar vuelve a recorrer los bosques mexicanos
        </h3>

        <p>
            Nuevos registros obtenidos mediante cámaras trampa
            muestran la presencia de jaguares en diferentes
            regiones naturales.
        </p>

        <time datetime="2026-09-05">
            5 de septiembre de 2026
        </time>

        <a href="#" class="leer-mas">
            Leer noticia ...
        </a>

    </div>

</article>
```


## Elementos relevantes


### alt
```html
alt="Jaguar en un bosque tropical"
```

Ayuda a:

* accesibilidad
* lectores de pantalla
* motores de búsqueda


### time
```html
<time datetime="2026-09-05">
```

Permite identificar semánticamente una fecha.

### Visualmente, se obtiene:

![img/bio002.png](img/bio002.png)

# Agregar 3 noticias similares

* <article> para colibrí
* <article> para bosque
* <article> para tortuga

