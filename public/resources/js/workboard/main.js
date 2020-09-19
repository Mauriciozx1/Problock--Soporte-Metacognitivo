$(document).ready(function() {

    $('#block-message').on('click', function() {
        $(this).fadeOut();
    });

    //MODELS

    window.interpreter = new CSLP.Workboard.Models.JSInterpreter();
    window.codeTester = new CSLP.Workboard.Models.CodeTester();
    window.parser = new CSLP.Workboard.Models.IMSLDParser({
        exerciseXML : $('#imsld-exercise').html()
    });

    //COLLECTIONS
    window.collections.activityGroups = new CSLP.Workboard.Collections.ActivityGroups();

    //VIEWS
    window.resourcesModal = new CSLP.Workboard.Views.ResourcesModal({
        el : '#resources-modal'
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

    //MODO DE EJECUCIÓN
    if(window.app.config.mode === 'fixed') {
        //Agregando las actividades
        window.collections.activityGroups.add(activityGroups);
        $('#exercise-title').html('Calculador de Calorias');
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

    window.WB.changeActivity(currentActivity);

    //----------------------------------------------------------------------------------------------------

    //Asignando el recurso
    window.resourcesModal.changeResource(new CSLP.Workboard.Models.Resource(infiniteLoopResource));

    //HELPER
    window.app.tour = CSLP.Helper.Tour(tourSteps);

    //Activando el boton de tour
    $('#btn-tour').on('click', function() {
        window.app.tour.start();
    });

});

var tourSteps = [{
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
