$(document).ready(function() {

    //Inicializacion de los Modelos
    window.interpreter = new CSLP.Workboard.Models.JSInterpreter();
    window.codeTester = new CSLP.Workboard.Models.CodeTester();

    window.IMSEncoder = new CSLP.Maker.Models.IMSEncoder();

    //Inicializacion de las Colecciones
    window.collections.activityGroups = new CSLP.Maker.Collections.ActivityGroups();

    //Inicializacion de las Vistas
    window.consolePanel = new CSLP.Workboard.Views.Console({
        el : $('#output-panel')
    });

    window.blocklyPanel = new CSLP.Workboard.Views.BlocklyPanel({
        el : $('#blockly-panel')
    });

   

    window.objectivesSection = new CSLP.Maker.Views.ObjectivesSetter({
        el : $('#objectives-section')
    });

    window.makerView = new CSLP.Maker.Views.Maker({
        el : $('#maker-container')
    });
    window.activityPanel = new CSLP.Maker.Views.ActivityPanel({
        el : $('#activity-panel')
    });
    if(!window.viewMode){
        window.basicOptionsSection = new CSLP.Maker.Views.BasicOptions({
            el : $('#basic-options-section')
        });
        window.questionSection = new CSLP.Maker.Views.QuestionsView({
            el : $('#questions-section')
        });
    }else{
    }
    
    window.collections.activityGroups.add(activityGroups);

    $(window).load(function() {
        window.makerView.resize();
        //Ajusta el tamaño del panel de blockly en base al nuevo ancho establecido
        //Blockly se ajusta solo cuando se lanza un evento de resize en el window
        window.dispatchEvent(new Event('resize'));

    });
//HELPER
    //Añadimos un healper para actividades grupales
    window.app.tour = CSLP.Helper.Tour(steps);
    //helper para actividades individuales(problema grupal)
    //helper para actvidades individuales(problema individual)
    //Activando el boton de tour
    $('#btn-tour').on('click', function() {
        window.app.tour.start();
    });
});
var steps = [
    {
        intro: 'Acá podrás crear todas las actividades que los estudiantes tendrás que realizar, existen grupos de actividades los cuales son 4.'
    },
    {
        element: '#btnsave',
        intro: 'Presionando este botón guardaras todos los cambios realizados dentro de la actividad.'
    },
    {
        element: '#btndelete',
        intro: 'Presionando este botón eliminaras la actividad.'
    },
    {
        element: '#activities-menu',
        intro: 'Dentro de esta sección se visualizarán las actividades correspondientes a cada grupo. ',
        position: 'right'
    },
    {
        element: '#btn-add',
        intro: 'Presionando este botón podrás crear una actividad, si el problema es de tipo <b>Grupal</b> tendrás que elegir el tipo de actividad. Donde las actividades grupales los estudiantes son agrupados de 3 y 1 integrante es el líder que realizara la finalización de la actividad. ',
        position: 'right',
        
    },
    {
        element:'#selector-basic-info',
        intro:'En esta sección definirás la información básica de la actividad. ',
        onComplete : function(){
            $('.selector-option.active').removeClass('active');
            $('#selector-basic-info').addClass('active');
            $('.section.active').removeClass('active');
            $('#basic-info-section').addClass('active');
            $('.blocklyToolboxDiv').hide();
        }
        
    },
    {
        element: '#frm-activity-name',
        intro: 'Acá escribirás el titulo de la actividad.',

    },
    {
        element: '.activity-resource',
        intro: 'Acá definirás todos los detalles de la actividad, como las reglas e indicación de que hacer para cumplir con los objetivos, también puedes añadir enlaces o imágenes para poder aclarar mas lo que hay que hacer.'
    },
    {
        element:'#selector-questions',
        intro:'En esta sección tendrás la opción de incluir preguntas retrospectivas, el cual serán visualizadas en el término de la actividad. ',
        onComplete : function(){
            $('.selector-option.active').removeClass('active');
            $('#selector-questions').addClass('active');
            $('.section.active').removeClass('active');
            $('#questions-section').addClass('active');
            $('.blocklyToolboxDiv').hide();
            
        }
        
    },
    {
        element: '.content-options-questions',
        intro: 'Existen 2 tipos de preguntas que puedes realizar dentro de finalización de una actividad, estas son de tipo cuantitativas o cualitativas. ',
        onComplete : function(){
            $('#questions-quantitative').prop('checked', false);
            $('#add-quantitative').hide();
        }
    },
    {
        element: '.quantitative-question',
        intro: 'Presionando el cuadro de selección, activaras las preguntas <b>cuantitativas</b>.',
        onComplete : function(){
            $('#questions-quantitative').prop('checked', true);
            $('#add-quantitative').show();
        }

    },
    {
        element: '#content-add-quantitative',
        intro: 'Problock tiene preguntas cuantitativas predeterminadas que puedes utilizar.',
        onComplete : function(){
            $('#questions-quantitative').prop('checked', true);
            $('#add-quantitative').show();
        }
    },
    {
        element: '#btn-add-quantitative',
        intro: 'También puedes crear tus preguntas, presionando este botón. Teniendo en cuenta que debes de definir la escala donde 1 es lo más bajo y 10 lo más alto.',
        onComplete : function(){
            $('#questions-quantitative').prop('checked', false);
            $('#add-quantitative').hide();
        }
    },
    {
        element: '.qualitative-question',
        intro: 'Presionando el cuadro de selección, activaras las preguntas <b>cualitativas</b>.',
        onComplete : function(){
            $('#questions-qualitative').prop('checked', true);
            $('#add-qualitative').show();
        }

    },
    {
        element: '#content-add-qualitative',
        intro: 'Problock tiene preguntas cualitativas predeterminadas que puedes utilizar.',
        onComplete : function(){
            $('#questions-qualitative').prop('checked', true);
            $('#add-qualitative').show();
        }
    },
    {
        element: '#btn-add-qualitative',
        intro: 'También puedes crear tus preguntas, presionando este botón.',
        onComplete : function(){
            $('#questions-qualitative').prop('checked', false);
            $('#add-qualitative').hide();
        }

    },
    {
        element:'#selector-objectives',
        intro:'En esta sección definirás los objetivos pedagógicos que deseas obtener en la actividad.',
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
        intro: 'Este es el espacio de trabajo de Problock, donde podrás crear los algoritmos en base a bloques, también puede borrar, hacer zoom y ejecutar el código.',
        position: 'right'
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
        element: '#objectives-panel',
        intro: 'En esta sección se definen los objetivos esperados en la actividad, también definir si lo que se desea es opcional o de uso obligatorio.',
        position: 'left'
    }


];
function exportIMSLD() {
    var exercise = {
        name : 'Calculadora de Calorias'
    };
    var activityGroups = {
        activationTask : {tasks : []},
        elaborationTask : {tasks : []},
        consolidationTask : {tasks : []},
        reflectionTask : {tasks : []}
    };

    activityGroups.activationTask.name = window.collections.activityGroups.models[0].get('name');
    window.collections.activityGroups.models[0].forEach(function(model){
        activityGroups.activationTask.tasks.push({
            name : model.get('name')
        });
    });

    activityGroups.elaborationTask.name = window.collections.activityGroups.models[1].get('name');
    window.collections.activityGroups.models[1].forEach(function(model){
        activityGroups.elaborationTask.tasks.push({
            name : model.get('name')
        });
    });

    activityGroups.consolidationTask.name = window.collections.activityGroups.models[2].get('name');
    window.collections.activityGroups.models[2].forEach(function(model){
        activityGroups.consolidationTask.tasks.push({
            name : model.get('name')
        });
    });

    activityGroups.reflectionTask.name = window.collections.activityGroups.models[3].get('name');
    window.collections.activityGroups.models[3].forEach(function(model){
        activityGroups.reflectionTask.tasks.push({
            name : model.get('name')
        });
    });


    return window.IMSEncoder.getEncodedExercise(exercise, activityGroups);

}

