CSLP.Workboard.Views.Workboard = Backbone.View.extend({

    events : {
        'click #panel-selector > span' : 'panelChange',
        'click #btn-run' : 'runCode',
        'click #btn-stop' : 'stopExecution',
        'click #btn-step' : 'runStep',
        'change #by-steps' : 'toggleBySteps',

        'mousedown .h-resizer-bar' : 'hresizerUnlock',
        'mousedown .v-resizer-bar' : 'vresizerUnlock',
        'mouseup' : 'resizerLock',
        'mousemove' : 'resizePanel'
    },

    jWindow : undefined,
    jFrame : undefined,

    isHResizerLocked : true,
    isVResizerLocked : true,

    bySteps : false,

    currentActivity : undefined,

    initialize : function() {

        //Reajuste de la pantalla de trabajao dependiendo del cambio de tama�o de la ventana
        this.jWindow = $(window);
        this.jFrame = this.$('#frame-content');

        var self = this;
        this.jWindow.bind('resize', function() {
            self.resize();
        });

        this.resize();
    },

    //Cambia la actividad en la que se esta trabajando
    changeActivity : function(activityModel) {
        //Si la actividad seleccionada es distinta que la actual
        if(this.currentActivity != activityModel) {
            if(this.currentActivity != undefined)
                this.currentActivity.set('selected', false);
            this.currentActivity = activityModel;
            this.currentActivity.set('selected', true);

            this.setLoading(true);

            //Solicitar la carga de los datos del modelo
            this.currentActivity.fetchInfo();
        }
    },

    disableStepCheck : function(disable) {
        this.$('#by-steps').attr('disabled', disable);
    },

    //Pasa a la siguiente actividad
    nextActivity : function() {
        var collection = this.currentActivity.collection;

        //Obtiene la siguiente actividad en el grupo actual
        var nextModel = collection.models[collection.indexOf(this.currentActivity) + 1];

        //Si no hay una siguiente actividad, se pasa al siguiente grupo
        if(nextModel === undefined) {

            for(var i = 1; i < 4; i++){
                var nextGroupIndex = window.collections.activityGroups.indexOf(collection.parent) + i;
                var nextGroup = window.collections.activityGroups.models[nextGroupIndex];
                //Si no hay otro grupo despues del actual
                if(nextGroup === undefined){
                    nextModel = undefined;
                    break;
                }else{
                    nextModel = nextGroup.getCollection().models[0];
                    //Si en el siguiente grupo no hay ninguna actividad se debe continuar, de lo contrario se deja de buscar
                    if(nextModel !== undefined)
                        break;
                }
            }
        }
        this.currentActivity.set('completed', true);
        //Si de la busqueda anterior no se obtivo ninguna actividad disponible
        if(nextModel === undefined){
            CSLP.message.warning('No hay mas actividades disponibles');
        }else{
            nextModel.set('locked', false);
            this.changeActivity(nextModel);
        }

    },

    renderActivityInfo : function() {

        //Render Titulo
        $('#activity-title').html(this.currentActivity.get('name'));

        //Agregando la info de los objetivos
        var txtLista = "<hr><ul>";
        var rules = this.currentActivity.get("rules");
        for(var rule in rules) {

            var isCritic = (rules[rule].condition === 1) ? '*' : '';

            if(rule == "correct_result" && rules[rule].values != null) {
                txtLista += "<li>" + rulesToText[rule] + ": " + rules[rule].values.join(',') + " (" + rules[rule].points + " pts)" + isCritic + "</li>"
            } else {
                txtLista += "<li>" + rulesToText[rule] + " (" + rules[rule].points + " pts)" + isCritic + "</li>"

            }
        }
        txtLista += "</ul>";

        //Render panel de recursos
        this.$('#resources-panel').html(this.currentActivity.get('resource') + txtLista);
//        this.$('#resources-panel').html($('#activity-' + this.currentActivity.get('id') + '-resource').html() + txtLista);

        //Limpiar la consola
        window.consolePanel.clear();

        var toolboxInfo = this.currentActivity.get('toolbox');
        if(toolboxInfo !== undefined) {
            var toolboxType = (toolboxInfo.blocks !== undefined) ? 'blocks' : 'categories';
            window.blocklyPanel.changeToolbox(toolboxInfo.type, toolboxType,toolboxInfo[toolboxType]);
        }else{
            window.blocklyPanel.changeToolbox('all', 'categories');
        }

        window.blocklyPanel.clear();
        //Render intial blockly blocks
        if(this.currentActivity.get('answer'))
            window.blocklyPanel.addInitialBlocks(Blockly.Xml.textToDom(this.currentActivity.get('answer')));

        //Render JS Code
        window.codePanel.updateCode();

        //Envia las reglas al tester
        window.codeTester.setRules(this.currentActivity.get('rules'));

    },

    //Reajusta el tama�o del panel de trabajo en razon del tama�o de la ventana
    resize : function() {
        var height = this.jWindow.height() - this.jFrame.offset().top;

        this.jFrame.height(height);

        window.blocklyPanel.resize();
    },

    //Muestra o esconde el mensaje de loading
    setLoading : function(bool) {
        if(bool) {
            this.$('.loading-container').addClass('active');
        } else {
            this.$('.loading-container').removeClass('active');
        }
    },

    /**
     * EVEMTS
     */

    //Acctivado cuando se clickea algun de los tabs para cambiar de panel
    panelChange : function(event) {
        var tab = $(event.currentTarget);
        if(!tab.hasClass('active')) {
            $('.work-panel').toggleClass('active');
            $('#panel-selector > span').toggleClass('active');

            //Ocultando la barra de herramientas de blockly
            if(tab.attr('data-target') == '#blockly-panel') {
                $('.blocklyToolboxDiv').show();
            } else {
                $('.blocklyToolboxDiv').hide();
                window.codePanel.updateCode();
            }
        }
    },

    //Ejecuta el codigo
    runCode : function(event) {
        window.consolePanel.clear();

        if(this.bySteps) {
            this.disableStepCheck(true);
            window.blocklyPanel.parseCode();
            $('#execution-controls').addClass('running');
        } else {
            window.blocklyPanel.runCode();
        }

        //Quita el focus del btn para que pueda cerrarse el tooltip
        $(event.currentTarget).blur();

    },

    //Bloquea el ajustador de tama�o
    resizerLock : function(event) {
        if(this.isHResizerLocked === false || this.isVResizerLocked === false) {
            this.isHResizerLocked = true;
            this.isVResizerLocked = true;
            this.$el.css('cursor', 'default');
        }
    },

    //Realiza el movimiento del tama�o de los sections, y otorga el nuevo tama�o en porcentages a cada uno
    resizePanel : function(event) {
        //Ajusta el tama�o horizontal de los paneles
        if(this.isHResizerLocked === false) {
            var xPercent = (event.pageX / this.$el.width()).toFixed(4) * 100;

            this.$('.frame-content-right').css('width', (100 - xPercent) + '%');

            //Ajusta el tama�o del panel de blockly en base al nuevo ancho establecido
            //Blockly se ajusta solo cuando se lanza un evento de resize en el window
            window.dispatchEvent(new Event('resize'));

            return false;
        }

        //Ajusta el tama�o vertical de los paneles
        if(this.isVResizerLocked === false) {
            var rightFrame = this.$('.frame-content-right');
            //Obtiene la posicion del cursor relativa al frame derecho
            var yPosition = event.pageY - rightFrame.offset().top;

            yPosition = (yPosition < 0) ? 0 : yPosition;

            //Obtiene el porcentaje relativo
            var yPercent = (yPosition / rightFrame.height()).toFixed(4) * 100;

            yPercent = (yPercent < 6) ? 6 : yPercent;
            yPercent = (yPercent > 94 ) ? 94 : yPercent;

            //Asigna cada porcentaje a los respectivos paneles
            this.$('#resources-panel').css('height', yPercent + '%');
            this.$('#output-panel').css('height', (100 - yPercent) + '%');

            //Posiciona la barra
            this.$('.v-resizer-bar').css('top', yPercent + '%');
        }
    },

    //Libera el ajustador de tama�o horizontal
    hresizerUnlock : function(event) {
        this.isHResizerLocked = false;
        this.$el.css('cursor', 'e-resize');
    },

    //Libera el ajustador de tama�o vertical
    vresizerUnlock : function(event) {
        this.isVResizerLocked = false;
        this.$el.css('cursor', 's-resize');
    },

    //Detiene la ejecucion por pasos
    stopExecution : function(event) {
        window.blocklyPanel.highlightBlock(null);
        //Habilitar checkbox
        this.disableStepCheck(false);
        $('#execution-controls').removeClass('running');
        document.getElementById('btn-step').disabled = 'disabled';

        //Quita el focus del btn para que pueda cerrarse el tooltip
        $(event.currentTarget).blur();
    },

    parseCode : function() {
        window.blocklyPanel.parseCode();
    },

    runStep : function(event) {
        var response = window.blocklyPanel.stepCode();
        //Si la respuesta es falsa significa que ya no quedan mas pasos que realizar
        if(!response) {
            //Habilitar ceckbox
            this.disableStepCheck(false);
            $('#execution-controls').removeClass('running');
            document.getElementById('btn-step').disabled = 'disabled';
        }

        //Quita el focus del btn para que pueda cerrarse el tooltip
        $(event.currentTarget).blur();
    },

    //Activa/Desactiva la opcion de correr el codigo por pasos
    toggleBySteps : function() {
        this.bySteps = (this.bySteps) ? false : true;
        $('#execution-controls').toggleClass('by-step');
    }
});