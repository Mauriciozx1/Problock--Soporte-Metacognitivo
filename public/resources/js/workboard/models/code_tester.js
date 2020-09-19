CSLP.Workboard.Models.CodeTester = Backbone.Model.extend({

    defaults : {
        code : undefined,
        rules : undefined
    },

    currentBlockId : undefined,
    consoleValues : [],

    initialize : function() {
        this.generateRegularExpressions();
    },

    //Retorna metricas en base a las sentencias del codigo entregado
    analyzeCode : function(code) {
        var statements = {};
        var codeArray = this.getCodeLines(code);
        var type;
        for(var lineIndex in codeArray) {
            type = this.getStatementType(codeArray[lineIndex]);
            if(statements[type] == undefined) {
                statements[type] = {
                    count : 0,
                    statements : []
                }
            }
            statements[type].count++;
            statements[type].statements.push(codeArray[lineIndex])
        }

        return {
            code_lines : this.countCodeLines(),
            statements : statements
        };
    },

    //Cuenta las lineas de c�digo v�lidas
    countCodeLines : function() {
        return this.getCodeLines(this.getCleanCode()).length;
    },

    //Retorna el codigo preparado para el testeo
    getPreparedCode : function() {
        var code = this.get('code');

        //Guardando el id del bock en ejecucion
        code = code.replace(/\#current_block_id\#/g, 'this.currentBlockId');
        //Asignando el codigo de testeo de ciclos infinitos
        code = code.replace(/\#infinite_loop_trap\#/g, 'if(--window.LoopTrap == 0) throw "infinite_loop";');
        //Le quita las llamadas a imprimir en consola consola
        //        code = code.replace(/imprimir\(([^)]+)\);/g, '');
        //Remplaza por funcion capturadora de datos impresos en consola
        code = code.replace(/imprimir\(/g, 'window.codeTester.consoleCatcher(');
        //Detiene la solicitud de datos en prompt
        code = code.replace(/window\.prompt\(([^\)])*\)/g, '""');

        return code;
    },

    //Retorna el codigo limpio de indicadores y funciones de testeo para su an�lisis
    getCleanCode : function() {
        var code = this.getCode();
        code = code.replace(/\#current_block_id\#=(.)*;/g, '');
        code = code.replace(/\#infinite_loop_trap\#/g, '');
        //code = code.replace(/imprimir\(([^)]+)\);/g, '');
        code = code.replace(/window\.prompt\(([^\)])*\)/g, '""');
        return code;
    },

    //Retorna el codigo original recibido de blockly
    getCode : function() {
        return this.get('code');
    },

    //Retorna las reglas a utilizar en el an�lisis
    getRules : function() {
        return this.get('rules');
    },

    //Establece el codigo
    setCode : function(code) {
        this.set('code', code);
    },

    //Establece las reglas
    setRules : function(rules) {
        this.set('rules', rules);
    },

    //Genera las expresiones regulares para analizar el c�digo
    generateRegularExpressions : function() {
        var space = "\\s+";
        var optional_space = "\\s*";
        var anything = "(.)*";
        var statement_body_end = "}";
        var variable_name = "(\\w|_)(\\w|\\d|_)*";
        var variable_name_with_spaces = optional_space + variable_name + optional_space;
        var variable_declaration = "^var" + space + variable_name_with_spaces + "(=" + optional_space + anything + ")?" + ";";
        var variable_assignation = "^" + variable_name_with_spaces + "[+]?=" + optional_space + anything + ";";
        var variable_before_increment = optional_space + "\\+\\+" + variable_name + optional_space;
        var variable_before_decrement = optional_space + "--" + variable_name + optional_space;
        var variable_after_increment = optional_space + variable_name + "\\+\\+" + optional_space + ";?";
        var variable_after_decrement = optional_space + variable_name + "--" + optional_space + ";?";
        var if_statement = "^if" + optional_space + "\\(" + anything + "\\)" + optional_space + "{";
        var else_statement = "else" + optional_space + "{";
        var for_statement = "^for" + optional_space + "\\(" + anything + "\\)" + optional_space + "{";
        var while_statement = "^while" + optional_space + "\\(" + anything + "\\)" + optional_space + "{";
        var function_call = variable_name_with_spaces + "\\((" + variable_name_with_spaces + ")?(," + variable_name_with_spaces + ")*\\)";
        var function_declaration = "^function" + space + function_call + optional_space + "{";

        //VARIABLE ATTR CALL
        //VARIABLE METHOD CALL
        //CREACION LISTA
        //LLAMAR ELEMENTO DE LISTA
        //ASIGNAR VALOR ELEMENTO LISTA

        this.regularExpressions = {
            statement_body_end : new RegExp(statement_body_end, 'g'),
            variable_declaration : new RegExp(variable_declaration, 'g'),
            variable_assignation : new RegExp(variable_assignation, 'g'),
//            variable_before_increment : new RegExp(variable_before_increment, 'g'),
//            variable_before_decrement : new RegExp(variable_before_decrement, 'g'),
//            variable_after_increment : new RegExp(variable_after_increment, 'g'),
//            variable_after_decrement : new RegExp(variable_after_decrement, 'g'),
            if_statement : new RegExp(if_statement, 'g'),
            else_statement : new RegExp(else_statement, 'g'),
            for_statement : new RegExp(for_statement, 'g'),
            while_statement : new RegExp(while_statement, 'g'),
            function_declaration : new RegExp(function_declaration, 'g'),
            function_call : new RegExp(function_call, 'g')
        }
    },

    //Transforma el codifo en un array separado por los saltos de linea
    getCodeLines : function(code) {
        var codeArray = code.split('\n');
        var cleanCodeArray = [];

        var line;
        for(var index in codeArray) {
            line = codeArray[index].trim();
            if(line !== "" && line !== ";")
                cleanCodeArray.push(line);
        }

        return cleanCodeArray;
    },

    //Retorna el tipo de statement entregado
    getStatementType : function(statement) {
        for(var type in this.regularExpressions) {
            if(statement.match(this.regularExpressions[type]))
                return type;
        }
        return 'type_not_found';
    },

    //Atrapa los valores a imprimir en consola
    consoleCatcher : function(value) {
        this.consoleValues.push(value);
    },

    checkRules : function() {
        var rules = this.getRules();

        var analisisResults = this.analyzeCode(this.getCleanCode());

        var testResult = this.test();

        if(testResult) {
            for(var rule in rules) {
                switch(rule) {
                    case 'correct_result':
                        if(rules[rule].values === null) {
                            if(testResult.console_values.length !== 0)
                                rules[rule].pass = true;
                        } else {
                            var pass = true;
                            for(var i in rules[rule].values) {
                                if(testResult.console_values.indexOf(rules[rule].values[i]) === -1 && testResult.console_values.indexOf(parseInt(rules[rule].values[i])) === -1)
                                    pass = false;
                            }
                            rules[rule].pass = pass;
                        }

                        break;

                    case 'use_variable':
                        if(analisisResults.statements.variable_declaration != undefined) {
                            rules[rule].pass = true;
                        } else {
                            rules[rule].pass = false;
                        }
                        break;
                    case 'use_conditional':
                        if(analisisResults.statements.if_statement != undefined) {
                            rules[rule].pass = true;
                        } else {
                            rules[rule].pass = false;
                        }
                        break;
                    case 'use_loop':
                        if(analisisResults.statements.for_statement != undefined || analisisResults.statements.while_statement != undefined) {
                            rules[rule].pass = true;
                        } else {
                            rules[rule].pass = false;
                        }
                        break;
                    case 'use_function':
                        if(analisisResults.statements.function_declaration != undefined) {
                            rules[rule].pass = true;
                        } else {
                            rules[rule].pass = false;
                        }
                        break;
                }
            }

            return rules;
        } else {
            return false;
        }

    },

    //Testea el codigo
    test : function() {

        this.consoleValues = [];

        try {

            //Ejecuta codigo para verficar que no hay problemas l�gicos y capturar datos de consola
            this.getPreparedCode();
            window.LoopTrap = 50000;
            eval(this.getPreparedCode(this.getCode));

            return {
                status : true,
                console_values : this.consoleValues
            }
        } catch(e) {

            return {
                status : false,
                error : e,
                blockId : this.currentBlockId
            }
        }
    }

});