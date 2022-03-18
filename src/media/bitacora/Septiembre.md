# Bitácora de avance de la Memoria Septiembre

Se definieron modelos conceptuales, no finales, para la interacción del usuario como CU, diagrama de CU, actividades, objetos, entre otros.

> agregar otras decisiones importantes de las reuniones



## 13 - sep

Se espera que se puedan agregar las funcionalidades de Suscripción, Recordatorios y generalizar la funcionalidade de FAQ a consultas, entre las cuales estará el FAQ.

### Proceso de titulación Descripción

El alumno ingresa al *chatbot*, ell chat bot da el mensaje de bienvenida (ya implementado) y luego muestra:

**Restricciones**:

-  No es un remplazo a los canales oficiales, no guía completamente al alumno de principio a fin por el proceso, sino que es un apoyo para elementos críticos dentro de este proceso.
- Hay que tratar de mantener una interfaz sencilla con pocos pasos, para que no haya que hacer demasiados clicks para llegar a la opción final. También debe ser fácil de entender.



**Key Notes**

Las funcionalidades de más valor ahora serían las suscripciones: Recordatorios y sugerencias.
Intervenciones :> quick win si esas están habilitadas.
y consultas puede que no sean necesarias si el faq funciona bien...

**Soluciones a problemas encontrados**

- **Mantener una UI simple y preservar elementos de configuración:** UI para alumnos P, comandos para alumnos S.
- 

## 14 Sep

Interesting: https://blog.ssdnodes.com/blog/cool-uses-for-docker-wine/

## 15 Sep

Hay requisitos de un proceso que se pueden hacer en cualquier momento del proceso? pero abren otros requisitos -> tiene pre-requistos

Hay que revisar como esta implementado steps ->
pero deberían existir 

Pero steps debería tener asociados requisitos y además consecuencias.

-> sugerencias son de los catalogos asociados a los un requisitos -> ejemplos de como hacerlo, por si estás atorado por ejemplo -> o listas asociadas -> tema de memoria -> oferta de temas.

-> todos los requisitos deben estar asociados a un paso, por simplicidad.
Un requisto que se puede completar en cualquier momento debe estar asociado al final, o a un paso "recomendado", no es necesario que sea ahí, pero al menos en el bot se muestra como esa fecha.

-> implica que un paso podría ser "Estricto"?
es decir que se debe cumplir si o si en su fecha <br>
o podría ser "flexible" puede que tenga unos días más para completarlo.

-> implica que el hito es rigido, atrasos -->

podría preguntar por el modelo de tareas d eU-campus.

campos de steps:
- fecha de inicio
- fecha de cierrre
- fecha de atraso

## 24 Sep
**Decisiones de Diseño**: Se decidió que la interfaz para usuarios P será de tipo GUI mientras que las opciones de configuración y personalización serán de tipo comandos -> esto responde a dos necesidades. 
1. Mantener las cualidades de: eficiencia y parametrización. (Trabajo adelantado Focus Groups)
2. Mantener la simplicidad del diseño (Hallazgos Arancibia)

## 28 de Sep
