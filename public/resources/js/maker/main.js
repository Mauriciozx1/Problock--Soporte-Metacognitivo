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

    window.basicOptionsSection = new CSLP.Maker.Views.BasicOptions({
        el : $('#basic-options-section')
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

    window.collections.activityGroups.add(activityGroups);

    $(window).load(function() {
        window.makerView.resize();
        //Ajusta el tamaño del panel de blockly en base al nuevo ancho establecido
        //Blockly se ajusta solo cuando se lanza un evento de resize en el window
        window.dispatchEvent(new Event('resize'));

    });

});

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