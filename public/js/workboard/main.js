$(document).ready(function() {
    
    $('#block-message').on('click', function() {
        $(this).fadeOut();
    });
    window.interpreter = new CSLP.Workboard.Models.JSInterpreter();
    window.codeTester = new CSLP.Workboard.Models.CodeTester();
    window.tempo = new CSLP.Workboard.Models.Tempo();
    window.parser = new CSLP.Workboard.Models.IMSLDParser({
        exerciseXML : $('#imsld-exercise').html()
    });  
    //COLLECTIONS
    
    window.collections.activityGroups = new CSLP.Workboard.Collections.ActivityGroups();
   
    //VIEWS
    
    window.resourcesModal = new CSLP.Workboard.Views.ResourcesModal({
        el : '#resources-modal'
    });
    window.chatHelp = new CSLP.Workboard.Views.ChatHelp({
        el : '#chat-help'
    });
    window.finishModal = new CSLP.Workboard.Views.FinishModal({
        el : '#finish-modal'
    });
    window.consolePanel = new CSLP.Workboard.Views.Console({
        el : $('#output-panel')
    });
    window.blocklyPanel = new CSLP.Workboard.Views.BlocklyPanel({
        el : $('#blockly-panel')
    });
    window.codePanel = new CSLP.Workboard.Views.CodePanel({
        el : $('#javascript-panel')
    });
    window.WB = new CSLP.Workboard.Views.Workboard({
        el : $('#workboard')
    });
    window.frameHeader = new CSLP.Workboard.Views.FrameHeader({
        el : $('#frame-header')
    });
    window.questionView = new CSLP.Workboard.Views.QuestionView({
        el : $('#modal-question')
    });
    $( "#btn-reply" ).click(function() {
        console.log('Hola');
    });
    $( "#btn-chat-group" ).click(function() {
        window.chatHelp.setChatGroup();
    });
    $( "#btn-chat-person" ).click(function() {
        window.chatHelp.setChatPerson();
    });
    
    
    //MODO DE EJECUCIÓN
    if(window.app.config.mode === 'fixed') {
        //Agregando las actividades
        window.collections.activityGroups.add(activityGroups);
        $('#exercise-title').html('Progreso de actividades');
    } else {
        //Obteniendo las actividades desde el XML
        window.parser.parse();

        //Esablece el nombre del ejercicio en el workboard
        $('#exercise-title').html(window.parser.getExerciseTitle());

        //Agregando las actividades
        window.collections.activityGroups.add(window.parser.getParsedExercise());
    }

    //-------------------------------------------------------------------------------------------------

    //ESTABLECIENDO EL PROGRESO

    window.collections.activityGroups.forEach(function(model) {
        model.updateStatus();
    });

    //Se selecciona el primer grupo que no este completado
    var currentGroup = window.collections.activityGroups.findWhere({
        completed : false
    });
    
    //Si estan todos completados, nos posicionamos en el ultimo grupo
    if(currentGroup === undefined)
        currentGroup = window.collections.activityGroups.last();

    //Abre el listado de actividades de ese grupo en el menu lateral
    currentGroup.view.toggleList();

    //Se selecciona la primera actividad que no este completada
    var currentActivity = currentGroup.getCollection().findWhere({
        completed : false
    });

    //Si todas las actividades del grupo estan completas, selecciono la ultima
    if(currentActivity === undefined)
        currentActivity = currentGroup.getCollection().last();

    if(currentActivity !== undefined)
        currentActivity.set('locked', false);
    if(currentActivity.get('problem_type') == 'Grupal'){
        window.chatView = new CSLP.Workboard.Views.ChatView({
            el : $('#chat')
        });
        window.voteView = new CSLP.Workboard.Views.VoteView({
            el : $('#wait-finish')
        });
        /*
        if(currentActivity.get('type') == 'Grupal'){
            window.voteWait = new CSLP.Workboard.Views.WaitView();
        }*/
    }
    

    window.WB.changeActivity(currentActivity);
    
    
    // Si la actividad es de tipo grupal, se establecen las conexiones.
    /*if(currentActivity.get('problem_type') == 'Grupal'){
        //window.WB.setConectionChat(new CSLP.Workboard.Models.Chat());

        if(currentActivity.get('type') == 'Grupal')
            window.WB.setConectionTeam(new CSLP.Workboard.Models.Waiting()); 
    }*/
    //----------------------------------------------------------------------------------------------------

    //Asignando el recurso
    window.resourcesModal.changeResource(new CSLP.Workboard.Models.Resource(infiniteLoopResource));

    //HELPER
    //Añadimos un healper para actividades grupales
    window.app.tourTeam = CSLP.Helper.Tour(TeamSteps);
    //helper para actividades individuales(problema grupal)
    window.app.tourTeamOnly = CSLP.Helper.Tour(OnlySteps);
    //helper para actvidades individuales(problema individual)
    window.app.tour = CSLP.Helper.Tour(baseSteps);
    //Activando el boton de tour
    $('#btn-tour').on('click', function() {
        //¿Las actividades son un problema de tipo grupal?
        if(currentActivity.get('problem_type') == 'Grupal'){
            //¿EL tipo de actividad es grupal?
            if(currentActivity.get('type') == 'Grupal'){
                // iniciamos el tour del helper, dependiendo del tipo de actividad
                window.app.tourTeam.start();
            }else{
                window.app.tourTeamOnly.start();
            }
        }
        else{
            window.app.tour.start();
        }
    });
});
// json definiendo el tour del helper
var OnlySteps = [{
    intro : 'Vamos a revisar algunas características que diferencian esta actividad de otras. Ya que su desarrollo es totalmente individual, pero puedes comunicarte con tus compañeros para apoyarte.'
}, {
    element : '#btn-chat-popup',
    intro : 'Acá podrás comunicarte con tus compañeros de grupo, así también ver los usuarios <b>online</b> del grupo',
    position : 'left',
    onComplete : function(){
        $('.chat-popup').fadeIn();
    }
}, {
    element : '#chat-popup',
    intro : ' También ver quiénes son tus compañeros y saber si están conectados ',
    position : 'left',
    onComplete : function(){
        $('.chat-popup').fadeOut();
    }
}, {
    intro : "Vamos a revisar como se estructura y cual es la función de cada sección del panel de trabajo"
}, {
    element : '#activity-title',
    intro : 'Este título indica el nombre de la actividad en la que se esta trabajando actualmente'
}, {
    element : '#activity-info',
    intro : 'La sección de informacion de las actividades muestra el progreso actual del ejercicio, dependiendo de cuantas actividades se han completado satisfactoriamente.',
    position : 'right'
}, {
    element : '#activity-info',
    intro : 'Al hacer <b>click</b> sobre el progreso, se despliega el menú de actividades',
    position : 'right',
    onComplete : function() {
        $('#activities-menu').removeClass('auto-hide');
        $('#activities-menu').addClass('visible');
    }
}, {
    element : '#activities-menu',
    intro : 'En el menú de actividades se visualiza todas las actividades a realizar en el ejercicio actual y el estado de cada una, pudiendo estar finalizadas, desbloqueadas para poder ser realizadas, o bloqueadas.',
    position : 'right'
}, {
    element : '#activities-menu',
    intro : 'Al hacer <b>click</b> sobre una de estas actividades, el panel de trabajo activará dicha actividad para poder trabajar en ella',
    position : 'right',
    onComplete : function() {
        $('#activities-menu').removeClass('visible');
        $('#activities-menu').addClass('auto-hide');

        $('#blockly-panel-selector').click();
    }
}, {
    element : '#blockly-panel',
    intro : 'En el panel de trabajo de Blockly, se puede desarrollar el ejercicio haciendo uso de la programacion con bloques',
    position : 'right',
    onComplete : function() {

        $('#javascript-panel-selector').click();
    }

}, {
    element : '#javascript-panel',
    intro : 'En el panel de trabajo de Javascript, se puede visualizar todo el codigo realizado en blockly, transcrito al lenguaje de programación <b>Javascript</b>',
    position : 'right'
}, {
    element : '#panel-selector',
    intro : 'Mediante el selector de paneles, se puede cambiar entre el panel de Blockly y el código Javascript',
    position : 'bottom'
}, {
    element : '#resources-panel',
    intro : 'El panel de recursos especifica las instrucciones de la actividad a realizar, así como también imágenes y enlaces a información necesaria para su realización',
    position : 'left'
}, {
    element : '#output-panel',
    intro : 'En la consola, se visualizará lo que se solicite que se escriba en ella mediante el código',
    position : 'left'
}, {
    element : '#execution-controls',
    intro : 'Mediante los controles de ejecución se puede seleccionar el modo, iniciar y detener la ejecución del código',
    position : 'bottom'
}, {
    element : '#btn-save',
    intro : 'Haciendo <b>click</b> en este botón se guarda el progreso realizado en la actividad',
    position : 'left'
}, {
    element : '#h-resizer-bar',
    intro : 'Mediante la barras barras de ajuste se puede modificar el tamaño de cada uno de los paneles según se requiera',
    position : 'left'
}, {
    element : '#v-resizer-bar',
    intro : 'Mediante la barras barras de ajuste se puede modificar el tamaño de cada uno de los paneles según se requiera',
    position : 'left'
}];
//
var TeamSteps = [{
    intro : 'Vamos a revisar algunas <b>características</b> que diferencian esta actividad de otras. Ya que existe un <b>líder</b> y <b>un medio de comunicación</b>.'
}, {
    intro : '<b>Si eres líder</b>: Es el estudiante encargado de dirigir a su grupo de trabajo y desarrollar la actividad, también el responsable de guardar o terminar la actividad.'
}, {
    intro : 'Ahora si <b>no eres líder</b>: Debes ayudar a encontrar la solución del problema y entregarle tu desarrollo al líder.'
},
{
    element : '#buttons',
    intro : '¿Quién es el Líder? Acá podrás revisar el nombre de la persona que le tocara liderar.',
}, {
    element: '#frame-header',
    intro : '<b>El líder</b> es la unica persona que puede visualizar los botones de guardar y finalizar la actividad, que se mostraran en esta sección.'
}, {
    element : '#btn-chat-popup',
    intro : 'Acá podrás comunicarte con tus compañeros de grupo.',
    position : 'left',
    onComplete : function(){
        $('.chat-popup').fadeIn();
    }
}, {
    element : '#chat-popup',
    intro : ' Como así también ver quiénes son tus compañeros y saber si están conectados ',
    position : 'left',
    onComplete : function(){
        $('.chat-popup').fadeOut();
    }
}, {
    element : '#btn-live-lider',
    intro : 'Acá podrás utilizar las herramientas que te permitirán compartir todo el desarrollo de la actividad con tus compañeros',
    position : 'left',
    onComplete : function(){
        $('.button-popup-share').fadeIn();
        
    }
}, {
    element : '#btn-view-share',
    intro : 'Presionando <b>aquí</b> veras el trabajo que compartirán tus compañeros',
    position : 'left',
    onComplete : function(){
        $('.screen-popup').fadeIn();
    }
}, {
    element : '#section-screen-team',
    intro : 'Acá podrás ver lo que tus compañeros te envían, también puedes hacerle un <b>zoom</b> haciendo click en la imagen.',
    onComplete : function(){
        $('.screen-popup').fadeOut();
        $('.button-popup-screen').fadeIn();
    }
}, {
    element : '#btn-impr',
    intro : 'Presionando <b>aquí</b> compartirás tu desarrollo con los integrantes del grupo.',
    onfinish : function(){
        $('.button-popup-screen').fadeOut();
        $('.button-popup-share').fadeOut();
    }
}, {
    intro : 'Ahora si el <b>líder</b> finaliza la actividad, todos los integrantes pasaran al proceso de votación. Donde tu y tus compañeros finalizaran la actividad democraticamente.',
}, {
    intro : "Vamos a revisar como se estructura y cual es la función de cada sección del panel de trabajo"
}, {
    element : '#activity-title',
    intro : 'Este título indica el nombre de la actividad en la que se esta trabajando actualmente'
}, {
    element : '#activity-info',
    intro : 'La sección de informacion de las actividades muestra el progreso actual del ejercicio, dependiendo de cuantas actividades se han completado satisfactoriamente.',
    position : 'right'
}, {
    element : '#activity-info',
    intro : 'Al hacer <b>click</b> sobre el progreso, se despliega el menú de actividades',
    position : 'right',
    onComplete : function() {
        $('#activities-menu').removeClass('auto-hide');
        $('#activities-menu').addClass('visible');
    }
}, {
    element : '#activities-menu',
    intro : 'En el menú de actividades se visualiza todas las actividades a realizar en el ejercicio actual y el estado de cada una, pudiendo estar finalizadas, desbloqueadas para poder ser realizadas, o bloqueadas.',
    position : 'right'
}, {
    element : '#activities-menu',
    intro : 'Al hacer <b>click</b> sobre una de estas actividades, el panel de trabajo activará dicha actividad para poder trabajar en ella',
    position : 'right',
    onComplete : function() {
        $('#activities-menu').removeClass('visible');
        $('#activities-menu').addClass('auto-hide');

        $('#blockly-panel-selector').click();
    }
}, {
    element : '#panel-selector',
    intro : 'Mediante el selector de paneles, se puede cambiar entre el panel de Blockly y el código Javascript',
    position : 'bottom'
}, {
    element : '#blockly-panel',
    intro : 'En el panel de trabajo de Blockly, se puede desarrollar el ejercicio haciendo uso de la programacion con bloques',
    position : 'right',
    onComplete : function() {

        $('#javascript-panel-selector').click();
    }

}, {
    element : '#javascript-panel',
    intro : 'En el panel de trabajo de Javascript, se puede visualizar todo el codigo realizado en blockly, transcrito al lenguaje de programación <b>Javascript</b>',
    position : 'right',
    onComplete : function() {
        $('#blockly-panel-selector').click();
    }
}, {
    element : '#resources-panel',
    intro : 'El panel de recursos especifica las instrucciones de la actividad a realizar, así como también imágenes y enlaces a información necesaria para su realización',
    position : 'left'
}, {
    element : '#output-panel',
    intro : 'En la consola, se visualizará lo que se solicite que se escriba en ella mediante el código',
    position : 'left'
}, {
    element : '#execution-controls',
    intro : 'Mediante los controles de ejecución se puede seleccionar el modo, iniciar y detener la ejecución del código',
    position : 'bottom'
}, {
    element : '#h-resizer-bar',
    intro : 'Mediante la barras barras de ajuste se puede modificar el tamaño de cada uno de los paneles según se requiera',
    position : 'left'
}, {
    element : '#v-resizer-bar',
    intro : 'Mediante la barras barras de ajuste se puede modificar el tamaño de cada uno de los paneles según se requiera',
    position : 'left'
}];

