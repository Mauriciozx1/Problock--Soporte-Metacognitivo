CSLP.Workboard.Views.BlocklyPanel = Backbone.View.extend({

    events : {},

    bockly : undefined,
    blocklyArea : undefined,
    blocklyDiv : undefined,

    workspace : undefined,

    highlightPause : false,

    toolboxType : undefined,
    toolboxXML : undefined,

    initialize : function() {

        this.toolboxXML = document.getElementById('toolbox');

        this.initBlockly();
    },

    initBlockly : function() {

        //BLOQUES CREADOS

        //Bloque de consola
        //https://blockly-demo.appspot.com/static/demos/blockfactory/index.html#bbwfs9
        //Agrega el bloque de imprimir en la consola de la interfaz
        Blockly.Blocks['text_console'] = {
            init : function() {
                this.appendValueInput("CONSOLE").setCheck(null).appendField("imprimir en consola");
                this.setPreviousStatement(true, null);
                this.setNextStatement(true, null);
                this.setColour(160);
                this.setTooltip('Imprime el resultado en la consola');
                this.setHelpUrl('http://www.help.com/');
            }
        };

        Blockly.JavaScript['text_console'] = function(block) {
            var value_console = Blockly.JavaScript.valueToCode(block, 'CONSOLE', Blockly.JavaScript.ORDER_ATOMIC);
            // TODO: Assemble JavaScript into code variable.
            var code = 'imprimir(' + value_console + ');\n';
            return code;
        };

        Blockly.JavaScript.addReservedWords('code');
        //Indica que se agreguen las instrucciones para iluminar los bloques
        Blockly.JavaScript.STATEMENT_PREFIX = 'highlightBlock(%1);\n';
        Blockly.JavaScript.addReservedWords('highlightBlock');

        //Agrega blockly a la interfaz
        this.blocklyArea = document.getElementById('blockly-panel');
        this.blocklyDiv = document.getElementById('blockly-wrapper');

        this.initWorkspace(this.filterToolbox());

    },

    initWorkspace : function(toolBox) {
        $('.blocklyToolboxDiv').remove();
        this.blocklyDiv.innerHTML = "";
        this.workspace = Blockly.inject(this.blocklyDiv, {
            toolbox : toolBox,
            zoom : {
                controls : true,
                wheel : true,
                startScale : 1.0,
                maxScale : 3,
                minScale : 0.3,
                scaleSpeed : 1.2
            }
        });
        this.workspace.traceOn(true);
    },

    //Agrega los bloques iniciales a blockly
    addInitialBlocks : function(DOM) {
        Blockly.Xml.domToWorkspace(DOM, this.workspace);
    },

    //Limpia todos los bloques que se encuentren en el workspace
    clear : function() {
        this.workspace.clear();
    },

    //Solicita la actuaizacion del toolbox en base a las indicaciones recibidas
    changeToolbox : function(type, toolboxType, elements) {

        if(this.toolboxType !== toolboxType) {
            //Debe reiniciar el workspace para que acepte un toolbox de distinto tipo
            this.initWorkspace(this.filterToolbox(type, toolboxType, elements))
        } else {
            this.setToolbox(this.filterToolbox(type, toolboxType, elements));
        }

        this.toolboxType = toolboxType;
    },

    displayBlockMessage : function(blockId, title, message, icon) {

        var msgBox = $('#block-message');
        msgBox.attr('data-icon', icon);

        $(msgBox.children()[0]).html(title);
        $(msgBox.children()[1]).html(message);

        //Iluminando bloque
        this.highlightBlock(blockId);
        //Posicionando mensaje
        var blockPosition = this.getBlockPosition(blockId);
        msgBox.css({
            top : blockPosition.top,
            left : blockPosition.left + this.getBlockWidth(blockId) + 10
        });

        msgBox.fadeIn();

    },

    displayErrorMessage : function(e, blockId) {
        var errorMsg = undefined;
        var errorTitle = undefined;
        console.log(e);
        switch(e) {
            case 'infinite_loop':
                errorTitle = "Ciclo Infinito";
                errorMsg = "Se ha generado un ciclo infinito. Si se ejecuta este código podría generar problemas.<br/><br/><a href='#' onclick='window.resourcesModal.show()'>¿Qué es un ciclo infinito?</a>";
                break;
            default:
                errorTitle = "Oops!";
                errorMsg = "Hay un error en este bloque";
                break;
        }
        if(errorMsg !== undefined)
            this.displayBlockMessage(blockId, errorTitle, errorMsg, 'mood_bad');
    },

    //Retorna un elemento XML con el toolbox filtrado segun lo indicado
    filterToolbox : function(type, toolboxType, elements) {
        type = type || 'all';

        var toolbox;
        switch(type) {
            case 'all':
                return this.toolboxXML;

                break;

            case 'include':
                toolbox = $('<xml></xml>');

                //Solo se incluiran bloques sueltos sin categoria
                if(toolboxType === 'blocks') {
                    for(var i in elements) {
                        toolbox.append($('#block-' + elements[i]).clone());
                    }
                } else {
                    //Si se incluiran categorias
                    var categoryDOM;
                    for(var category in elements) {
                        categoryDOM = $('#category-' + category).clone();
                        //Si solo se quiere incluir algunos bloques de la categoria
                        if(elements[category] === 'all') {
                            categoryDOM.html('');
                            for(var blockID in elements[category]) {
                                categoryDOM.append($('#block-' + elements[category][blockID]).clone());
                            }
                        }
                        toolbox.append(categoryDOM);
                    }
                }
                //retorna el elemento dom generado mediante JQuery
                return toolbox.get()[0];
                break;

            case 'exclude':

                break;
        }
    },

    //Retorna el codigo en javascript
    getCode : function(withHighlight) {
        withHighlight = withHighlight || false;

        if(!withHighlight) {
            Blockly.JavaScript.STATEMENT_PREFIX = '';
        }

        var code = Blockly.JavaScript.workspaceToCode(this.workspace);

        Blockly.JavaScript.STATEMENT_PREFIX = 'highlightBlock(%1);\n';
        return code;
    },

    getBlockPosition : function(blockId) {
        return $(this.workspace.getBlockById(blockId).svgPath_).position();
    },

    getBlockWidth : function(blockId) {
        return this.workspace.getBlockById(blockId).svgPath_.getBBox().width;
    },

    getBlockSvgById : function(blockId) {
        return $(this.workspace.getBlockById(blockId).svgPath_);
    },

    //Ilumina alguno de los blockes segun el id entregado
    highlightBlock : function(id) {
        this.workspace.highlightBlock(id);
        this.highlightPause = true;
    },

    parseCode : function() {

        var testResult = this.testCode();
        if(testResult.status) {        // Generate JavaScript code and parse it.
            var code = this.getCode(true);
            this.interpreter = window.interpreter.getInterpreter(code);

            document.getElementById('btn-step').disabled = '';

            this.highlightPause = false;
            this.highlightBlock(null);
        } else {
            this.displayErrorMessage(testResult.error);
        }
    },

    runCode : function() {
        var testResult = this.testCode();
        if(testResult.status) {
            window.interpreter.run(this.getCode());
        } else {
            this.displayErrorMessage(testResult.error, testResult.blockId);
        }
    },

    resize : function() {
        // Compute the absolute coordinates and dimensions of blocklyArea.
        var element = this.blocklyArea;
        var x = 0;
        var y = 0;
        do {
            x += element.offsetLeft;
            y += element.offsetTop;
            element = element.offsetParent;
        } while(element);
        // Position blocklyDiv over blocklyArea.
        //blocklyDiv.style.left = x + 'px';
        //blocklyDiv.style.top = y + 'px';
        this.blocklyDiv.style.width = (this.blocklyArea.offsetWidth - 1) + 'px';
        this.blocklyDiv.style.height = (this.blocklyArea.offsetHeight - 4) + 'px';

        Blockly.svgResize(this.workspace);
    },

    //Actualiza los valores del toolbox de blockly
    setToolbox : function(toolboxXML) {
        this.workspace.updateToolbox(toolboxXML);
    },

    stepCode : function() {
        try {
            var ok = this.interpreter.step();
        } finally {
            if(!ok) {
                // Program complete, no more code to execute.
                this.highlightBlock(null);
                return false;
            }
        }
        if(this.highlightPause) {
            // A block has been highlighted.  Pause execution here.
            this.highlightPause = false;
        } else {
            // Keep executing until a highlight statement is reached.
            this.stepCode();
        }
        return true;
    },

    //Prueba el codigo a ejecutar, errores errores
    testCode : function() {
        Blockly.JavaScript.STATEMENT_PREFIX = '#current_block_id#=%1;\n';
        Blockly.JavaScript.INFINITE_LOOP_TRAP = '#infinite_loop_trap#\n';

        var code = Blockly.JavaScript.workspaceToCode(this.workspace);

        //Retorna a los valores originales
        Blockly.JavaScript.STATEMENT_PREFIX = 'highlightBlock(%1);\n';
        Blockly.JavaScript.INFINITE_LOOP_TRAP = null;

        window.codeTester.setCode(code);
        return window.codeTester.test();
    },

    //Retorna los el codigo en formato de texto xml sin formato
    toText : function() {
        return Blockly.Xml.domToText(Blockly.Xml.workspaceToDom(this.workspace));
    }

});