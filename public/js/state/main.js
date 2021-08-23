
$(document).ready(function() {
    window.interpreter = new CSLP.Workboard.Models.JSInterpreter();
    window.codeTester = new CSLP.Workboard.Models.CodeTester();
    window.teamwork = new CSLP.State.Models.Teamworks();
    window.interaction = new CSLP.State.Models.Interactions();
    
    //Inicializacion de las Colecciones
    window.collections.activityGroups = new CSLP.State.Collections.ActivityGroups();
    
    window.chatView = new CSLP.State.Views.ChatView({
        el : $('#chat')
    });
    //Inicializacion de las Vistas
    window.consolePanel = new CSLP.Workboard.Views.Console({
        el : $('#output-panel')
    });

    window.blocklyPanel = new CSLP.Workboard.Views.BlocklyPanel({
        el : $('#blockly-panel')
    });
    
    window.objectivesSection = new CSLP.State.Views.ObjectivesSetter({
        el : $('#objectives-section')
    });
    window.viewStudentsSection = new CSLP.State.Views.ViewStudents({
        el : $('#view-students-section')
    });
    window.activityPanel = new CSLP.State.Views.ActivityPanel({
        el : $('#activity-panel')
    });
   
    window.statusView = new CSLP.State.Views.Status({
        el : $('#maker-container')
    });
    window.collections.activityGroups.add(activityGroups);

    $( "#btn-chat-popup" ).click(function() {
        window.chatView.show();
    });
    window.regrups = new CSLP.State.Views.ReGrups({
        el : $('#modal-regrup')
    });
   //$('.modal').show();
    
 //HELPER
    //Añadimos un healper
    window.app.tour = CSLP.Helper.Tour(steps);
    //Activando el boton de tour
    $('#btn-tour').on('click', function() {
        window.app.tour.start();
        
    });
    
});
var steps = [
    {
        element: '#activities-menu',
        intro: 'En esta sección se mostraran todas las actividades creadas en el problema.',
        position: 'right'
    },
    {
        element: '#selector-view-students',
        intro: 'En esta sección podrás ver toda la interacción que los estudiantes tienen con la plataforma también como el poder comunicarte con ellos.',
        onComplete : function(){
            $('.selector-option.active').removeClass('active');
            $('#selector-view-students').addClass('active');
            $('.section.active').removeClass('active');
            $('#view-students-section').addClass('active');
            $('.blocklyToolboxDiv').hide();
        }
    },
    {
        element: '#title-list-activities',
        intro: 'En esta sección veras la lista de los estudiantes, que estén registrados dentro del problema. Si la actividad es grupal se mostraran la agrupación respectiva.',
        position: 'left'
    },
    {
        element: '.title-log',
        intro: 'En esta sección se visualiza un log de toda la interacción que ocurren dentro de la plataforma a tiempo real, este historial lo puedes exportar.',
        position: 'left'
    },
    {
       element: '.info-status',
       intro: 'Esta sección te enseña que significa cada uno de los iconos que se mostraran en los estados de cada estudiante.',
       position: 'left' 
    },
    {
        element: '#btn-chat-popup',
        intro: 'Acá podrás comunicarte con el estudiante, pero tendrás que seleccionarlo dentro de la lista, como también así comunicarte con un grupo de trabajo este también tendrás que seleccionarlo para poder crear un canal de comunicación.',
        position: 'left'
    },
    {
        element:'#selector-objectives',
        intro:'En esta sección podrás crear algoritmos en base a bloques para poder enviárselos a tus estudiante mediante el chat o simplemente ver el contenido de cada actividad.',
        onComplete : function(){
            $('.selector-option.active').removeClass('active');
            $('#selector-objectives').addClass('active');
            $('.section.active').removeClass('active');
            $('#objectives-section').addClass('active');
            $('.blocklyToolboxDiv').show();
        }  
    },
    {
        element: '#blockly-panel',
        position: 'right',
        intro: 'Este es el espacio de trabajo de Problock, donde podrás crear los algoritmos en base a bloques, también puede borrar, hacer zoom y ejecutar el código.',
        
    },
    {
        element: '.blocklyToolboxDiv',
        intro: 'En esta sección podrás seleccionar los bloques que deseas incluir dentro del espacio de trabajo para poder crear un algoritmo y también así definir los objetivos esperados de la actividad.',
        position: 'right'
    },
    {
        element: '#execution-controls',
        intro: 'Presionando este botón podrás ejecutar todo el algoritmo creado y probarlo.',
        position: 'left'
    },
    {
        element: '#output-panel',
        intro: 'Acá se visualizará la respuesta o resultado del algoritmo creado en base a bloques.',
        position: 'left'
    },
    {
        element: '#resources-panel',
        intro: 'En esta sección se muestra la información básica de la actividad seleccionada.',
        position: 'left'
    }
];
var rulesToText = {
    correct_result : "Resultado esperado",
    use_variable : "Usar variables",
    use_conditional : "Usar Condicionales",
    use_loop : "Usar Ciclos",
    use_function : "Usar Funciones"
};