var baseSteps = [{
    intro : "Vamos a revisar como se estructura y cual es la función de cada sección del panel de trabajo"
}, {
    element : '#activity-title',
    intro : 'Este título indica el nombre de la actividad en la que se esta trabajando actualmente'
}, {
    element : '#activity-info',
    intro : 'La sección de informacion de las actividades muestra el progreso actual del ejercicio, dependiendo de cuantas actividades se han completado satisfactoriamente.',
    position : 'right'
}, {
    element : '#activity-info',
    intro : 'Al hacer <b>click</b> sobre el progreso, se despliega el menú de actividades',
    position : 'right',
    onComplete : function() {
        $('#activities-menu').removeClass('auto-hide');
        $('#activities-menu').addClass('visible');
    }
}, {
    element : '#activities-menu',
    intro : 'En el menú de actividades se visualiza todas las actividades a realizar en el ejercicio actual y el estado de cada una, pudiendo estar finalizadas, desbloqueadas para poder ser realizadas, o bloqueadas.',
    position : 'right'
}, {
    element : '#activities-menu',
    intro : 'Al hacer <b>click</b> sobre una de estas actividades, el panel de trabajo activará dicha actividad para poder trabajar en ella',
    position : 'right',
    onComplete : function() {
        $('#activities-menu').removeClass('visible');
        $('#activities-menu').addClass('auto-hide');

        $('#blockly-panel-selector').click();
    }
}, {
    element : '#blockly-panel',
    intro : 'En el panel de trabajo de Blockly, se puede desarrollar el ejercicio haciendo uso de la programacion con bloques',
    position : 'right',
    onComplete : function() {

        $('#javascript-panel-selector').click();
    }

}, {
    element : '#javascript-panel',
    intro : 'En el panel de trabajo de Javascript, se puede visualizar todo el codigo realizado en blockly, transcrito al lenguaje de programación <b>Javascript</b>',
    position : 'right'
}, {
    element : '#panel-selector',
    intro : 'Mediante el selector de paneles, se puede cambiar entre el panel de Blockly y el código Javascript',
    position : 'bottom'
}, {
    element : '#resources-panel',
    intro : 'El panel de recursos especifica las instrucciones de la actividad a realizar, así como también imágenes y enlaces a información necesaria para su realización',
    position : 'left'
}, {
    element : '#output-panel',
    intro : 'En la consola, se visualizará lo que se solicite que se escriba en ella mediante el código',
    position : 'left'
}, {
    element : '#execution-controls',
    intro : 'Mediante los controles de ejecución se puede seleccionar el modo, iniciar y detener la ejecución del código',
    position : 'bottom'
}, {
    element : '#btn-save',
    intro : 'Haciendo <b>click</b> en este botón se guarda el progreso realizado en la actividad',
    position : 'left'
}, {
    element : '#h-resizer-bar',
    intro : 'Mediante la barras barras de ajuste se puede modificar el tamaño de cada uno de los paneles según se requiera',
    position : 'left'
}, {
    element : '#v-resizer-bar',
    intro : 'Mediante la barras barras de ajuste se puede modificar el tamaño de cada uno de los paneles según se requiera',
    position : 'left'
}];

