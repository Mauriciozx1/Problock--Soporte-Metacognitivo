var activityGroups = [{
    id : 1,
    name : "Conceptos Claves",
    locked : false,
    completed : false,
    activities : [{
        id : 9,
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
        id : 1,
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
        id : 2,
        name : 'Tomemos una Decisión',
        locked : true,
        completed : false,
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
        id : 10,
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
        id : 11,
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
        id : 3,
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
        id : 4,
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
        id : 5,
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
        id : 6,
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
    id : 7,
    name : "Integración de Solución",
    locked : true,
    completed : false,
    activities : [{
        id : 5,
        name : 'Integrando los Módulos',
        locked : true,
        completed : false,
        resources : 'Recursos Actividad 5',
    }]
}, {
    id : 8,
    name : "Reflexionando lo Aprendido",
    locked : true,
    completed : false,
    activities : [{
        id : 6,
        name : 'Calculador de Presupuesto',
        locked : true,
        completed : false,
        resources : 'Recursos Actividad 6',
    }]
}];