var fixedActivityGroups = [{
    id : 1,
    name : "Conceptos Claves",
    locked : false,
    completed : false,
    activities : [{
        id : 1,
        name : 'Imprimiendo en Consola',
        locked : false,
        completed : false,
        rules : {
            correct_result : {
                values : null,
                points : 10,
                condition : 1
            }
        },
        toolbox : {
            type : 'include',
            blocks : ['string', 'console']
        }
    }, {
        id : 2,
        name : '¿Que son las Variables?',
        locked : true,
        completed : false,
        rules : {
            correct_result : {
                values : null,
                points : 2,
                condition : 2
            },
            use_variable : {
                points : 8,
                condition : 1
            }
        },
        toolbox : {
            type : 'include',
            blocks : ['string', 'number', 'console', 'variableSet', 'variableGet']
        }
    }, {
        id : 3,
        name : 'Tomemos una Decisión',
        locked : true,
        completed : false,
        answer : '<xml xmlns="http://www.w3.org/1999/xhtml"><block type="variables_set" id="51eH;[1XS(_{]:|r;UJt" x="93" y="60"><field name="VAR">elemento</field><value name="VALUE"><block type="math_number" id="dOERj,Mi,q_toWqzeeby"><field name="NUM">0</field></block></value><next><block type="controls_if" id="T;!zZqVZ(A-[ug1(u7F9"><value name="IF0"><block type="logic_compare" id="b7+Iz#53Vg1EvV0}g|[G"><field name="OP">EQ</field><value name="A"><block type="variables_get" id="bGk7]ETnA0ZYf1mVW46s"><field name="VAR">elemento</field></block></value><value name="B"><block type="math_number" id="zLo}Jw]{m4wu-(*K8w1O"><field name="NUM">0</field></block></value></block></value><statement name="DO0"><block type="text_console" id="CvAsCCtBgd7fj:*xVgp="><value name="CONSOLE"><block type="text" id="{`|96sUD_.Ue[y!dpkY4"><field name="TEXT">La sentencia es verdadera</field></block></value></block></statement></block></next></block></xml>',
        rules : {
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
        toolbox : {
            type : 'include',
            blocks : ['string', 'number', 'console', 'compare', 'if', 'variableSet', 'variableGet']
        }
    }, {
        id : 4,
        name : 'Hay que repetirlo!',
        locked : true,
        completed : false,
        rules : {
            correct_result : {
                values : [20],
                points : 4,
                condition : 2
            },
            use_loop : {
                points : 6,
                condition : 1
            }
        },
        toolbox : {
            type : 'include',
            blocks : ['string', 'number', 'console', 'compare', 'if', 'whileNum', 'while', 'variableSet', 'variableGet']
        }
    }, {
        id : 5,
        name : 'Utilizando Funciones',
        locked : true,
        completed : false,
        rules : {
            use_function : {
                points : 30,
                condition : 1
            }
        }
    }]
}, {
    id : 2,
    name : "Solucionando el Problema",
    locked : true,
    completed : false,
    activities : [{
        id : 6,
        name : 'Rito Metabólico Basal',
        locked : true,
        completed : false,
        rules : {
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
    }, {
        id : 7,
        name : 'Calorías Diarias',
        locked : true,
        completed : false,
        rules : {
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
    }, {
        id : 8,
        name : 'Calorías en la Comida',
        locked : true,
        completed : false,
        rules : {
            correct_result : {
                values : [65, 60],
                points : 3,
                condition : 1
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
    }, {
        id : 9,
        name : '¿Cuanta Comida?',
        locked : true,
        completed : false,
        rules : {
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
    }]
}, {
    id : 3,
    name : "Integración de Solución",
    locked : true,
    completed : false,
    activities : [{
        id : 10,
        name : 'Integrando los Módulos',
        locked : true,
        completed : false,
        resources : 'Recursos Actividad 5',
    }]
}, {
    id : 4,
    name : "Reflexionando lo Aprendido",
    locked : true,
    completed : false,
    activities : [{
        id : 11,
        name : 'Calculador de Presupuesto',
        locked : true,
        completed : false,
        resources : 'Recursos Actividad 6',
    }]
}];