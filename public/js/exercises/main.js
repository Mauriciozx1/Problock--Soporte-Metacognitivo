$(document).ready(function(){

    window.currentCourse = undefined;

    //Collections
    window.collections.courses = new CSLP.Exercises.Collections.Courses();

    //Views
    window.modal = new CSLP.Exercises.Views.Modal({
        el : $('#edit-modal')
    });

    if(window.courses.length >0){
        $('#courses-container').show();
        window.collections.courses.add(window.courses);
        if(window.students !== undefined){
            window.collections.students = new CSLP.Exercises.Collections.Students();
            window.collections.students.add(window.students);
        }

        window.collections.courses.first().view.$el.trigger('click');
    }else{
        $('#no-courses').show();
    }



    $('#btn-add').on('click',function(){
        window.modal.setModel(new CSLP.Exercises.Models.Exercise);
        window.modal.toggle();
    });

    //HELPER
    //Añadimos un healper para actividades grupales
    window.app.teacher = CSLP.Helper.Tour(stepsTeacher);
    //helper para actividades individuales(problema grupal)
    window.app.students = CSLP.Helper.Tour(stepsStudents);
    //helper para actvidades individuales(problema individual)
    //Activando el boton de tour
    $('#btn-tour').on('click', function() {
        console.log(window.typeUser);
        if(window.typeUser == 'teacher'){
            window.app.teacher.start();
        }
        else{
            window.app.students.start();
        }
    });

});
function selectType(value){
    if(value == "Individual"){
        $("#permiso-problem-t").hide();
    }
    if(value == "Grupal"){
        $("#permiso-problem-t").show();
    }
}
setCurrentCourse = function(model){
    if(window.currentCourse !== model){
        window.currentCourse = model;

        $('.exercise').hide();
        window.currentCourse.showProblems();

        if(window.collections.students !== undefined){
            //Necesitamos que las filas de profesores se actualicen con la info del nuevo curso
            window.collections.students.forEach(function(model) {
                model.trigger('change');
            });
        }
    }
};
var stepsStudents = [
    {
        intro:'Vamos a revisar algunas funciones dentro de esta interfaz, donde explicaremos...',
        onComplete : function(){
            if($('#exercise-tour').is(':visible')){
                $('#exercise-tour').hide();
            }
        }
    },
    {
        element:'.courses-aside-menu',
        intro:'Esta sección permitirá la visualización de todos los <b>Cursos</b> en el que se está registrado.',
        position:'right',
        onComplete : function(){
            if($('#exercise-tour').is(':visible')){
                $('#exercise-tour').hide();
            }
        }
    },
    {
        intro : 'Una vez registrado en el curso, podrás ver todos los problemas que el profesor ha creado para que tú las realices.',
        onComplete : function(){
            if(!$('#exercise-tour').is(':visible')){
                $('#exercise-tour').show();
            }
        },
    },
    {
        element:'#exercise-tour',
        intro:'Esto es un problema de prueba que tu profesor puede crear y así se visualizara.',
        onComplete : function(){
            if(!$('#exercise-tour').is(':visible')){
                $('#exercise-tour').show();
            }
        }
    },
    {
        element:'#title-problem-tour',
        intro:'Se muestra el título del problema.',
        onComplete : function(){
            if(!$('#exercise-tour').is(':visible')){
                $('#exercise-tour').show();
            }
            if($('#student-tour').is(':visible')){
                $('#student-tour').hide();
            }
        },
    },
    {
        element:'#type-problem-tour',
        intro:'Se muestra el tipo de problema creado, puede ser <b>Grupal</b> o <b>Individual</b>',
        onComplete : function(){
            if(!$('#exercise-tour').is(':visible')){
                $('#exercise-tour').show();
            }
            if($('#student-tour').is(':visible')){
                $('#student-tour').hide();
            }
        },
    },
    {
        element:'#description-problem-tour',
        intro:'Se muestra la descripción del problema creado.',
        onComplete : function(){
            if(!$('#exercise-tour').is(':visible')){
                $('#exercise-tour').show();
            }
            if($('#student-tour').is(':visible')){
                $('#student-tour').hide();
            }
        },
    },
    {
        element:'#date-problem-tour',
        intro:'Se muestra las fechas limites del problema como la fecha de inicio y la fecha de término. Donde será el tiempo total que tienes para poder realizar las actividades.',
        onComplete : function(){
            if(!$('#exercise-tour').is(':visible')){
                $('#exercise-tour').show();
            }
            if($('#student-tour').is(':visible')){
                $('#student-tour').hide();
            }
        },
    },
    {
        element:'#on-activity-problem-tour',
        intro:'Presionando este botón podrás acceder a la realización de todas las actividades del problema.',
        onComplete : function(){
            if(!$('#exercise-tour').is(':visible')){
                $('#exercise-tour').show();
            }
            if($('#student-tour').is(':visible')){
                $('#student-tour').hide();
            }
        },
    },
    {
        element:'#score-problem-tour',
        intro:'Esto se indicara el puntaje obtenido de todas las actividades realizadas dentro del problema. ',
        onComplete : function(){
            if(!$('#exercise-tour').is(':visible')){
                $('#exercise-tour').show();
            }

        },
    },
    {
        element:'#calification-problem-tour',
        intro:'Presionando este botón podrás ver las calificaciones obtenidas en cada una de las actividades realizadas.',
        onComplete : function(){
            if(!$('#exercise-tour').is(':visible')){
                $('#exercise-tour').show();
            }
        },
    },

];
var stepsTeacher = [
    {
        intro:'Vamos a revisar algunas funciones dentro de esta interfaz, donde explicaremos las 3 secciones existentes.',
        onComplete : function(){
            if($('#student-tour').is(':visible')){
                $('#student-tour').hide();
            }
            if($('#exercise-tour').is(':visible')){
                $('#exercise-tour').hide();
            }
        }
    },
    {
        element:'.courses-aside-menu',
        intro:'Esta primera sección se visualizarán todos los <b>Cursos</b> en el que se está registrado.',
        position:'right',
        onComplete : function(){
            if($('#student-tour').is(':visible')){
                $('#student-tour').hide();
            }
            if($('#exercise-tour').is(':visible')){
                $('#exercise-tour').hide();
            }
        }
    },
    {
        element:'#problems-section',
        intro:'La segunda sección <b>Problemas</b> donde podemos encontrar todos los problemas que uno como profesor puede crear dentro de Problock.',
        onComplete : function(){
            $('.section-selector.active').removeClass('active');
            $('#problems-section').addClass('active');
            $('.section.active').removeClass('active');
            $('#exercises-panel').addClass('active');
            if($('#student-tour').is(':visible')){
                $('#student-tour').hide();
            }
            if($('#exercise-tour').is(':visible')){
                $('#exercise-tour').hide();
            }
        }
    },
    {
        element:'#btn-add',
        intro:'Presionando este botón podrás crear un nuevo problema, definiendo sus características.',
        onComplete : function(){
            if(!$('#exercise-tour').is(':visible')){
                $('#exercise-tour').show();
            }
            if($('#student-tour').is(':visible')){
                $('#student-tour').hide();
            }
        },
    },
    {
        element:'#exercise-tour',
        intro:'Esto es un problema que ya se creó, donde se visualizaran todos los detalles ingresados en su respectivo formulario de creación. ',
        onComplete : function(){
            if(!$('#exercise-tour').is(':visible')){
                $('#exercise-tour').show();
            }
            if($('#student-tour').is(':visible')){
                $('#student-tour').hide();
            }
        },
    },
    {
        element:'#state-problem-tour',
        intro:'Presionado este botón podrás ver toda la interacción que los estudiantes tienen en las actividades, y también es el lugar donde te podrás comunicar con ellos.',
        onComplete : function(){
            if(!$('#exercise-tour').is(':visible')){
                $('#exercise-tour').show();
            }
            if($('#student-tour').is(':visible')){
                $('#student-tour').hide();
            }
        },
    },
    {
        element:'#edit-problem-tour',
        intro:'Presionando este botón podrás editar o eliminar el problema.',
        onComplete : function(){
            if(!$('#exercise-tour').is(':visible')){
                $('#exercise-tour').show();
            }
            if($('#student-tour').is(':visible')){
                $('#student-tour').hide();
            }
        },
    },
    {
        element:'#title-problem-tour',
        intro:'Se muestra el título del problema.',
        onComplete : function(){
            if(!$('#exercise-tour').is(':visible')){
                $('#exercise-tour').show();
            }
            if($('#student-tour').is(':visible')){
                $('#student-tour').hide();
            }
        },
    },
    {
        element:'#type-problem-tour',
        intro:'Se muestra el tipo de problema creado, puede ser <b>Grupal</b> o <b>Individual</b>',
        onComplete : function(){
            if(!$('#exercise-tour').is(':visible')){
                $('#exercise-tour').show();
            }
            if($('#student-tour').is(':visible')){
                $('#student-tour').hide();
            }
        },
    },
    {
        element:'#description-problem-tour',
        intro:'Se muestra la descripción del problema creado.',
        onComplete : function(){
            if(!$('#exercise-tour').is(':visible')){
                $('#exercise-tour').show();
            }
            if($('#student-tour').is(':visible')){
                $('#student-tour').hide();
            }
        },
    },
    {
        element:'#date-problem-tour',
        intro:'Se muestra las fechas limites del problema como la fecha de inicio y la fecha de término. Para los estudiantes esto seria el tiempo que tienen para realizar el problema.',
        onComplete : function(){
            if(!$('#exercise-tour').is(':visible')){
                $('#exercise-tour').show();
            }
            if($('#student-tour').is(':visible')){
                $('#student-tour').hide();
            }
        },
    },
    {
        element:'#edit-activity-problem-tour',
        intro:'Presionando este botón podrás acceder a la interfaz de edición de actividades del problema donde podrás crear las actividades que realizaran los estudiantes, como también definir los objetivos pedagógicos y también las preguntas retrospectivas que se mostraran al termino de cada actividad..',
        onComplete : function(){
            if(!$('#exercise-tour').is(':visible')){
                $('#exercise-tour').show();
            }
            if($('#student-tour').is(':visible')){
                $('#student-tour').hide();
            }
        },
    },
    {
        element:'#calification-problem-tour',
        intro:'Presionando este botón podrás ver las calificaciones obtenidas por cada uno de los estudiantes, como también las respuestas obtenidas de las preguntas retrospectivas.',
        onComplete : function(){
            if($('#exercise-tour').is(':visible')){
                $('#exercise-tour').hide();
            }
            if($('#student-tour').is(':visible')){
                $('#student-tour').hide();
            }
        },
    },
    {
        element:'#students-section',
        intro:'La tercera sección <b>Estudiantes</b> podremos ver a todos los estudiantes registrados dentro de la plataforma, donde….',
        onComplete : function(){
            $('.section-selector.active').removeClass('active');
            $('#student-section').addClass('active');
            $('.section.active').removeClass('active');
            $('#students-panel').addClass('active');
            $('#student-tour').show();
        }

    },
    {
        element: '#student-tour',
        intro: 'En cada estudiante podrás ver la información y también la posibilidad de enlazar o desenlazarlo de el curso en él que se tenga seleccionado.',
        onComplete : function(){
            $('#student-tour').hide();
        }
    }

];