var infiniteLoopResource = {
    title : "¿Que es un Ciclo Infinito?",
    content : "<b>Ciclo</b> o bucle infinito en programación es un error que consiste en realizar un ciclo que se repite de forma indefinida ya que su <b>condición para finalizar nunca se cumple</b>. <br/><br/>Por definición un bucle debe contener condiciones que establezcan <b>cuándo empieza y cuándo acaba</b>, de manera que, mientras las condiciones se cumplan, ejecute una secuencia de código de manera repetitiva. En el caso de ciclo infinito, como la condición de finalización no se alcanza, el bucle sigue ejecutando el segmento de código indefinidamente. <br><br> Por ejemplo...<img src='http://3.bp.blogspot.com/_264sc_gncA4/Sg-27GZdnQI/AAAAAAAAALY/p3KFnUgSXaQ/s400/Session6-infinite+dowhile.png' alt=''>"
};

var toolboxs = {
    'LA-logic-training' : {
        type : 'include',
        blocks : ['string', 'number', 'console', 'variableSet', 'variableGet']
    },
    'LA-conditionals-training' : {
        type : 'include',
        blocks : ['string', 'number', 'console', 'compare', 'if', 'whileNum', 'while', 'variableSet', 'variableGet']
    }
};

var fixedToolbox = [{
    type : 'include',
    blocks : ['string', 'console']
}, {
    type : 'include',
    blocks : ['string', 'number', 'console', 'variableSet', 'variableGet']
}, {
    type : 'include',
    blocks : ['string', 'number', 'console', 'compare', 'if', 'variableSet', 'variableGet']
}, {
    type : 'include',
    blocks : ['string', 'number', 'console', 'compare', 'if', 'whileNum', 'while', 'variableSet', 'variableGet']
}];

var rules = {
    'LA-logic-training' : {
        correct_result : {
            values : null,
            points : 8,
            condition : 2
        },
        use_variable : {
            points : 6,
            condition : 1
        }
    },
    'LA-conditionals-training' : {
        correct_result : {
            values : ["La sentencia es verdadera"],
            points : 3,
            condition : 1
        },
        use_variable : {
            points : 0,
            condition : 2
        },
        use_conditional : {
            points : 7,
            condition : 1
        }
    },
    'LA-basal-metabolic-rate-calculator' : {
        correct_result : {
            values : [65],
            points : 3,
        },
        use_variable : {
            points : 1
        },
        use_conditional : {
            points : 1
        },
        use_loop : {
            points : 1
        },
        use_function : {
            points : 2
        }
    }
};

var rulesToText = {
    correct_result : "Resultado esperado",
    use_variable : "Usar variables",
    use_conditional : "Usar Condicionales",
    use_loop : "Usar Ciclos",
    use_function : "Usar Funciones"
};
