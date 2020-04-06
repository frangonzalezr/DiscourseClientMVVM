# DiscourseClient with MVVM architecture

He seguido el modelo MVVM satisfaciendo los TODO que he etiquetado como DONE porque me parecía una plantilla muy interesante para mí
que nunca había trabajado con esta arquitectura.

(He añadido algo de maquillaje en plan recreativo para multicolorear el fondo de las celdas alternatívamente)

1.- Se muestra en una tabla el listado "Latest Topics"

	Detalle del Topic: Al pulsar entra en el detalle, añado el count de post y un botón de Delete en la barra

	Crear Topic: En el listado del Topic el Botón + He añadido un campo adicional para incluir el contenido de
	raw. Al ejecutarse la llamada a la API muestra un alert diferencial según sea éxito o fracaso.

2.- En el listado de Categorías se muestra el nombre de cada una de ellas.

3.- En el Tab Users se muestra el listado de users, con el usuario y la foto.

	Detalle del usuario: Al pulsar entra en el detalle del usuario mostrando el ID y el nombre.

	Modificación del nombre del usuario: Si se puede modificar el nombre se habilita el botón de Update que 
	actualiza contra la API y refresca la tabla anterior, sin necesidad de volver a hacer una llamada nueva
	simplemente refrescando la etiqueta de la tabla y el nombre cambiado en el array de usuarios.
